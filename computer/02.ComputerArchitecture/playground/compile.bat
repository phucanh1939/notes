g++ ./src/branching/ifelse.cpp -o ./out/branching/ifelse_ARM
g++ -S ./src/branching/ifelse.cpp -o ./out/branching/ifelse_ARM.s
g++ -S ./src/branching/for.cpp -o ./out/branching/for_ARM.s
g++ -S ./src/branching/switch.cpp -o ./out/branching/switch_ARM.s
