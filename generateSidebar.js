const fs = require('fs');
const path = require('path');

const docsDir = path.join(__dirname, 'docs');
const sidebarFile = path.join(__dirname, 'sidebars.js');

function getSortedSidebar(dir) {
  let items = fs.readdirSync(dir).map((item) => {
    const fullPath = path.join(dir, item);
    const isDirectory = fs.statSync(fullPath).isDirectory();
    return { name: item, path: fullPath, isDirectory };
  });

  // Filter out non-Markdown files and "Assets" folders
  items = items.filter(item => {
    if (item.isDirectory) return item.name !== 'Assets'; // Ignore "Assets" folder
    return item.name.endsWith('.md'); // Only keep Markdown files
  });

  // Sort: Folders first, then files (both alphabetically)
  items.sort((a, b) => {
    if (a.isDirectory && !b.isDirectory) return -1;
    if (!a.isDirectory && b.isDirectory) return 1;
    return a.name.localeCompare(b.name);
  });

  return items.map((item) => {
    if (item.isDirectory) {
      return {
        type: 'category',
        label: item.name,
        items: getSortedSidebar(item.path),
      };
    } else {
      return path.relative(docsDir, item.path).replace(/\.md$/, '');
    }
  });
}

// Generate the sidebar structure
const sidebarContent = `module.exports = {
  tutorialSidebar: ${JSON.stringify(getSortedSidebar(docsDir), null, 2)}
};\n`;

// Write to sidebars.js
fs.writeFileSync(sidebarFile, sidebarContent);

console.log('✅ Sidebar generated successfully! Ignored non-Markdown files and "Assets" folders.');
