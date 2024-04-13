CREATE DATABASE  IF NOT EXISTS `wordopia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wordopia`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: wordopia
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `postId` varchar(500) NOT NULL,
  `title` varchar(449) NOT NULL,
  `author` varchar(45) NOT NULL,
  `content` mediumtext NOT NULL,
  `likes` int NOT NULL DEFAULT '0',
  `likedUsers` json NOT NULL,
  PRIMARY KEY (`postId`),
  KEY `userID_idx` (`author`),
  CONSTRAINT `userID` FOREIGN KEY (`author`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('longlostAuthor_I Wandered Lonely as a Cloud','I Wandered Lonely as a Cloud','longlostAuthor','I wandered lonely as a cloud\r\nThat floats on high o\'er vales and hills,\r\nWhen all at once I saw a crowd,\r\nA host, of golden daffodils;\r\nFluttering and dancing in the breeze.',2,'[\"test1\", \"longlostAuthor\"]'),('longlostAuthor_SOCIAL ENGINEERING:','SOCIAL ENGINEERING:','longlostAuthor','●	Social engineering is a form of manipulation that exploits human psychology to gain access to sensitive information, systems, or physical spaces. \r\n●	Unlike traditional hacking methods that focus on exploiting technical vulnerabilities, social engineering relies on deception and the manipulation of individuals to achieve its objectives.\r\n●	It is a non-technical method often used to bypass security measures through human interaction.\r\n●	Social engineering attacks can be sophisticated and take advantage of human tendencies such as trust and helpfulness. \r\n',2,'[\"test1\"]'),('piii_The Untold Story OF Shinchan','The Untold Story OF Shinchan','piii','Once upon a time in the colorful town of Kasukabe, there lived a mischievous and energetic little boy named Shinchan. Shinchan Nohara was known for his eccentric personality, cheeky grin, and his love for adventure. His days were filled with laughter, pranks, and endless enthusiasm.\r\n\r\nOne sunny morning, Shinchan woke up with a sparkle in his eyes. He had a feeling that today was going to be an extraordinary day. Little did he know that his ordinary routine would soon turn into an extraordinary adventure.\r\n\r\nShinchan\'s day began as usual – with his mother, Misae, nagging him to finish his breakfast and get ready for school. As he reluctantly put on his school uniform, he couldn\'t help but think about the excitement that awaited him outside the walls of his classroom.\r\n\r\nAt school, Shinchan\'s best friends, Kazama, Nene, and Bo-chan, eagerly joined him in his antics. Together, they created chaos in the classroom, much to the chagrin of their teacher, Miss Yoshinaga. Shinchan\'s signature move, the \"elephant dance,\" had the entire class in splits.\r\n\r\nDuring the lunch break, Shinchan convinced his friends to skip the cafeteria food and embark on a quest for the perfect snack. The group sneaked into the school kitchen, leaving behind a trail of giggles and mischief. They discovered a hidden stash of sweets and snacks, and with glee, they devoured their loot.\r\n\r\nAs the afternoon sun painted the sky in warm hues, Shinchan\'s adventure continued. The friends decided to explore the mysterious woods on the outskirts of Kasukabe. Rumors had it that the woods were haunted, but Shinchan was undeterred. With his friends by his side, he fearlessly ventured into the unknown.\r\n\r\nThe woods turned out to be a treasure trove of surprises – from hidden caves to secret passages. Shinchan\'s imagination ran wild, and he regaled his friends with tales of pirates, treasure hunts, and wild creatures. They stumbled upon a peculiar-looking tree that seemed to have a face carved into its bark, and Shinchan couldn\'t resist having a conversation with it.\r\n\r\nAs the day unfolded, Shinchan and his friends encountered challenges, solved mysteries, and shared countless laughs. The sun began to set, casting a warm glow over the town. Shinchan realized that the ordinary day he had anticipated had become extraordinary indeed.\r\n\r\nAs they emerged from the woods, the friends felt a sense of accomplishment and camaraderie. The adventure had brought them closer, and they knew that the memories they had created would last a lifetime.\r\n\r\nBack home, as Shinchan lay in bed reflecting on the day, he couldn\'t help but feel grateful for the ordinary magic that surrounded him. His town, his friends, and his family made every day an adventure worth living. With a satisfied smile, Shinchan drifted off to sleep, eager for the new adventures that awaited him in the colorful town of Kasukabe.',1,'[\"samed\"]'),('RMH_Doraemons Time-Traveling Adventure','Doraemons Time-Traveling Adventure','RMH','Once upon a time in the quaint town of Nobita, a young boy named Nobita Nobi was facing the typical challenges of a schoolboy. He was struggling with his studies, bullied by his classmates, and constantly late for school. Little did Nobita know that his life was about to take a magical turn with the arrival of a robotic cat from the 22nd century – Doraemon.\r\n\r\nDoraemon, a blue, round-shaped cat with a pouch on his belly, came to Nobita\'s aid with a variety of futuristic gadgets from his 4D pocket. One day, Doraemon pulled out a peculiar-looking time machine, and with a mischievous glint in his eyes, he proposed a daring adventure to Nobita.\r\n\r\n\"Let\'s go on a time-traveling journey, Nobita! We can fix all your problems by visiting the past and the future,\" Doraemon exclaimed, waving the time machine around.\r\n\r\nNobita, always up for an adventure, eagerly agreed. The duo set the time machine to their first destination – Ancient Japan. As they landed in a serene village surrounded by cherry blossoms, Nobita marveled at the beauty of the past. Doraemon explained that they were there to learn from wise samurais and gain insights on discipline and focus.\r\n\r\nThroughout their journey, Doraemon and Nobita visited various historical eras, learning valuable lessons and having thrilling adventures. In medieval times, they helped a kind-hearted knight save his kingdom from an evil sorcerer. In the Renaissance period, they collaborated with Leonardo da Vinci on a new invention. Each time they returned to the present, Nobita found himself transformed – more confident, smarter, and resilient.\r\n\r\nHowever, their time-traveling escapades were not without challenges. In one instance, they accidentally altered a significant event in history, leading to unforeseen consequences. Together, they had to fix the timeline and restore balance to the world.\r\n\r\nAs the duo continued their adventures, Doraemon noticed a change in Nobita\'s character. The once shy and timid boy had grown into a courageous and resourceful young man. Realizing that their journey was coming to an end, Doraemon decided to surprise Nobita with a visit to the future – his own future.\r\n\r\nIn the year 2199, Nobita was astonished to see his future self leading a successful life. He was a renowned scientist who had invented gadgets to make the world a better place. Overwhelmed with emotion, Nobita thanked Doraemon for the incredible journey that had shaped his destiny.\r\n\r\nWith a heartfelt farewell, Doraemon and Nobita returned to their own time. As Nobita stepped out of the time machine, he looked around at his familiar surroundings with newfound appreciation. The experiences shared with Doraemon had not only transformed him but had also created a bond that transcended time.\r\n\r\nThe tale of Doraemon and Nobita\'s time-traveling adventure became a legend in the town of Nobita, inspiring generations to come. And so, with a pocket full of gadgets and a heart full of memories, Doraemon continued his mission of making Nobita\'s life extraordinary, one adventure at a time.',2,'[]'),('test1_Cooking Lessons ','Cooking Lessons ','test1','\r\n\r\n“That’s it petal, just push down a smidge more and it should cut right the way through it.”\r\n\r\nMam’s standing above me as I’m trying to hack through the biggest potato the world’s ever seen. I’m sweating bullets at this point but she’s having none of it.\r\n\r\n“Can’t you just do it, Mam?”\r\n\r\nI’m absolutely knackered. I’ve been stabbing at this thing for (no joke) fifteen minutes but she just will not take it off me.\r\n\r\nI’m not sure why this isn’t working ‘cos usually when I’m doing stuff wrong, she’ll tell me she’ll just do it herself in that mardy voice she puts on when she thinks I’m being daft.\r\n\r\nRight now, though she’s getting on like she’s had a complete personality transplant, the way she’s talking to me. ‘Petal,’ for a start. She’s not called me that since primary school.\r\n\r\n“Well done, doll!” She laughs and beams at me so wide that I can see the two gold fillings on her back teeth.\r\n\r\nFreaky.\r\n\r\nThank God I’ve managed to get to the other side of the mega potato though.\r\n\r\n“Right. Next step,” she says, “What does it say on the paper?”\r\n\r\nChrist. Looks like I’m not getting out of helping with the whole meal then. I never even said I wanted to learn to cook so I’ve no idea where she’s pulled this from.\r\n\r\nI reach over the bowl of limp potatoes and slide the recipe over to our end of the dining table.\r\n\r\n“Erm. It’s saying to chop and… dice the onions and then, simmer them over a low heat.”\r\n\r\nNot sure what the hell dice means but I’m not about to look like an idiot and ask.\r\n\r\n“Pass us the big knife then love.” She says.\r\n\r\nI get up on the step stool and pull a knife out the wooden block behind the kettle. Weird. The big knife must be in the dishwasher.\r\n\r\nI’ve decided I don’t care if she’s acting mental. At least she’s being nice.\r\n\r\nShe’s looking at me like I’m meant to go all Ratatouille on this onion but I’ve genuinely not a clue where to start. Pretty sure I’ve seen her take this weird layer of paper off before she cuts it up normally. Yeah. I’m just gonna start with that.\r\n\r\nEw. There’s a horrible slimy layer underneath it that feels like when you’ve wiped your nose with the same tissue too many times.\r\n\r\n“Has it gone off?” I ask.\r\n\r\nShe looks at me all sour and puts her damp hair up in a bobble.\r\n\r\n“No, it’s meant to be like that. Come on, love, get a shift on, I’d like to eat sometime this month.”\r\n\r\nGuess I’m just slicing straight into this bad boy then. I’m just gonna cut it up exactly like the potato. It’s basically the same thing. Same shape, anyway. Mam’s busy trying to find the meatballs in the back of the freezer (they’ve all rolled out of the packet ‘cos someone ((Big Daz)) didn’t put the cling film on properly when they put it back) so I’m really going mental with the onion while her back’s turned. I’ve managed to hack it into big chunks like the potato, but they don’t look much like dice to me yet. Maybe if I cut them into really small cubes they’ll look better.\r\n\r\nRight. Sorted. Looks fine to me.\r\n\r\n“Christ, be careful! You’re going to slice your finger off doing it like that!” she shouts.\r\n\r\nI can tell she’s regretting doing this now but she’s the one that was insisting that I need to learn how to cook and that now’s as good a time as any. I would say that as soon as I get home from school is the worst possible time to do anything.\r\n\r\n“Don’t stress, it’s fine.” I push the pile of onions towards her, holding up my unmaimed fingers as proof of just how fine everything is.\r\n\r\nShe’s doing that sort of pale smile that Our Elaine calls Mam’s stretchy smile. ‘Cos it sort of stretches her lips out to where you can’t really see them anymore. That’s usually how I know she’s really about to lose it with me. God. I hope Our Elaine gets let out of netball early. At least then there’ll be two of us to boss around.\r\n\r\nMam’s banging around in the stuff drawer looking for matches now. She’s not gonna find them though ‘cos I gave the last pack to Liam Miller’s lad when he came knockin’ on askin’ if we had any spare cigs.\r\n\r\nOh God. I’ll blame it on Our Elaine if she really gets up my arse about it.\r\n\r\nShe slams the stuff drawer so hard I can hear next door’s cabinets rocking against the shared wall.\r\n\r\n“Go and get Daz’s lighter out his jeans pocket, will you?” she says.\r\n\r\nThank God for Big Daz and his filthy habits.\r\n\r\n“Where are they?” I ask.\r\n\r\n“Just get them will you, Soph, Christ’s sake.”\r\n\r\nShe’s gritting her teeth now but she’s still smiling. She looks as if she’s about to burst a blood vessel the way she’s grabbing onto the counter. She’s scaring me a bit now actually, she’s not normally this intense about stuff.\r\n\r\nI fast walk into the hallway. Daz’s jeans are crumpled up near the top of the stairs for some reason. Weird. He’s usually such a freak about his stuff being in the right place.\r\n\r\n“Sophie!” Mam shouts from the kitchen. “You don’t need to go all the way up the stairs to get a lighter that’s in the hallway, do you? Hurry up!”\r\n\r\nDon’t have time to solve this mystery right now. I don’t want a hiding from Mam.\r\n\r\nI fish the lighter out Big Daz’s scruffy pocket and run back to the kitchen. Mam’s clattering pans about and shoving drawers in and out like she’s getting paid for it.\r\n\r\n“Soph?” She puts all her pans down and turns round to face me. “Do you know how to light the hob, petal?”\r\n\r\nShe’s still got her stretchy smile on. Only now there’s sad in her eyes, not frustration. Christ. I really hope Our Elaine gets back soon. She’s better at talking than me when Mam gets like this.\r\n\r\nI’m also crossing my fingers that Big Daz doesn’t get back from work before Elaine comes home ‘cos Mam’s been mega fumin’ at him recently. Elaine says she knows why but she gets on like I’m too young to understand when I ask her what’s been goin’ on. I reckon’ that means she doesn’t actually know though.\r\n\r\n“I think so, Mam.” I flick the lighter up and down four times before it finally sets the hob going.\r\n\r\nThank God.\r\n\r\n“Right. Olive oil.” Mam’s voice is shaking now. I think she might be crying? “Chop chop Soph, you’ve got to learn to stand on your own two feet ‘cos I won’t be around forever you know.”\r\n\r\nWhat’s she talking about? I’m properly scared now. She never normally gets like this in the day.\r\n\r\nI grab the olive oil and start pouring. “Mam? Are you okay?”\r\n\r\n“I’m fine Soph! Why wouldn’t I be fine?” she snaps. She holds her fingers up like I did before. I think she’s trying to make me laugh so I force out an anxious giggle.\r\n\r\n“Onions.” She points towards the pan and then turns her back to me. I shove them into the pan and the oil spits in my face so much that I almost go flying off my step stool.\r\n\r\nI get down and wipe my face on a tea-towel whilst Mam isn’t looking still. I don’t want her to think I’ve done it wrong ‘cos that’ll make her angry mental instead of sad mental.\r\n\r\nShe’s holding onto the counter so hard her fingertips are turning white, and her shoulders are shaking up and down like she’s shrugging a coat off.\r\n\r\n“Mam?”\r\n\r\nThe way she whips her head round it’s like she’s forgot I was there.\r\n\r\nThe stretchy smile is gone now, and her eyes are massive and red.\r\n\r\nNormally, when Elaine or Big Daz are in, they send me upstairs at this point ‘cos they don’t want me to see Mam going soft.\r\n\r\nIt’s probably fine. It’s not like she’s gonna hurt me. It’s just Mam but soft.\r\n\r\n“Let’s eat what we’ve got, eh! I’m ravenous!” she says.\r\n\r\nWhat we’ve got is four dry potatoes and some hard onions. But I don’t want her to get even more soft so I’m just gonna get on like I agree with her.\r\n\r\n“Okay.”\r\n\r\nShe grabs the hot pan off the hob and neatly pours the oily onions into four little piles on the dining room table.\r\n\r\nRight. Guess we’re not doing plates then.\r\n\r\nShe’s pointing at me to put the potatoes with the onions but when I go to do it, she slaps my hand away.\r\n\r\n“Sophie! For Christ’s sake!” she snaps. “Put them at the side, not on top. We’re not heathens.”\r\n\r\nI really hope Our Elaine gets home soon. I’d even take Big Daz at this point. I just don’t want to be alone with her anymore.\r\n\r\nShe sits down in front of one of the mush piles and pats the seat next to her.\r\n\r\nOh God.\r\n\r\nI’m really scared now. I’ve never seen her this bad.\r\n\r\n“Now you can cook! You’ll be right as rain on your own. I mean, it really would have been better to teach Our Elaine but she’s God knows where…”\r\n\r\nI’m not even sure she’s talking to me at this point. She’s not looking at me. She’s getting on like she’s telling the chopping board all about our cooking lesson.\r\n\r\n“Mam?”\r\n\r\nHer head snaps up.\r\n\r\n“Sophie!” There’s tears in her eyes again now. “I don’t want you to think less of me.”\r\n\r\n“What do you mean, Mam?” My eyes are watering, and the back of my throat is stinging like it does when I eat a Toxic Waste.\r\n\r\nI go and sit next to her.\r\n\r\nI can hear my heart beating in my ears. “It’s all fine. Let’s just eat our tea, yeah?” I tell her.\r\n\r\nShe can’t say daft things if her mouth’s full.\r\n\r\nShe grabs my face and stares at me with the red eyes. “Fine.” She sighs. I don’t know how she’s doing it but she’s crying without moving her face.\r\n\r\nI’m so scared.\r\n\r\nMam’s pushing the mush around in different directions with her pinkie fingers now, making different shapes on the dining table.\r\n\r\nI can hear someone unlocking the door.\r\n\r\nThank God.\r\n\r\n“Sorry I’m late back, Miss James didn’t let us out ‘till quarter past!” Elaine is shouting from the porch. “I’m just gonna have a quick shower, I’m sweating bollocks!”\r\n\r\nAs soon as she starts up the stairs Mam stops pushing her potato pile around and slams her hands down on the table.\r\n\r\n“Elaine! Come down, Mam needs you for something!” I shout. The way we’re sat means I’m in the corner next to the lamp so I can’t get past Mam to get to the stairs. I really hope Our Elaine can hear me. I can’t stand this much longer.\r\n\r\nSomething’s really up with Mam’s eyes. She looks exactly like Liam Miller’s dog did before it tore up that rabbit.\r\n\r\nShe stands up so fast she sends her chair flying into the lamp.\r\n\r\nOh God. There’s glass bits all over the floor now but she doesn’t seem to care ‘cos she’s just run straight through them all to get to the stairs.\r\n\r\n“Elaine!” she’s screaming now. I don’t think I’ve ever heard anyone sound like this.\r\n\r\n“What?” Elaine’s shouting back down to her now, she sounds like she’s panicking a bit.\r\n\r\nThen she screams. Elaine this time, not Mam. I can tell it’s Elaine ‘cos she used to scream right loud like that whenever Georgie from next door would bring his pet snake out its cage.\r\n\r\nThis scream is different though. She sounds as if a hundred pet snakes have just crawled out from out the bathroom walls and bit her right in the face.\r\n\r\nI can hear Mam running up the stairs to Elaine, but I can’t go anywhere ‘cos there’s a million shards of glass in the way.\r\n\r\nChrist.\r\n\r\nI reckon I can reach the tea-towel drawer from here. I think if I put them all out on top of each other like a red carpet it won’t wreck my feet.\r\n\r\nI wonder how fuming Big Daz would be if I called him at work.\r\n\r\nI hop onto my tea towel carpet and jump straight back off into the hallway.\r\n\r\nGot away with that, I think.\r\n\r\nOh God. What the hell is going on?\r\n\r\nElaine is in absolute hysterics, but I can’t hear a thing she’s saying ‘cos she’s crying too much.\r\n\r\nI’m in the hall now. In my head I’m running but whenever I take a step it feels like I’ve got super glue on the bottom of my socks.\r\n\r\nNow I’ve finally made it to the bottom of the stairs I can hear Mam talking. She’s stopped screaming now and she’s pleading with Elaine about something in this really creepy sounding crackly whisper.\r\n\r\n“Elaine. I love you, petal! I love you all. Please!” she says.\r\n\r\n The super glue sticks me down to the bottom of the stairs. Whatever’s in the bathroom is the reason I wasn’t allowed to get changed out my uniform when I got home from school.\r\n\r\nI’ve never ever heard Elaine like this. She’s usually so grown up about everything but right now she sounds about five years old. You can’t sound like that if you’re just being daft. Something’s really wrong.\r\n\r\nI don’t know what to do. I can’t tell if calling Big Daz will make it worse or not. I also can’t remember if they reconnected the house phone after Mam wouldn’t pay that man who came round from BT who she thought was a scammer.\r\n\r\nRight.\r\n\r\nI need to know what’s happening before I even think about trying to call anyone.\r\n\r\nI’m just gonna do it in bursts. I think that’ll make it easier.\r\n\r\nOk.\r\n\r\nRight. That’s ten steps done.\r\n\r\nFive.\r\n\r\nThen the last three.\r\n\r\nI shove Big Daz’s jeans out the way and stand at the top of the landing. Mam and Elaine are all the way at the other end of the hallway next to the bathroom.\r\n\r\nElaine’s sitting rocking herself back and forwards outside the bathroom door and Mam’s stood over her just staring at her. She’s doing that mental silent cry that you only normally see in films.\r\n\r\nOh God.\r\n\r\nI can see it now.\r\n\r\nI’m right close to the bathroom an’ I can see it now.\r\n\r\nIt’s Big Daz.\r\n\r\nHe’s sat up but he looks kind of floppy. One of his arms is hanging over the bath and the other one is behind his back. He doesn’t have any jeans on, and the Big Knife is sat on the floor next to him. There’s blood on everything.\r\n\r\nOh God.\r\n\r\nI look at Mam and then back at Daz and then back at Mam again.\r\n\r\nI think I’m gonna be sick.\r\n\r\n“Sophie!” Elaine jumps up and wraps her arms around my head.\r\n\r\n“Don’t look Soph. Don’t look. Don’t look.” She says into my hair.\r\n\r\nOh God. I can hear myself screaming but it doesn’t feel like it’s me doing it. I feel like I’m watching myself from out of my body. I watch as I vomit all over Elaine’s shoulder and down her back.\r\n\r\nShe’s shaking me now, saying we have to leave. That we’re not safe here and we have to get out the house. Mam’s just been staring at us, crying motionlessly.\r\n\r\nShe can’t have done this. Does she not feel anything? Why isn’t her face moving? How has she just watched me chop up that potato knowing Big Daz was up here dead this whole time? When did she kill him? Was he already dead when I got home?\r\n\r\nI want to ask her, but I can’t move my mouth. I can’t seem to move anything.\r\n\r\nElaine stops shaking me now and throws me over her shoulder. She walks us both as fast as she can to the end of the landing but before she reaches the top of the stairs Mam’s sprints to block the top of the stairs.\r\n\r\nShe’s holding the Big Knife.\r\n\r\nElaine screams again and throws me down on the landing behind her.\r\n\r\n“Mam! Look at me, please! You’re not well! We don’t blame you, Mam! We all saw how he treated you!” Elaine’s practically screaming this in her face, but Mam just walks straight past her and stands at the very top of the stairs.\r\n\r\nWhen she finally speaks, she doesn’t turn to face us.\r\n\r\n“At least you won’t go hungry” she says.\r\n\r\nShe holds the knife pointy side up and lets her knees go floppy all the way down to the bottom of the stairs. \r\n',2,'[\"test1\", \"longlostAuthor\"]'),('test1_fall','fall','test1','..',1,'[\"test1\"]'),('test1_How to start a stroy','How to start a stroy','test1','.',1,'[\"test1\", \"RMH\"]'),('test1_The Enchanted Lighthouse','The Enchanted Lighthouse','test1','Once upon a time, in a quaint coastal village named Serenity Bay, there stood a mysterious lighthouse that captured the hearts and imaginations of the villagers. The lighthouse, known as the \"Whispering Beacon,\" was said to possess magical powers that only revealed themselves to those with pure intentions.\r\n\r\nThe protagonist of our story, a young fisherman named Elias, lived on the outskirts of Serenity Bay. Elias had always been fascinated by the tales surrounding the Whispering Beacon, passed down through generations. One stormy night, as the rain lashed against the village and the waves roared with fury, Elias found himself drawn to the flickering light of the magical lighthouse.\r\n\r\nDriven by curiosity and a sense of adventure, Elias braved the tempest and reached the base of the Whispering Beacon. To his amazement, the lighthouse\'s glow intensified as if recognizing the purity within him. A soft, melodic hum filled the air, and Elias felt an invisible force guiding him to a hidden door at the lighthouse\'s base.\r\n\r\nWith a hesitant touch, Elias pushed open the door and entered a mystical chamber bathed in an ethereal glow. The room was adorned with ancient symbols and shelves filled with enchanted objects. At the center stood an ancient sea nymph, guardian of the Whispering Beacon, named Celestia.\r\n\r\nCelestia revealed the lighthouse\'s purpose—to protect the village from sea monsters and guide lost ships to safety. However, the magic that powered the lighthouse was fading, and it needed a pure-hearted soul to rekindle its strength. Elias, chosen by the Whispering Beacon itself, accepted the responsibility.\r\n\r\nGuided by Celestia, Elias embarked on a quest to collect rare ingredients required to renew the lighthouse\'s magic. Along the way, he encountered mythical creatures, solved riddles, and formed unlikely alliances. Each challenge brought him closer to his goal, and Elias discovered the true power of kindness and courage.\r\n\r\nAs the last ingredient was placed within the Whispering Beacon, a radiant light enveloped Serenity Bay. The storm ceased, and the sea monsters retreated into the depths. The villagers, once fearful, now looked upon Elias with gratitude.\r\n\r\nIn recognition of his bravery, Elias was appointed the keeper of the Whispering Beacon. From that day forward, the lighthouse stood as a symbol of hope and protection for Serenity Bay. Elias continued his life as a fisherman, but his heart forever carried the magic of the enchanted lighthouse.\r\n\r\nAnd so, the tale of Elias and the Whispering Beacon became a cherished legend, shared by generations, reminding the villagers that even in the darkest storms, a single act of kindness could illuminate the path to a brighter tomorrow.',1,'[\"test1\"]'),('test1_words','words','test1','..',0,'[]');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-13 15:25:46
