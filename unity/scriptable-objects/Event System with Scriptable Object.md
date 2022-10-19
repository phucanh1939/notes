# Event System with Scriptable Object

## What is an Event System

Event System help modularize your code by sending messages between systems that do not directly know about each other.
They allow things to respond to an event (Ex. When player get hit, When player die, When player enter a room, etc.)

## Why do I need an Event System

- Reduce code dependencies.

Example.

```c#

// Without event system, Player class need to know about SoundManager, HealthBar, Enemy to do all stuffs

class PlayerController
{
    public SoundManager soundManager;
    public HealthBar healthBar;
    public Enemy enemy;

    private float _hp;

    public void getHit(float damage)
    {
        // Update hp (data)
        _hp -= damage;

        // Play sound
        soundManager.playSoundEffect("GetHit.mp3");

        // Update UI: text, health bar
        healthBar.updateUI(_hp);

        // Other stuff (Ex. Enemy will stop attacking when player hp < 10)
        if (_hp < 10)
        {
            enemy.stopAttacking();
        }
    }
}

// With event System, Player class don't need to know about other classes, just raise an event

class PlayerController
{
    private float _hp;

    public void getHit(float damage)
    {
        // Update hp (data)
        _hp -= damage;
        
        // Raise event get hit
        EventSystem.RaiseEventPlayerGetHit(hp);
    }
}

class SoundManager
{
    public void OnPlayerGetHit(float hp)
    {
        PlaySFXGetHit();
    }
}

class HealBar
{
    public void OnPlayerGetHit(float hp)
    {
        UpdateUI();
    }
}

class Enemy
{
    public void OnPlayerGetHit(float hp)
    {
        if (hp < 10)
        {
            StopAttacking();
        }
    }
}

```

## How to implement

