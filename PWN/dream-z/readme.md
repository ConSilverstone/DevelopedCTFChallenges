# Dream Z Metadata
**Year of Creation:** 2026  
**Author(s):** Connor Gallagher (ConSilverstone)  
**Challenge Name:** dream-z  
**Category:** PWN  
**Difficulty:** Medium    

## Description:   
ZZZzz.

nc 10.0.0.44:22

<details>
<summary>Hint 1:</summary>
Whoever the user was did not think dreams were worth protecting. 
</details>
<details>
<summary>Hint 2:</summary>
You'll need to write a script within the cow's dreams to find success. 
</details>
  
<details>
<summary>Solution & Flag</summary>
Solution: Secure shell connection that can be bruteforced as the password is weak (password123!) to gain access. Either by a lucky guess or using Hydra. Good example on <a href="https://www.geeksforgeeks.org/linux-unix/how-to-use-hydra-to-brute-force-ssh-connections/"> geeksforgeeks</a>.
<details>
<summary>Example</summary>
hydra -L user.txt (containing username Dreamer) -P /usr/share/wordlists/rockyou.txt 10.0.0.44 ssh -t 4  
</details>
Couple plain text files can be found providing cryptic hints on how to progress. Details where the flag can be found. *root* of the (linux, NOT root's home directory) tree is flag.txt. It references the MooSay vulnerablity but says the cow cannot speak. Suggesting it is not that program but something very similar.
  
Once entry has been retrieved the find command can be used to reveal unusal file permissions and cross reference unexpected files using [GTFOBins](https://gtfobins.org/GTFO) MooThink is available to the user but Perl is not. Fortunately cowthink inherits functionally from perl making it vulnerable to filereads past permissions. Designed to be a twist on the classic command inject attacks MooSpeak could cause when unprotected. Writting a perl script MooThink can be instructed to execute the perl file which can contain terminal instuctions to track down and read the flag.txt file. Revealing the flag.
<details>
<summary>Example</summary>
Command needed (Assumed from Dreamers home folder):  
cowthink -f /Dreamer/home/script.pl x
  
Then inside script.pl have:  
system("cat /root/flag.txt")  
</details>

Flag: LTDH26{3lectr1c_Sh33p}  
</details>