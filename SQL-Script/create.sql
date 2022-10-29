-- sqlcmd -S "(localdb)\MSSQLLocalDB" -i .\create.sql

-- DROP DATABASE IF EXISTS ShoeStore;

-- CREATE DATABASE IF NOT EXISTS ShoeStore;
USE ShoeStore;


/*create table IF NOT EXISTS Brands
(
    Id          int identity
        constraint PK_Brands
            primary key,
    Name        nvarchar(max) not null,
    Priority    int           not null,
    Description nvarchar(max),
    Created     datetime2     not null,
    Edited      datetime2     not null
)
go
*/
SET IDENTITY_INSERT Brands ON;
go

INSERT INTO Brands (Id, Name, Priority, Description, Created, Edited) VALUES (1, N'New Balance', 1, null, N'2022-09-28 23:59:52.0000000', N'2022-09-28 23:59:52.0000000');
INSERT INTO Brands (Id, Name, Priority, Description, Created, Edited) VALUES (2, N'Nike', 1, null, N'2022-09-28 23:59:57.0000000', N'2022-09-28 23:59:57.0000000');
INSERT INTO Brands (Id, Name, Priority, Description, Created, Edited) VALUES (3, N'Saucony', 1, null, N'2022-09-29 00:00:05.0000000', N'2022-09-29 00:00:05.0000000');
INSERT INTO Brands (Id, Name, Priority, Description, Created, Edited) VALUES (4, N'Asics', 1, null, N'2022-09-29 00:00:13.0000000', N'2022-09-29 00:00:13.0000000');
INSERT INTO Brands (Id, Name, Priority, Description, Created, Edited) VALUES (5, N'Brooks', 1, null, N'2022-09-29 00:00:22.0000000', N'2022-09-29 00:00:22.0000000');

SET IDENTITY_INSERT Brands OFF;
go

/*create table IF NOT EXISTS Categories
(
    Id          int identity
        constraint PK_Categories
            primary key,
    Name        nvarchar(max) not null,
    DisplayName nvarchar(max),
    Description nvarchar(max),
    ParentId    int
        constraint FK_Categories_Categories_ParentId
            references Categories
)
go

create index IX_Categories_ParentId
    on Categories (ParentId)
go*/
SET IDENTITY_INSERT Categories ON;
go

INSERT INTO Categories (Id, Name, DisplayName, Description, ParentId) VALUES (1, N'women-running-shoes', N'women-running-shoes', null, null);
INSERT INTO Categories (Id, Name, DisplayName, Description, ParentId) VALUES (2, N'men-running-shoes', N'men-running-shoes', null, null);
INSERT INTO Categories (Id, Name, DisplayName, Description, ParentId) VALUES (3, N'men-trail-running-shoes', N'men-trail-running-shoes', null, null);

SET IDENTITY_INSERT Categories OFF;
go

/*create table IF NOT EXISTS Colors
(
    Id       int identity
        constraint PK_Colors
            primary key,
    Name     nvarchar(max) not null,
    Priority int           not null
)
go*/
SET IDENTITY_INSERT Colors ON;
go

INSERT INTO Colors (Id, Name, Priority) VALUES (1, N'Eclipse/Vibrant Apricot/Vibrant Pink', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (2, N'Black/Violet Haze/Steel', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (3, N'Light Cyclone/Virtual Sky', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (4, N'Black/Cyclone', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (5, N'Wave Blue/Virtual Sky', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (6, N'Black/White', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (7, N'Virtual Sky/Bleached Lime Glo', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (8, N'Grey/Yellow/Orange', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (9, N'Black/Anthracite/Hyper Violet', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (10, N'Old Royal/White/Black/Racer Blue', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (11, N'White/Metallic Gold/Siren Red', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (12, N'Smoke Grey/Mint Foam/Dusty Sage', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (13, N'White/Particle Grey/Kumquat Photon Dust', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (14, N'Wolf Grey/White/Photo Blue/Black', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (15, N'Black/Aura/Dark Grey/Wolf Grey', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (16, N'Space/Razzle', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (17, N'Shadow/Quartz', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (18, N'Total Orange/Obsidian/Signal Blue', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (19, N'Chicago', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (20, N'Chengdu Marathon', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (21, N'Blue Raz/Acid', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (22, N'White/Black/Vizired', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (23, N'Black/Goldstruck', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (24, N'Nite Lite', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (25, N'Carrier Grey/Pure Silver', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (26, N'Black/Blue/White', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (27, N'Orchid/Dive Blue', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (28, N'Mako Blue/Barely Rose', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (29, N'White/Sea Glass', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (30, N'Lake Drive/Hazard Green', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (31, N'Mako Blue/French Blue', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (32, N'Black/Blackened Pearl/Blue', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (33, N'Peacoat/Blissful Blue', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (34, N'Black/Blue/Orange', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (35, N'Navy/Stellar/White', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (36, N'Black/Ombre/Metallic', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (37, N'Black/Pearl/Peach', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (38, N'Black/Turquoise', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (39, N'Titan/Teal/Grey', 1);
INSERT INTO Colors (Id, Name, Priority) VALUES (20, N'Chengdu Marathon', 1);

SET IDENTITY_INSERT Colors OFF;
go

/*create table IF NOT EXISTS Sizes
(
    Id    int identity
        constraint PK_Sizes
            primary key,
    Unit  nvarchar(max) not null,
    Value float         not null
)
go*/
SET IDENTITY_INSERT Sizes ON;
go

INSERT INTO Sizes (Id, Unit, Value) VALUES (1, N'US', 7);
INSERT INTO Sizes (Id, Unit, Value) VALUES (2, N'US', 7.5);
INSERT INTO Sizes (Id, Unit, Value) VALUES (3, N'US', 8);
INSERT INTO Sizes (Id, Unit, Value) VALUES (4, N'US', 8.5);
INSERT INTO Sizes (Id, Unit, Value) VALUES (5, N'US', 9);
INSERT INTO Sizes (Id, Unit, Value) VALUES (6, N'US', 9.5);
INSERT INTO Sizes (Id, Unit, Value) VALUES (7, N'US', 10);
INSERT INTO Sizes (Id, Unit, Value) VALUES (8, N'US', 10.5);
INSERT INTO Sizes (Id, Unit, Value) VALUES (9, N'US', 11);
INSERT INTO Sizes (Id, Unit, Value) VALUES (10, N'US', 11.5);
INSERT INTO Sizes (Id, Unit, Value) VALUES (11, N'US', 12);
INSERT INTO Sizes (Id, Unit, Value) VALUES (12, N'US', 12.5);
INSERT INTO Sizes (Id, Unit, Value) VALUES (13, N'US', 13);
INSERT INTO Sizes (Id, Unit, Value) VALUES (14, N'US', 13.5);
INSERT INTO Sizes (Id, Unit, Value) VALUES (15, N'US', 14);
INSERT INTO Sizes (Id, Unit, Value) VALUES (16, N'US', 14.5);
INSERT INTO Sizes (Id, Unit, Value) VALUES (17, N'US', 15);

SET IDENTITY_INSERT Sizes OFF;
go

/*create table IF NOT EXISTS Shoes
(
    Id          int identity
        constraint PK_Shoes
            primary key,
    Name        nvarchar(max) not null,
    Priority    int           not null,
    Active      bit           not null,
    Description nvarchar(max),
    Features    nvarchar(max),
    Note        nvarchar(max),
    Created     datetime2     not null,
    Edited      datetime2     not null,
    BrandId     int
        constraint FK_Shoes_Brands_BrandId
            references Brands,
    CategoryId  int
        constraint FK_Shoes_Categories_CategoryId
            references Categories
)
go

create index IX_Shoes_BrandId
    on Shoes (BrandId)
go

create index IX_Shoes_CategoryId
    on Shoes (CategoryId)
go*/
SET IDENTITY_INSERT Shoes ON;
go

INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (1, N'New Balance Fresh Foam X 880v12 - Womens Running Shoes', 1, 1, N'The New Balance Fresh Foam X 880v12 women''s running shoes provide ever-reliable support for you to reach your fitness goals. <br><br>A soft double jacquard mesh upper with a traditional lacing system ensures a secure and breathable fit. <br><br>The dual-density midsole with Fresh Foam X provides a plush feel right out-of-the-box and a responsive sensation on footstrike. <br><br>A grippy outsole offers road-ready durability for you to stay quick and comfortable on your feet from everyday runs to rigorous training on the road. <br><br>- Glide over any distance with the comfort and support you need to enjoy every run <br>- Double jacquard mesh upper for a structured yet airy feel <br>- Reflective elements<br>- Buttery-smooth landings and energetic toe-off from Fresh Foam X midsole <br>- Protected feel at the high-stress zones of the heel<br>- Ideal blend of durability and grip from the blown rubber outsole', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">New Balance Fresh Foam X</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">10mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">237g / 8.4oz</div></div>', null, N'2022-09-28 23:59:52.0000000', N'2022-09-28 23:59:52.0000000', 1, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (2, N'New Balance Fresh Foam 880v11 - Womens Running Shoes', 1, 1, N'The New Balance Fresh Foam 880v11 women’s running shoes are your go-to for everyday training, providing all comfort and zero distractions. <br><br>A neutral running shoe you can trust in every stride, it keeps you motivated to lace up from its head-turning looks to its soft and springy ride.  <br><br>Wrapping your feet in a double-jacquard mesh upper, it provides a blend of high breathability and structure – keeping your active feet feeling cool and supported. It offers a soft, non-restrictive fit for a free-feeling sensation as you rule the road. <br><br>A moulded heel counter hugs securely to your rearfoot to reduce heel-slippage, ensuring a smooth and effortless feel. <br><br>Injected with Fresh Foam X, it delivers a confidence-inspiring ride with premium cushioning technologies in a lightweight package. It’s a winning fusion of softness and responsiveness to make easy work of your daily mileage.<br> <br>Softer blown rubber is strategically placed at the forefoot of the outsole. A denser rubber in the heel strike zone increases the lifespan of your ever-reliable running shoe. <br><br>- Your trustworthy ride to log daily mileage in comfort<br>- Upgraded with a breathable double-jacquard mesh upper for a more spacious forefoot and supportive midfoot fit<br>- Modern, textured upper design to turn heads<br>- Lacing system for a personalised, locked-in fit <br>- Moulded external heel counter secures your heel in place like a seatbelt <br>- Cradles your feet in the next level of comfort with a soft moulded footbed<br>- Rolls over the Fresh Foam X cushioning from NB’s premium running shoes for a plush yet responsive ride<br>- Strategic densities of outsole rubber for responsiveness and road-worthy durability - ensuring a long-term partnership you can count on', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">New Balance Fresh Foam X</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">10mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">247g / 8.7oz</div></div>', null, N'2022-09-28 23:59:53.0000000', N'2022-09-28 23:59:53.0000000', 1, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (3, N'New Balance Fresh Foam 880v11 - Mens Running Shoes', 1, 1, N'The New Balance Fresh Foam 880v11 men’s running shoes are your go-to for everyday training, providing all comfort and zero distractions. <br><br>A neutral running shoe you can trust in every stride, it keeps you motivated to lace up from its head-turning looks to its soft and springy ride.  <br><br>Wrapping your feet in a double-jacquard mesh upper, it provides a blend of high breathability and structure – keeping your active feet feeling cool and supported. It offers a soft, non-restrictive fit for a free-feeling sensation as you rule the road. <br><br>A moulded heel counter hugs securely to your rearfoot to reduce heel-slippage, ensuring a smooth and effortless feel. <br><br>Injected with Fresh Foam X, it delivers a confidence-inspiring ride with premium cushioning technologies in a lightweight package. It’s a winning fusion of softness and responsiveness to make easy work of your daily mileage.<br> <br>Softer blown rubber is strategically placed at the forefoot of the outsole. A denser rubber in the heel strike zone increases the lifespan of your ever-reliable running shoe. <br><br>- Your trustworthy ride to log daily mileage in comfort<br>- Upgraded with a breathable double-jacquard mesh upper for a more spacious forefoot and supportive midfoot fit<br>- Modern, textured upper design to turn heads<br>- Lacing system for a personalised, locked-in fit <br>- Moulded external heel counter secures your heel in place like a seatbelt <br>- Cradles your feet in the next level of comfort with a soft moulded footbed<br>- Rolls over the Fresh Foam X cushioning from NB’s premium running shoes for a plush yet responsive ride<br>- Strategic densities of outsole rubber for responsiveness and road-worthy durability - ensuring a long-term partnership you can count on', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">New Balance Fresh Foam X</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">10mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">298g / 10.5oz</div></div>', null, N'2022-09-28 23:59:53.0000000', N'2022-09-28 23:59:53.0000000', 1, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (4, N'New Balance 413 - Mens Running Shoes', 1, 1, N'The New Balance 413 men’s running shoes wrap your feet in a classic, everyday trainer without excess bulk. <br><br>The synthetic and mesh upper creates a lightweight ride without skimping on durability. You get versatile traction from the rubber outsole to take your runs from street to treadmill. <br><br>- Budget-friendly everyday running shoe<br>- Classic feel and athletic fit <br>- Lightweight synthetic/mesh upper <br>- Durable construction <br>- Saddle support <br>- Forefoot pod for step-in comfort<br>- Indoor and outdoor-ready grip from rubber outsole', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">212g / 7.5oz</div></div>', null, N'2022-09-28 23:59:56.0000000', N'2022-09-28 23:59:56.0000000', 1, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (5, N'New Balance Fresh Foam 1080v11 - Womens Running Shoes', 1, 1, N'Lace up in the next evolution of plush comfort with the New Balance Fresh Foam 1080v11 women’s running shoes. <br><br>Designed to give you a luxurious experience from heel-to-toe, this high mileage running shoe envelops your feet in an Engineered Hypoknit upper for a blend of support and softness. <br><br>It creates an adaptable fit with zonal stretch and sets the bar for breathability, allowing cool air to circulate. Now you can reach your runner’s high without heat and humidity to weigh you down. <br><br>The Ultra Heel design wraps your rearfoot like a seatbelt – allowing your best running shoes and feet to move in harmony, free of heel slippage.<br> <br>A data-driven midsole with Fresh Foam X fuses modern engineering with the iconic feel of its predecessor, the popular 1080v10. The springy, energy-returning sensation lives on in this fresh update. <br><br>All-up it translates to shock-absorbing cushioning in a lightweight package – so you can run free of fatigue for longer as you clock up the kilometres. <br><br>Built on a durable and road-worthy outsole, New Balance haven''t missed a single detail when it comes to your comfort and performance. <br><br>- Premium high mileage running shoes for soft comfort in every stride and every kilometre on the road<br>- Precision-driven engineering creates a running shoe that delivers comfort from every angle<br>- Versatile design - plenty of cushion for easy-going recovery runs and plenty of responsiveness and pop to shift the pace up a gear<br>- Stays true to the popular feel of the 1080v10 while fine-tuning the upper for an even more breathable fit <br>- Engineered Hypoknit upper for just-right softness and stretch<br>- Supportive and secure feel from bootie upper design <br>- Lacing system for a snug and personalised fit <br>- Elevates comfort with an Ortholite sockliner to cradle your hard-working feet<br>- Ultra Heel design creates a snug wrap around your rearfoot<br>- Lightweight Fresh Foam X cushioning dampens hard impacts to keep your feet feeling fresh and energised <br>- Voronoi hexagonal geometries in a head-turning laser pattern to stand out from the pack <br>- Durable rubber extends the lifespan of the outsole to tackle long runs', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Knit</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">New Balance Fresh Foam X</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">8mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">230g / 8.1oz</div></div>', null, N'2022-09-28 23:59:57.0000000', N'2022-09-28 23:59:57.0000000', 1, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (6, N'New Balance Nitrel v4 - Mens Trail Running Shoes', 1, 1, N'The New Balance Nitrel v4 men’s trail running shoes gear you up with an aggressive, adventure-ready ride to tackle everything from hard road surfaces to challenging natural trails. <br><br>The engineered mesh upper wraps your feet in lightweight durability – ensuring it’s tough to tackle all terrain without weighing you down. <br><br>It cradles your feet in a DynaSoft midsole and EVA insert for impact protection and support – no matter where your run takes you. <br><br>The AT Tread outsole provides hard-wearing traction on all terrain types for zero hesitations when you next lace up. <br><br>- Rugged, multi-terrain trail running shoe puts the freedom back into your runs<br>- Lightweight engineered mesh upper locks your foot in durable protection <br>- Textile/synthetic material<br>- No-sew overlays<br>- EVA insert for a cushioned feel and support underfoot<br>- DynaSoft midsole transforms hard landing into smooth transitions <br>- AT Tread outsole for aggressive, multi-terrain traction on road or trail', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">New Balance Dynasoft</div></div>', null, N'2022-09-28 23:59:57.0000000', N'2022-09-28 23:59:57.0000000', 1, 3);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (7, N'Nike Zoom Fly 4 - Mens Running Shoes', 1, 1, N'The Nike Zoom Fly 4 men’s running shoes are your speed machines to perform at your peak. Nike Flyknit material hugs your ankle with the comfort of a stretchy sock.<br><br>The upper webbing and lacing system work together to allow the shoe to move like an extension of your feet during high-speed training, creating a secure and locked-in fit. <br><br>It ensures the running shoe remains consistently snug as you shift the pace up a gear, ensuring a supportive feel and stability. <br><br>Lightweight, foot-conforming mesh elevates the breathability for zero distractions from sweat. <br><br>Cradling your feet in Nike React technology, it provides a winning formula of resilient and lightweight foam and a propulsive carbon-fibre plate. This allows you to move with responsiveness and flexibility to shed seconds off your personal best. <br><br>- Stretchy Nike Flyknit at the collar provides soft comfort and containment <br>- 4 webbing pieces work with the lacing system to improve midfoot support <br>- Lightweight mesh allows your feet to breathe in every stride<br>- Internal heel pod creates a more locked-in feel compared to the previous model<br>- Lightweight Nike React foam for smooth and snappy transitions <br>- Internal carbon-fibre plate allows you to conquer your training with speed and flexibility', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Nike React</div></div>', null, N'2022-09-28 23:59:57.0000000', N'2022-09-28 23:59:57.0000000', 2, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (8, N'Nike Air Zoom Structure 24 - Mens Running Shoes', 1, 1, N'Tested by hundreds of Nike runners and ready to be the next go-to in your shoe rotation, the Nike Air Zoom Structure 24 men’s running shoes are engineered for a smooth and responsive ride. <br><br>A breathable upper steps up the ventilation in key zones – setting you up with a running shoe so comfy and primed to perform that you can forget about it and simply focus on the road ahead. <br><br>The forefoot Zoom Air unit delivers a snappy experience with propulsive energy return. It works together with the foam midsole to provide a winning formula of cushioning that’s firm, smooth and stable. <br><br>The Crash Pad is strategically placed at the heel, putting runner data into action for effective, targeted cushioning.<br><br>The hard-wearing rubber outosole has the strength to tackle your daily mileage. Flex grooves improve forefoot flexibility for a propulsive feel on toe-off without compromise to the stable platform. <br><br>- Data-driven engineering for long-lasting comfort to log up the kilometres <br>- Breathable engineered mesh keeps heat-prone zones well ventilated for on-the-go cooling<br>- Lacing system creates a snug, personalised lockdown<br>- Plush tongue for enhanced comfort <br>- Durable and soft heel and ankle lining hugs your socks in place without bunching<br>- Moulded heel cups securely to your rearfoot<br>- Energy-returning Zoom Air unit in forefoot<br>- Foam midsole for resilient comfort<br>- Strategically placed Crash Pad for targeted cushioning<br>- Durable rubber outsole to handle the twists, turns and repetitive impacts of daily training <br>- Flex grooves for a snappy, efficient feel at the forefoot <br>- Vertical grooves at the sides maintain stability', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Stability</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Nike Zoom Air</div></div>', null, N'2022-09-28 23:59:58.0000000', N'2022-09-28 23:59:58.0000000', 2, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (9, N'Nike Air Zoom Pegasus 38 - Womens Running Shoes', 1, 1, N'The Nike Air Zoom Pegasus 38 women’s running shoes provide a responsive ride and accommodating fit to run freely. <br><br>A mesh upper keeps your feet in cool, ventilated conditions so sweat won’t weigh you down when your run speeds up. It adapts to your feet by stretching on-the-run for comfort you can count on. <br><br>A more spacious forefoot ensures your toes can splay naturally – they never feel squashed or restricted in any way. <br><br>The resilient Nike React foam is identical to its predecessor, so loyal Pegasus runners can enjoy the same snappy and bouncy sensation this running shoe family is known for. <br><br>The Zoom Air unit ensures a springy stride, strategically placed nearer to your foot for a propulsive feel. Road-ready durability ensures this is a top running shoe you can lace up in again and again. <br><br>- Plush and breathable mesh upper has the strength to tackle your training on the road and allows your feet to breathe <br>- Midfoot webbing for a secure fit, allowing the shoe and your feet to move in harmony<br>- Padded tongue for a cushioned feel <br>- Roomier toe area without compromise to the overall fit <br>- Lightweight Nike React foam for a responsive and resilient ride <br>- Zoom Air unit boosts the bounce factor <br>- Packs in more foam to elevate cushioning without feeling bulky <br>- Durable ride for training on the road', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Nike Zoom Air</div></div>', null, N'2022-09-29 00:00:01.0000000', N'2022-09-29 00:00:01.0000000', 2, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (10, N'Nike Wildhorse 7 - Mens Trail Running Shoes', 1, 1, N'Turn unstable and rugged terrain into smooth and snappy transitions with the Nike Wildhorse 7 men’s trail running shoes. <br><br>Built for challenging technical trails, it wraps your feet in a durable upper with strategic zones of breathability and support. <br><br>It keeps nature like dirt and debris out of your trail shoe where you can enjoy it thanks to the gaiter collar wrapping your ankle. <br><br>It cradles your feet in responsive midsole cushioning to keep you inspired in every stride. You’ll spring into your off-road runs with plush Nike React foam delivering that ultra-smooth feel. <br><br>The outsole is reinforced in key zones with high-abrasion rubber and features multi-directional lugs for uphill and downhill traction. <br><br>- Smooth, durable ride to turn tough trails into your personal runway<br>- Durable skins reinforce the toe to tackle challenging trails<br>- Upper wraps your feet in breathable mesh so heat and humidity won’t interfere with your performance<br>- Supportive upper fit <br>- Gaiter collar creates a shield to prevent natural debris from entering your trail shoes<br>- Heel utility tab makes it fast and easy to get in and out<br>- Lightweight Nike React foam for snappy and durable cushioning <br>- Additional cushioning at the rearfoot for protection at this high-impact zone <br>- Dynamic Fit System provides midfoot support on unstable technical trails <br>- Segmented rock plate creates a barrier against rugged, natural surfaces<br>- High-abrasion rubber lugs provide multi-directional grip to bite into challenging terrain', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Nike React</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">22.5mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">14.5mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">8mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">328.4g / 11.14oz </div></div>', null, N'2022-09-29 00:00:01.0000000', N'2022-09-29 00:00:01.0000000', 2, 3);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (11, N'Nike React Infinity Run Flyknit 3 - Mens Running Shoes', 1, 1, N'The Nike React Infinity Run Flyknit 3 men’s running shoes get you closer to your running goals with a smooth and stable sensation underfoot to conquer any distance. <br><br>A soft and airy upper with Flyknit technology keeps you feeling locked-in without compromise to flexibility. Nike React technology delivers a propulsive feel to make fast work of challenging runs. <br><br>The specialised rocker sole design encourages smooth and efficient movement throughout all phases of your running gait. <br><br>- Flexible Flyknit upper design with strategic areas of breathability and support <br>- Flyknit technology increases midfoot support <br>- Soft, padded ankle collar and heel <br>- Nike React technology for a protected yet snappy feel <br>- High levels of cushioning stacked beneath the foot<br>- Wider base for enhanced stability <br>- Game-changing rocker sole for smooth and efficient movement from footstrike to the toe-off phase <br>- Boosts the outsole rubber for road-ready grip and durability', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Nike React</div></div>', null, N'2022-09-29 00:00:02.0000000', N'2022-09-29 00:00:02.0000000', 2, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (12, N'Nike React Pegasus Trail 4 - Mens Trail Running Shoes', 1, 1, N'The Nike React Pegasus Trail 4 men’s trail running shoes let you spread your wings on your running routine by making the trail accessible and tameable to give a new life to running. <br><br>A data-driven engineered mesh upper provides a lightweight and supportive fit. Offering high ventilation and reinforced at the toes, it delivers a blend of breathability and durability to unlock your potential off-road. <br><br>The lacing system and Flywire technology allows you to fine-tune the support of the midfoot for a locked-in fit. Lightweight and resilient Nike React foam creates a propulsive sensation underfoot and keeps your runs energised. <br><br>Based on the needs of real-world trail blazers, the traction pattern provides zoned grip to keep you sure-footed and stable on challenging and rocky terrain. <br><br>Transforming uneven terrain to a smooth ride with the traction properties, this is a trail running shoe you can trust in on rugged environments. <br><br>- Breathable and trail-ready engineered mesh upper <br>- Toe area reinforced for durability<br>- Supportive and secure fit thanks to Flywire technology and midfoot band <br>- Snappy and lightweight Nike React technology <br>- Rubber outsole with targeted traction where you need it most <br>- Outsole extends up the forefoot as a barrier against abrasions', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Nike React</div></div>', null, N'2022-09-29 00:00:03.0000000', N'2022-09-29 00:00:03.0000000', 2, 3);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (13, N'Saucony Echelon 8 - Womens Running Shoes', 1, 1, N'The Saucony Echelon 8 women’s running shoes deliver a joy-inspiring ride with a balance of stability and cushioning. <br><br>The FORMFIT construction accommodates flat or voluminous feet and orthotics with ease – so your feet get the support they need without feeling squashed or restricted in anyway. <br><br>Springy PWRRUN cushioning keeps your feet feeling fresh for longer, making long miles feel shorter and more effortless. <br><br>A road-ready Tri-Flex outsole makes it a go-to for your everyday training with the flexibility and adaptability you need to run naturally. <br><br>- Accommodating ride for flat or voluminous foot types<br>- Compatible with your orthotics<br>- Vegan <br>- Recycled upper materials keep your carbon footprint lighter on the environment<br>- FORMFIT construction provides a secure yet spacious fit <br>- 3D heel counter locks in your rearfoot so your running shoe and feet move in harmony <br>- Stable feel from lightweight midfoot support panel <br>- Durable Tri-Flex outsole with extra flexibility in the right places', N'<div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Saucony PWRRUN</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">35mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">27mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">8mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">309g / 10.8oz</div></div>', null, N'2022-09-29 00:00:05.0000000', N'2022-09-29 00:00:05.0000000', 3, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (14, N'Saucony Triumph 19 - Womens Running Shoes', 1, 1, N'The Saucony Triumph 19 women’s running shoes are your luxurious neutral ride with a feather-light feel and softness underfoot to love every minute you’re laced up. <br><br>Motivating you in every stride, the breathable mono-mesh upper keeps you feeling light and airy, so you never feel weighed down by heat or sweat.<br><br>Foot-conforming FORMFIT creates a precise, supportive fit, making the running shoe move like an extension of your body. <br><br>PWRRUN+ cradles your feet in ultra-plush cushioning in a weight-saving package to spring into your running workouts. It''s built on the XT-900 outsole for durability from the ground up to tackle long distances. <br><br>- Superb comfort and buttery-smooth feel for your everyday runs and clocking up high mileage<br>- Stylish design with suede details to look at home crushing miles on the road <br>- Crafted with recycled materials to keep your footprint lighter on the environment<br>- Engineered mono-mesh upper for lightweight breathability<br>- Upgraded with a more precise, adaptive fit <br>- Topsole for close-to-foot cushioning <br>- FORMFIT with 3D comfort allows your feet and shoes to move in harmony <br>- Lightweight, soft and springy PWRRUN+ cushioning<br>- Hard-wearing XT-900 outsole for road-ready performance', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Saucony PWRRUN+</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">32.5mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">24.5mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">8mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">259g / 9.1oz</div></div>', null, N'2022-09-29 00:00:06.0000000', N'2022-09-29 00:00:06.0000000', 3, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (15, N'Nike Air Zoom Terra Kiger 7 - Mens Trail Running Shoes', 1, 1, N'The Nike Air Zoom Terra Kiger 7 men’s trail running shoes offer lightweight stability to trade in the concrete jungle for the real wild. <br><br>Trail blazers will gravitate towards this rugged ride for its combination of speed and comfort. <br><br>The adventure-ready upper provides a blend of breathability and security to coast over rocky trails.<br> <br>Responsive Nike React foam delivers resilient and lightweight cushioning. The strategically placed forefoot Zoom Air unit creates an energy-returning ride. <br><br>The outsole is reinforced in key zones with high-abrasion rubber and features multi-directional lugs for uphill and downhill traction. <br><br>- Lightweight stability to unleash your inner trail blazer <br>- Ventilated and supportive mesh/synthetic upper <br>- Padded collar wraps softly to your foot with a sleek, bulk-free fit <br>- Soft, pressure-reducing tongue accommodates the natural swelling of your feet during endurance trail runs<br>- Lightweight Nike React foam for snappy and durable cushioning <br>- Energy-returning Zoom Air unit for an effortless feel<br>- Dynamic Fit System provides midfoot support on unstable technical trails <br>- Hard-wearing outsole with multi-directional lugs<br>- High-abrasion rubber at rearfoot reinforces this critical zone', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Nike React, Nike Zoom Air</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">16.5mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">4mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">309g / 10.91oz </div></div>', null, N'2022-09-29 00:00:06.0000000', N'2022-09-29 00:00:06.0000000', 2, 3);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (16, N'Saucony Endorphin Speed 3 Chicago - Mens Running Shoes', 1, 1, N'Here to represent. It’s time to set your race pace on fire with the Chicago-inspired Endorphin Speed 3.<br><br>Welcome to the Windy City. Inspired by the Chicago flag, this exclusive Endorphin Speed 3 is here to race on one of the world’s biggest stages. Red stars and trims that match the surrounding rivers and lakes. This is for Chicago.<br><br>The Saucony Endorphin Speed 3 men’s running shoes combine an ultra-smooth ride with unparalleled speed. The engineering and geometry of this seriously fast running shoe has been upgraded for a snappier and springier sensation to cut seconds off your PB. <br><br>Saucony have fine-tuned the engineered mesh upper, delivering a supportive and distraction-free fit. They’ve also overhauled the winged plate for explosive acceleration and support during high-speed training sessions. <br><br>Run longer and faster with less effort thanks to SPEEDROLL technology. It promotes a smooth rocking motion to propel you into your next stride while preserving your energy.<br><br>Two pieces of PWRRUN PB foam reduce energy wastage on footstrike to convert it into propulsive forward momentum. <br><br>The TRIFLEX outsole creates a flexible platform and provides trustworthy grip to accelerate your performance in preparation for race day. <br><br>- Your ultimate partnership for daily speed training and crushing your PB in up-tempo runs on the lead up to race day<br>- Supportive and comfortable engineered mesh upper<br>- SPEEDROLL technology for smoother, more effortless transitions and a propulsive feel<br>- Shock-absorbing and energy-returning PWRRUN PB foam <br>- Redesigned S-curve winged nylon plate keeps your foot central on the platform and elevates support  <br>- Durable and flexible TRIFLEX outsole to meet the demands of your speed training', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Saucony PWRRUN pb</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">36mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">28mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">229g / 8.3oz</div></div>', null, N'2022-09-29 00:00:07.0000000', N'2022-09-29 00:00:07.0000000', 3, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (17, N'Saucony Endorphin Pro 3 Panda - Mens Road Racing Shoes', 1, 1, N'The Saucony Endorphin Pro 3 men’s road racing shoes deliver competition-ready and confidence-inspiring speed for everything from your next 5K race to marathon. Now available in a limited edition Chengdu Marathon colourway. <br><br>Taking inspiration from the Panda Capital of the world, the Chengdu Marathon Endorphin Pro 3 is outlined in a giant panda graphic upper, fur accent in the heel and conservation details on the heel of the midsole. Packaging includes a custom box, with a panda face graphic and bamboo inspired tissue to complete the look. <br><br>They’re engineered for lightweight comfort with a breathable mesh upper that allows heat and humidity to escape - keeping your feet cool and fresh from the starting blocks to the finish line. <br><br>The FORMFIT design provides a foot-conforming fit so you never have to worry that your ultra-fast running shoes will fly off without you. <br><br>Saucony load up on more PWRRUN PB foam cushioning with a redesigned midsole providing a higher stack height. It takes the fast, responsive feel you love about the previous generation and amplifies it for satisfying pop. <br><br>Alongside being a lightweight and resilient compound, running with PWRRUN PB cushioning offers pure excitement and comfort on race day. It teams up with the energy-returning S-curve carbon-fibre plate to create a springy sensation that supports record-breaking pace.  <br><br>Run longer and faster with less effort thanks to SPEEDROLL technology. It gears you up with an aggressive toe spring, promoting a smooth rocking motion to propel you into your next stride while preserving your energy.<br><br>By reducing the depth of the outsole material and using strategically placed cut-outs to save weight, Saucony have created an outsole that works in harmony with the thick, protective and responsive midsole.<br><br>Featuring XT-900 rubber, the outsole creates a hard-wearing platform underfoot and provides high-speed traction to blast past the competition. <br><br>- Saucony’s racing ‘super shoe’ – packing in more cushioning and speed at a lighter weight<br>- Your ultimate partnership for leading the pack in 5K events to your next marathon <br>- FORMFIT provides a personalised fit and secure lockdown to shed seconds off your PB <br>- Lightweight single-layered engineered mesh upper creates an airy and distraction-free ride <br>- Thin tongue and minimal heel counter add to the fast, race-ready feel and fit <br>- Maximises the stack height to accommodate even more soft and snappy PWWRUN PB foam underfoot <br>- SPEEDROLL technology for smoother, more effortless transitions and a propulsive feel<br>- S-curve carbon-fibre plate to soar swiftly over the road and minimise fatigue – allowing you to perform more consistently over long distances<br>- Carbon plate runs the full length of the running shoe for explosive momentum<br>- XT-900 carbon rubber reinforces the outsole in high-wear zones to extend the lifespan of your go-to racing shoes and provide competition-ready traction', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral, Lightweight</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Saucony PWRRUN pb</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">39.5mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">31.5mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">204g / 7.2oz</div></div>', null, N'2022-09-29 00:00:08.0000000', N'2022-09-29 00:00:08.0000000', 3, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (18, N'Saucony Endorphin Shift 2 - Mens Running Shoes', 1, 1, N'The Saucony Endorphin Shift 2 men’s running shoes roll speed and comfort into an effortless ride. <br><br>The breathable mesh upper with FORMFIT keeps you locked-in on the platform, allowing your feet and shoes to move in harmony. Recycled materials in the upper reduce your carbon footprint while maximising your comfort. <br><br>A weight-saving heel counter hugs securely to your rearfoot and anti-slip laces create the personalised, distraction-free fit you crave. <br><br>SPEEDROLL technology takes the pressure off your hard-working feet, encouraging a smooth rocking motion to propel you into your next stride with efficiency. <br><br>Paired with the PWRRUN for structured cushioning, the Endorphin Shift 2 cradles you in a plush and responsive sensation underfoot to conquer any distance and everyday training. <br><br>The XT-900 outsole reinforces high-wear zones to extend the lifespan of your go-to road running shoes and provide confidence-inspiring traction. <br><br>- Feel-good fusion of speed and comfort to take your training further and reach your running goals<br>- 3D comfort of FORMFIT creates a secure wrap from all angles<br>- Lightweight and breathable mesh upper crafted with sustainable, recycled materials <br>- Anti-slip laces for a secure, foot-conforming fit<br>- Heel counter holds your rearfoot in place like a seatbelt while shedding non-essential weight <br>- SPEEDROLL technology for smoother, more effortless transitions and a propulsive feel <br>- Springy EVA-based PWRRUN cushioning for softer landings and shock absorption <br>- Hard-wearing XT-900 outsole with road-ready traction', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Saucony PWRRUN</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">38mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">34mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">4mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">269g / 10.4oz</div></div>', null, N'2022-09-29 00:00:12.0000000', N'2022-09-29 00:00:12.0000000', 3, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (19, N'Saucony Endorphin Pro 3 - Mens Road Racing Shoes', 1, 1, N'The Saucony Endorphin Pro 3 men’s road racing shoes deliver competition-ready and confidence-inspiring speed for everything from your next 5K race to marathon. <br><br>They’re engineered for lightweight comfort with a breathable mesh upper that allows heat and humidity to escape - keeping your feet cool and fresh from the starting blocks to the finish line. <br><br>The FORMFIT design provides a foot-conforming fit so you never have to worry that your ultra-fast running shoes will fly off without you. <br><br>Saucony load up on more PWRRUN PB foam cushioning with a redesigned midsole providing a higher stack height. It takes the fast, responsive feel you love about the previous generation and amplifies it for satisfying pop. <br><br>Alongside being a lightweight and resilient compound, running with PWRRUN PB cushioning offers pure excitement and comfort on race day. It teams up with the energy-returning S-curve carbon-fibre plate to create a springy sensation that supports record-breaking pace.  <br><br>Run longer and faster with less effort thanks to SPEEDROLL technology. It gears you up with an aggressive toe spring, promoting a smooth rocking motion to propel you into your next stride while preserving your energy.<br><br>By reducing the depth of the outsole material and using strategically placed cut-outs to save weight, Saucony have created an outsole that works in harmony with the thick, protective and responsive midsole.<br><br>Featuring XT-900 rubber, the outsole creates a hard-wearing platform underfoot and provides high-speed traction to blast past the competition. <br><br>- Saucony’s racing ‘super shoe’ – packing in more cushioning and speed at a lighter weight<br>- Your ultimate partnership for leading the pack in 5K events to your next marathon <br>- FORMFIT provides a personalised fit and secure lockdown to shed seconds off your PB <br>- Lightweight single-layered engineered mesh upper creates an airy and distraction-free ride <br>- Thin tongue and minimal heel counter add to the fast, race-ready feel and fit <br>- Maximises the stack height to accommodate even more soft and snappy PWWRUN PB foam underfoot <br>- SPEEDROLL technology for smoother, more effortless transitions and a propulsive feel<br>- S-curve carbon-fibre plate to soar swiftly over the road and minimise fatigue – allowing you to perform more consistently over long distances<br>- Carbon plate runs the full length of the running shoe for explosive momentum<br>- XT-900 carbon rubber reinforces the outsole in high-wear zones to extend the lifespan of your go-to racing shoes and provide competition-ready traction', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral, Lightweight</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Saucony PWRRUN pb</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">39.5mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">31.5mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">8mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">204g / 7.2oz</div></div>', null, N'2022-09-29 00:00:13.0000000', N'2022-09-29 00:00:13.0000000', 3, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (20, N'Saucony Endorphin Speed 3 - Mens Running Shoes', 1, 1, N'The Saucony Endorphin Speed 3 men’s running shoes combine an ultra-smooth ride with unparalleled speed. The engineering and geometry of this seriously fast running shoe has been upgraded for a snappier and springier sensation to cut seconds off your PB. <br><br>Saucony have fine-tuned the engineered mesh upper, delivering a supportive and distraction-free fit. They’ve also overhauled the winged plate for explosive acceleration and support during high-speed training sessions. <br><br>Run longer and faster with less effort thanks to SPEEDROLL technology. It promotes a smooth rocking motion to propel you into your next stride while preserving your energy.<br><br>Two pieces of PWRRUN PB foam reduce energy wastage on footstrike to convert it into propulsive forward momentum. <br><br>The TRIFLEX outsole creates a flexible platform and provides trustworthy grip to accelerate your performance in preparation for race day. <br><br>- Your ultimate partnership for daily speed training and crushing your PB in up-tempo runs on the lead up to race day<br>- Supportive and comfortable engineered mesh upper<br>- SPEEDROLL technology for smoother, more effortless transitions and a propulsive feel<br>- Shock-absorbing and energy-returning PWRRUN PB foam <br>- Redesigned S-curve winged nylon plate keeps your foot central on the platform and elevates support  <br>- Durable and flexible TRIFLEX outsole to meet the demands of your speed training', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Saucony PWRRUN pb</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">36mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">28mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">8mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">229g / 8.3oz</div></div>', null, N'2022-09-29 00:00:13.0000000', N'2022-09-29 00:00:13.0000000', 3, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (21, N'Saucony Kinvara 13 - Mens Running Shoes', 1, 1, N'The Saucony Kinvara 13 men’s running shoes are the next generation of fast with a lightweight and record-crushing ride. <br><br>A single-layer mesh upper maximises air circulation for zero distractions from sweat. <br><br>The bevelled midsole lets you soar over the road without any hesitation and features PWRUN cushioning that''s hard-wearing enough to double up as an outsole material. <br><br>This shaves off weight while improving flexibility for a swift and efficient gait from footstrike to the toe-off phase. <br><br>- Outrun the pack with a running shoe engineered for speed <br>- Lightest Kinvara yet to crush your personal best <br>- Vegan <br>- Recycled upper materials create performance running shoes with an eco-friendly edge<br>- Breathable construction <br>- Bevelled midsole with responsive PWRRUN cushioning<br>- Speed contouring in midfoot <br>- Ultra-fast and flexible feel <br>- Strategically placed XT-900 carbon rubber for high-speed traction and improved longevity', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Saucony PWRRUN, Saucony PWRRUN+</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">28.5mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">24.5mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">4mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">213g / 7.2oz</div></div>', null, N'2022-09-29 00:00:13.0000000', N'2022-09-29 00:00:13.0000000', 3, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (22, N'Asics Gel Kayano 28 Platinum - Mens Running Shoes', 1, 1, N'The Asics Gel Kayano 28 Platinum men’s running shoes are the next evolution of a popular high mileage family for neutral runners to overpronators. Designed for road warriors craving the next level of ultra-smooth, soft and stable cushioning, it’s an instant favourite in your fitness rotation. <br><br>The Platinum edition elevates the style of your running wardrobe, offering a head-turning silver colourway with bold metallic details. <br><br>The engineered mesh upper creates a secure and breathable wrap around your hard-working feet for a distraction-free ride. The external heel counter has a lower profile to elevate comfort as you transition through all phases of your gait cycle. <br><br>Updated with the new FlyteFoam Blast midsole, it cradles your feet in a protected yet lively sensation underfoot to empower you during your running workouts. <br><br>Asics have put their biomechanics research into play with gender-specific engineering, reducing the men’s heel drop from the women’s model by 3mm for strategically firmer cushioning. <br><br>Working with the bevelled heel, the rearfoot Gel has been engineered to maintain a consistent pace. This shock-absorbing cushioning technology wards off fatigue during repetitive impacts on hard road surfaces.<br><br>The Dynamic DuoMax support system slows the rate of pronation, stabilising and guiding your motion to minimise the inward roll of your foot and to set you up in an efficient position to toe-off.<br><br>Full-ground contact creates a stable purchase with the road to flow smoothly and effortlessly between strides. It’s built upon a Light AHAR Sponge rubber outsole for road-ready traction and durability. <br><br>- Refreshes a trusted, well-cushioned and stable ride to meet the demands of both new and loyal Kayano runners<br>- Member of the Asics Platinum collection for premium technologies wrapped in a striking silver and metallic colourway<br>- Ideal for longer distances, everyday training and runs at an easy-going pace <br>- Suitable for runners with a lower stride turnover or that land heavily on footstrike and require extra protection<br>- Heel striker and overpronator-friendly engineering <br>- Lightweight engineered mesh upper for structure and breathability without overcomplicating your ride with excess overlays<br>- Lower profile external heel counter enhances comfort, support and fit <br>- New FlyteFoam Blast top layer for protection and responsiveness in a lightweight package<br>- FlyteFoam bottom layer improves plushness closer to the ground<br>- Upgraded rearfoot Gel shape helps reduce braking forces on footstrike to maintain your speed<br>- Forefoot Twist Gel <br>- Dynamic DuoMax support system manages overpronation without being intrusive<br>- Gender-specific 3D Space Construction for improved midsole compression to increase stabilisation on footstrike while maintaining durability <br>- Gender-specific support Trusstic <br>- Strategically firmer cushioning than women’s model with a heel drop that’s 3mm lower<br>- Deep flex grooves at the forefoot for a springy feel on toe-off<br>- Light AHAR (Asics High Abrasion Rubber) reinforces the outsole to prevent your go-to running shoes from breaking down early<br>- Full-ground contact outsole for a smooth and consistent connection with your running surface', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Stability</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Asics FlyteFoam Blast</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">23mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">13mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">10mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">308g / 10.9oz</div></div>', null, N'2022-09-29 00:00:13.0000000', N'2022-09-29 00:00:13.0000000', 4, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (23, N'Asics Gel Nimbus 24 Platinum - Womens Running Shoes', 1, 1, N'The Asics Gel Nimbus 24 women’s running shoes shave off weight from its predecessor to create a distance training shoe that’s even lighter than before, while delivering the plush feel your feet love. <br><br>The engineered mesh upper hugs softly to your feet and the midfoot panel provides flexibility for a natural-feeling stride.<br><br>New FlyteFoam Blast Plus cushioning energises your ride - delivering lightweight shock protection and boosting the responsiveness at the toe-off phase. <br><br>The Asics Lite rubber creates a more eco-friendly, durable and lighter platform when weighed up against traditional rubber outsoles.<br><br>- Soft, smooth and responsive ride for your long distance runs <br>- Lighter than its predecessor to fly over the pavement like you''re running on clouds<br>- Breathable engineered mesh upper for softness and cool air flow <br>- Recycled materials in upper help lighten your carbon footprint without compromise to performance<br>- Reflective elements help you stand out to other road users during your dusk to dawn runs <br>- OrthoLite X-55 sockliner for out-of-the-box comfort<br>- Flexible midfoot panel allows you to engage your feet more fully <br>- Moves in harmony with your feet for efficient and silky-smooth transitions<br>- 3D Space Construction steps up the compression and cushioning qualities and helps manage excess pronation if necessary <br>- Shock-absorbing and lightweight FlyteFoam cushioning <br>- FlyteFoam Blast Plus cushioning wards off fatigue for longer and puts a spring in your stride for a more effortless run <br>- Rearfoot and forefoot Gel technology for consistent impact protection <br>- Trusstic System technology helps create a weight-saving outsole while providing structural integrity <br>- Asics Lite rubber and AHAR outsole rubber for a durable yet lightweight ride', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Asics FlyteFoam Blast Plus</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">28mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">15mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">13mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">252g / 8.9oz (US 7)</div></div>', null, N'2022-09-29 00:00:17.0000000', N'2022-09-29 00:00:17.0000000', 4, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (24, N'Asics Gel Kayano 29 - Womens Running Shoes', 1, 1, N'Lace up in an energetic ride that inspires you to run at your best with the Asics Gel Kayano 29 women’s running shoes. <br><br>Combining the stability of its predecessors with a snappier response, it''s the running shoe your feet have been dreaming about to conquer long distances and everyday training. <br><br>Hugging your feet in an engineered knit upper, it provides breathability for a distraction-free ride as you fly over the road. The main upper material is crafted from a minimum of 50% recycled content for more eco-friendly engineering. <br><br>The updated external heel counter locks the rearfoot in place to allow your favourite running shoes and feet to move in harmony, free of heel slippage. <br><br>This evolution features FlyteFoam Blast Plus cushioning for a lightweight and lively sensation in every stride. The LiteTruss stability system is strategically placed to reduce overpronation, guiding your feet into their most efficient motion path. <br><br>A road-ready outsole with AHARPLUS heel plug creates a durable ride from the ground up to chase your running goals. <br><br>- Flow into your best stride with a smooth combination of stability and cushioning<br>- Ideal partnership for neutral to overpronated foot types<br>- Lightest running shoe in the Kayano family ever <br>- Engineered stretch-knit upper for cool air flow <br>- OrthoLite X-55 sockliner for enhanced comfort<br>- More sustainable sockliner dying process – preserves water and decreases carbon emissions<br>- Reflective details make you more easily seen by other road users at night <br>- 3D Space Construction <br>- Locked-in rearfoot support from low-profile external heel counter <br>- FlyteFoam Blast Plus cushioning creates a lightweight and responsive sensation underfoot<br>- Rearfoot Gel for shock-absorbing compression to turn hard impacts into plush, cloud-soft landings<br>- LiteTruss technology elevates the integrity of the midfoot and provides medial support <br>- AHARPLUS heel plug helps extend the lifespan of your favourite running shoes', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Stability</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Asics FlyteFoam Blast Plus</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">24mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">14mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">10mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">255g / 9oz (US 7)</div></div>', null, N'2022-09-29 00:00:17.0000000', N'2022-09-29 00:00:17.0000000', 4, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (25, N'Asics Gel Kayano 28 - Womens Running Shoes', 1, 1, N'The Asics Gel Kayano 28 women’s running shoes are the next evolution of a popular high mileage family for neutral runners to overpronators. Designed for road warriors craving the next level of ultra-smooth, soft and stable cushioning, it’s an instant favourite in your fitness rotation. <br><br>The engineered mesh upper creates a secure and breathable wrap around your hard-working feet for a distraction-free ride. The external heel counter has a lower profile to elevate comfort as you transition through all phases of your gait cycle. <br><br>Updated with the new FlyteFoam Blast midsole, it cradles your feet in a protected yet lively sensation underfoot to empower you during your running workouts. <br><br>Asics have put their biomechanics research into play with gender-specific engineering, topping off the women’s heel drop with an additional 3mm for strategically plusher cushioning. <br><br>Working with the bevelled heel, the rearfoot Gel has been strategically engineered to maintain a consistent pace. This shock-absorbing cushioning technology wards off fatigue during repetitive impacts on hard road surfaces.<br><br>The Dynamic DuoMax support system slows the rate of pronation, stabilising and guiding your motion to minimise the inward roll of your foot and set you up in an efficient position to toe-off.<br><br>The full-ground contact outsole creates a stable purchase with the road to flow smoothly and effortlessly between strides. It’s built upon a Light AHAR Sponge rubber outsole for road-ready traction and durability. <br><br>- Refreshes a trusted, well-cushioned and stable ride to meet the demands of both new and loyal Kayano runners<br>- Ideal for longer distances, everyday training and runs at an easy-going pace <br>- Suitable for runners with a lower stride turnover or that land heavily on foot strike and require extra protection<br>- Heel striker and overpronator-friendly engineering <br>- Lightweight engineered mesh upper for structure and breathability without overcomplicating your ride with excess overlays<br>- Lower profile external heel counter enhances comfort, support and fit <br>- New FlyteFoam Blast top layer for protection and responsiveness in a lightweight package<br>- FlyteFoam bottom layer improves plushness closer to the ground<br>- Upgraded rearfoot Gel shape helps reduce braking forces on footstrike to maintain your speed<br>- Forefoot Twist Gel <br>- Dynamic DuoMax support system manages overpronation without being intrusive<br>- Gender-specific 3D Space Construction for improved midsole compression to increase stabilisation on footstrike while maintaining durability <br>- Gender-specific support Trusstic <br>- Plus 3 midsole technology boosts heel drop by 3mm (women’s model only) for softer cushioning<br>- Deep flex grooves at the forefoot for a springy feel on toe-off<br>- Light AHAR (Asics High Abrasion Rubber) reinforces the outsole to prevent your go-to running shoes from breaking down early<br>- Full-ground contact outsole for a smooth and consistent connection with your running surface', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Stability</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Asics FlyteFoam Blast</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">25mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">13mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">258g / 9.1oz</div></div>', null, N'2022-09-29 00:00:17.0000000', N'2022-09-29 00:00:17.0000000', 4, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (26, N'Asics Gel Nimbus 24 - Mens Running Shoes', 1, 1, N'The Asics Gel Nimbus 24 men’s running shoes shave off weight from its predecessor to create a distance training shoe that’s even lighter than before, while delivering the plush feel your feet love. <br><br>The engineered mesh upper hugs softly to your feet and the midfoot panel provides flexibility for a natural-feeling stride.<br><br>New FlyteFoam Blast Plus cushioning energises your ride - delivering lightweight shock protection and boosting the responsiveness at the toe-off phase. <br><br>The Asics Lite rubber creates a more eco-friendly, durable and lighter platform when weighed up against traditional rubber outsoles.<br><br>- Soft, smooth and responsive ride for your long distance runs <br>- Lighter than its predecessor to fly over the pavement like you''re running on clouds<br>- Breathable engineered mesh upper for softness and cool air flow <br>- Recycled materials in upper help lighten your carbon footprint without compromise to performance<br>- Reflective elements help you stand out to other road users during your dusk to dawn runs <br>- OrthoLite X-55 sockliner for out-of-the-box comfort<br>- Flexible midfoot panel allows you to engage your feet more fully <br>- Moves in harmony with your feet for efficient and silky-smooth transitions<br>- 3D Space Construction steps up the compression and cushioning qualities and helps manage excess pronation if necessary <br>- Shock-absorbing and lightweight FlyteFoam cushioning <br>- FlyteFoam Blast Plus cushioning wards off fatigue for longer and puts a spring in your stride for a more effortless run <br>- 360-degrees of Gel technology for consistent impact protection <br>- Trusstic System technology helps create a weight-saving outsole while providing structural integrity <br>- Asics Lite rubber and AHAR outsole rubber for a durable yet lightweight ride', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Asics FlyteFoam, Asics FlyteFoam Blast Plus</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">26mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">16mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">10mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">292g / 10.3oz (US 9)</div></div>', null, N'2022-09-29 00:00:18.0000000', N'2022-09-29 00:00:18.0000000', 4, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (27, N'Asics GlideRide 3 - Mens Running Shoes', 1, 1, N'The Asics GlideRide 3 men’s running shoes move in harmony with your feet with a soft Jacquard mesh upper for a secure lockdown of the midfoot – so you can beat your personal best without distractions. <br><br>FlyteFoam Blast technology elevates the cushioning for an ultra-plush and protected feel, working with GUIDESOLE technology to create your smoothest ride yet. <br><br>The curved ‘rocker’ sole design reduces the stress to your lower limbs – encouraging an efficient stride from heel-to-toe. <br><br>The AHAR Sponge Rubber outsole ensures an ever-reliable, long-term running partnership. Full-ground contact offers a consistently seamless experience as you clock up the kilometres. <br><br>- Energise your ride with less effort <br>- Soft and breathable design from Jacquard mesh upper <br>- Recycled materials in upper preserve resources and reduce your carbon footprint<br>- 3D print details enhance stability<br>- Premium technology provides the next generation of smooth and responsive cushioning <br>- New FlyteFoam Blast technology disperses shock on impact and creates a snappy feel during the toe-off phase<br>- Lightweight FlyteFoam Propel cushioning <br>- Energy-saving GUIDESOLE technology for a super smooth and efficient stride<br>- AHARPLUS <br>- AHAR Sponge Rubber outsole provide a stable connection to your running surface with full-ground contact', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Asics FlyteFoam, Asics FlyteFoam Blast</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">6mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">266g / 9.4oz</div></div>', null, N'2022-09-29 00:00:21.0000000', N'2022-09-29 00:00:21.0000000', 4, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (28, N'Brooks Ghost 14 - Mens Running Shoes', 1, 1, N'The Brooks Ghost 14 men’s running shoes empower you to go the extra mile with a winning formula for neutral runners - combining an ultra-smooth ride and pillow-like softness. <br><br>Brooks have taken what Ghost runners love about the previous generations and enhanced it for an all-new level of comfort. <br><br>An engineered mesh upper keeps you locked-in on the platform while ensuring cool and breathable conditions. 3D Fit Print technology provides an adaptive fit with just-right structure and flexibility to put a new personal best in your future without distractions. <br><br>A softer and simpler midsole is made from 100% DNA Loft cushioning, running from heel-to-toe to emphasise the smooth transitions of its predecessors.  <br><br>Coupled with the Plush Transition Zone and Segmented Crash Pad of the outsole, you''ll flow seamlessly from the impact to the toe-off phase. <br><br>All-up the Brooks Ghost 14 is your reliable and super cushioned running companion to enjoy an effortless ride from the ground up.  <br><br>- Even softer and smoother than the previous model to wow both loyal and new Ghost runners <br>- Super comfy and luxurious feel for a distraction-free ride <br>- Engineered mesh upper increases air circulation to conquer long runs <br>- 3D Fit Print technology provides a blend of structure and stretch at the rearfoot and saddle<br>- Full-length DNA Loft midsole transforms hard impacts into buttery-smooth transitions with uncomplicated cushioning<br>- Segmented Crash Pad and Plush Transition Zone encourages more fluid, effortless movement <br>- Hard-wearing rubber outsole extends the lifespan of your go-to running shoes for tackling everyday training on the road', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Brooks DNA Loft</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">24mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">281g / 9.9oz</div></div>', null, N'2022-09-29 00:00:22.0000000', N'2022-09-29 00:00:22.0000000', 5, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (29, N'Brooks Ghost 14 - Womens Running Shoes', 1, 1, N'The Brooks Ghost 14 women’s running shoes empower you to go the extra mile with a winning formula for neutral runners - combining an ultra-smooth ride and pillow-like softness. <br><br>Brooks have taken what Ghost runners love about the previous generations and enhanced it for an all-new level of comfort. <br><br>An engineered mesh upper keeps you locked-in on the platform while ensuring cool and breathable conditions. 3D Fit Print technology provides an adaptive fit with just-right structure and flexibility to put a new personal best in your future without distractions. <br><br>A softer and simpler midsole is made from 100% DNA Loft cushioning, running from heel-to-toe to emphasise the smooth transitions of its predecessors.  <br><br>Coupled with the Plush Transition Zone and Segmented Crash Pad of the outsole, you''ll flow seamlessly from the impact to the toe-off phase. <br><br>All-up the Brooks Ghost 14 is your reliable and super cushioned running companion to enjoy an effortless ride from the ground up.  <br><br>- Even softer and smoother than the previous model to wow both loyal and new Ghost runners <br>- Super comfy and luxurious feel for a distraction-free ride <br>- Engineered mesh upper increases air circulation to conquer long runs <br>- 3D Fit Print technology provides a blend of structure and stretch at the rearfoot and saddle<br>- Full-length DNA Loft midsole transforms hard impacts into buttery-smooth transitions with uncomplicated cushioning<br>- Segmented Crash Pad and Plush Transition Zone encourages more fluid, effortless movement <br>- Hard-wearing rubber outsole extends the lifespan of your go-to running shoes for tackling everyday training on the road', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Brooks DNA Loft</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">24mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">255g / 9oz</div></div>', null, N'2022-09-29 00:00:23.0000000', N'2022-09-29 00:00:23.0000000', 5, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (30, N'Brooks Adrenaline GTS 22 - Mens Running Shoes', 1, 1, N'Effortless runs are in your future with the Brooks Adrenaline GTS 22 men’s running shoes, loading game-changing support technologies into the next evolution of smooth. <br><br>3D Fit Print provides a structured, foot-conforming fit that moves like an extension of your body to reach your runner’s high. <br><br>The 100% DNA LOFT midsole cradles your feet in superb plushness without overcomplicating your ride or compromising on responsiveness. <br><br>The GuideRails holistic support system encourages a more efficient stride for overpronators with unobtrusive support to make easy work of long miles. <br><br>- Stability running shoes to glide over the road with a responsive and silky-smooth ride<br>- Breathable engineered air mesh upper keeps you cool when your running workouts heat up<br>- Innovative use of 3D Fit Print technology allows your feet and running shoes to move as one<br>- 100% DNA LOFT midsole offers super soft, ever-reliable cushioning<br>- GuideRails provide unobtrusive support to minimise overpronation – aligning your body better for a smoother stride<br>- Segmented Crash Pad for more seamless heel-to-toe transitions <br>- Road-ready traction and durability for a distraction-free run', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Stability</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Brooks DNA Loft</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">24mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">289g / 10.2oz</div></div>', null, N'2022-09-29 00:00:23.0000000', N'2022-09-29 00:00:23.0000000', 5, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (31, N'Asics GT-2000 10 - Mens Running Shoes', 1, 1, N'The Asics GT-2000 10 men’s running shoes are your reliable, joy-inspiring ride to keep you on track of your running goals. Staying true to the story of previous generations, they allow moderate overpronators to fly over the concrete jungle with smooth stability and an efficient stride. <br><br>Enveloping your feet in a lightweight engineered knit upper, they allow your feet to breathe and provide support during high mileage runs. The 3D Print design creates a secure fit, allowing your best running shoes to move like an extension of your body. <br><br>The FlyteFoam Propel midsole delivers lively cushioning, providing a responsive rebound to get ahead during your faster runs or to help sustain your momentum at the last phase of your endurance runs. <br><br>The gender-specific 3D Space Construction unit of the midsole emphasises the stability and smooth characteristics of this go-to running shoe. The heel-to-toe drop is 2mm lower than the previous model for a more snappy toe-off without compromising on protection. <br><br>The new LITETRUSS medial support system is the secret weapon of overpronators, providing firmer foam on the medial side to minimise the inward rolling of your feet and improve your running efficiency.<br><br>Celebrating this popular stability shoe family’s 10th birthday, this newest edition features full ground contact geometry for a smooth and consistent purchase with your running surface. <br><br>This creates a distraction-free ride that’s so comfy from heel-to-toe that you can forget about what you’re wearing and focus on the road ahead. <br><br>- Hard-working and energetic running shoes for your everyday training<br>- Overpronator-friendly engineering with a blend of cushioning and stability<br>- Engineered knit upper creates an airy, foot-conforming fit <br>- Minimises use of dyes for more eco-friendly manufacturing practices<br>- Supportive heel counter reduces heel slippage for zero distractions<br>- 3D Print design locks the running shoes in place like a seatbelt <br>- FlyteFoam Propel midsole creates an energy-returning feel for both tempo runs and easy-going long runs - allowing you to push forward and fight off fatigue<br>- Shock-absorbing forefoot and rearfoot Gel for a plusher sensation underfoot<br>- 3D Space Construction unit beneath the forefoot and rearfoot provides gender-specific cushioning<br>- LITETRUSS medial support system increases the integrity of the midfoot and enhances stability to guide your foot onto your most efficient motion path<br>- 8mm drop creates a more natural and efficient feel underfoot<br>- Full ground contact geometry provides a smooth connection with the road and more effortless heel-to-toe transitions<br>- Modified flex grooves allow you to engage your forefoot fully for an efficient toe-off<br>- Road-ready outsole with durable AHARPLUS heel to tackle nearly any running workout at any distance', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Stability</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Knit</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Asics FlyteFoam Propel</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">22mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">14mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">8mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">275g / 9.7oz</div></div>', null, N'2022-09-29 00:00:24.0000000', N'2022-09-29 00:00:24.0000000', 4, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (32, N'Brooks Adrenaline GTS 21 - Mens Running Shoes', 1, 1, N'Celebrating its 21st birthday, the Brooks Adrenaline GTS 21 men''s running shoes deliver the overpronator-friendly support and adaptive cushioning you know and love from the previous generation, but with a softer and smoother ride that feels like it was made purely for your feet. <br><br>Hugging softly to your feet with Engineered Air Mesh and 3D Fit Print, the Adrenaline GTS 21 offers a foot-conforming fit and provides a blend of breathability, structure and flexibility to move naturally. <br><br>Brooks have taken their premium cushioning formula to the next level, running their super soft and responsive DNA LOFT all the way from heel to forefoot. This translates to plusher landings and smoother heel-to-toe transitions – empowering you to run more efficiently and freely without fatigue setting in. <br><br>BioMoGo DNA cushioning lets you flow into your running workouts as if it were an extension of your body’s natural shock absorption. It personalises to your stride and adapts to accommodate the specific needs of your body mass and pace. <br><br>The GuideRails holistic support system is your go-to for overpronation guidance, improving the alignment of your knees and reducing your injury risk out on the road. For runners new to the ever-reliable Adrenaline series, it’s an absolute game-changer – offering a super stable ride while minimising stress to the injury-prone knee ligaments of everyday athletes.   <br><br>Built upon a blown rubber outsole with Omega flex grooves, your best running shoes offer a buttery-smooth ride from the ground up to work in harmony with the support and cushioning midsole technologies. <br><br>- Joy-inspiring ride for runners seeking trustworthy stability and a softer sensation underfoot for everyday training<br>- Instant favourite in your warm weather running rotation with an Engineered Air Mesh upper to keep you cool, fresh and focussed <br>- 3D Fit Print creates a stretchy yet secure glove-like fit to move naturally and in harmony with your feet<br>- BioMoGo DNA adapts to your unique body mass, stride and pace for personalised cushioning<br>- DNA LOFT cushioning lets your feet run happy – absorbing shock for cloud-like impacts and offering an even smoother ride by extending to the forefoot<br>- GuideRails gently guide and align your body for more stability in every stride - avoiding excess movement of the knees to reduce your risk of injury<br>- Omega flex grooves to flow from foot strike to toe-off with optimal traction, flexibility and efficiency', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Stability</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Brooks DNA Loft, Brooks BioMoGo DNA</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">24mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">295g / 10.4oz</div></div>', null, N'2022-09-29 00:00:29.0000000', N'2022-09-29 00:00:29.0000000', 5, 2);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (33, N'Brooks Glycerin GTS 19 - Womens Running Shoes', 1, 1, N'You go-to stability road shoe, the Brooks Glycerin GTS 19 women’s running shoes upgrade your ride with an improved upper fit for zero distractions. Delivering a blend of breathability and plushness, the double jacquard engineered mesh upper moves with you in every stride. <br><br>Jam-packed with DNA Loft cushioning from heel-to-toe, Brooks have created their softest midsole cushioning yet without skimping on responsiveness or impacting on the lifespan of your running shoes. <br><br>The GuideRails Holistic Support System encourages a natural and efficient gait – helping slow your rate of pronation for unobtrusive stability. <br><br>It guides rather than controls your movement to align your body into its best motion path – keeping you on track of your everyday training and off the sidelines of your fitness. <br><br>With a stiffer forefoot flex groove configuration than the Brooks Glycerin 19, the Glycerin GTS 19 brings max cushioning to runners seeking more support. <br><br>- Next generation of the Brooks Transcend running shoe family - a new name teams with super soft comfort<br>- Delivers the max cushioning of the Brooks Glycerin 19 in a stable ride fine-tuned for overpronators <br>- GTS model for "Go-To Support"<br>- Double jacquard engineered mesh for high breathability<br>- Wraps your foot in a plush interior bootie<br>- Ortholite sockliner elevates comfort straight out of the box<br>- Full-length DNA Loft cushioning is ultra-soft yet resilient for long-lasting comfort and smooth sailing on the road<br>- GuideRails support system reduces excess rotation of the knees to run more efficiently and reduce your risk of injury   <br>- Designed for improved support from the ground up<br>- Wider midfoot creates a stable platform for running workouts <br>- Lateral midsole groove is deeper to reduce excess rotation<br>- Modified heel bevel improves your position on footstrike', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Stability</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Brooks DNA Loft</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">26mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">16mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">10mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">266g / 9.4oz</div></div>', null, N'2022-09-29 00:00:29.0000000', N'2022-09-29 00:00:29.0000000', 5, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (34, N'Brooks Ghost 13 - Womens Running Shoes', 1, 1, N'The Brooks Ghost 13 women’s running shoes are the next evolution of this popular running shoe family and are a win-win for loyal Ghost fans – staying true to the strength and breathability of previous generations, yet on a softer platform.<br><br>Offering lightweight protection for neutral runners, it sets you up with an engineered Air Mesh upper for a plush, locked-in fit to breeze through your runs. <br><br>Whereas the previous version isolated the cushioning to the heel to cater primarily to heel strikers, the full-length DNA Loft cushioning of the Ghost 13 provides a cloud-like sensation on impact no matter how your foot strikes the pavement. <br><br>Additional rubber underneath the midfoot improves stability to cater to this softer platform. These slight modifications ensure the outsole and plusher midsole work in harmony, transforming hard road surfaces into your personal runway.<br> <br>- Plush, go-to ride for neutral runners seeking lightweight protection and breathability<br>- Consistent fit, width and depth in comparison to the Ghost 12<br>- Ideal blend of structure and stretch from 3D Fit Print technology <br>- Air Mesh upper allows heat and humidity to escape when your run heats up<br>- Internal heel counter secures the rearfoot comfortably in place like a seatbelt<br>- DNA Loft cushioning extends from the heel to the forefoot for ultra-smooth transitions and a luxurious feel that caters to any foot strike<br>- BioMoGo DNA for an immediate, plush sensation right out of the box<br>- Strategically placed rubber underneath the midfoot for targeted support, working in harmony with the softer midsole<br>- Flex grooves to soar smoothly and efficiently over the pavement<br>- Hard-wearing rubber at the heel for durability and softer blown rubber at the forefoot for a springier feel on toe-off', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Neutral</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Mesh</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Brooks DNA Loft, Brooks BioMoGo DNA</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">24mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">249g / 8.8oz</div></div>', null, N'2022-09-29 00:00:30.0000000', N'2022-09-29 00:00:30.0000000', 5, 1);
INSERT INTO Shoes (Id, Name, Priority, Active, Description, Features, Note, Created, Edited, BrandId, CategoryId) VALUES (35, N'Brooks Adrenaline GTS 22 Knit - Mens Running Shoes', 1, 1, N'Effortless runs are in your future with the Brooks Adrenaline GTS 22 Knit men’s running shoes, loading game-changing support technologies into the next evolution of smooth. <br><br>3D Fit Print provides a structured, foot-conforming fit that moves like an extension of your body to reach your runner’s high. <br><br>The 100% DNA LOFT midsole cradles your feet in superb plushness without overcomplicating your ride or compromising on responsiveness. <br><br>The GuideRails holistic support system encourages a more efficient stride for overpronators with unobtrusive support to make easy work of long miles. <br><br>- Stability running shoes to glide over the road with a responsive and silky-smooth ride<br>- Knit upper for a premium feel and just-right blend of structure and stretch <br>- Innovative use of 3D Fit Print technology allows your feet and running shoes to move as one<br>- 100% DNA LOFT midsole offers super soft, ever-reliable cushioning<br>- GuideRails provide unobtrusive support to minimise overpronation – aligning your body better for a smoother stride<br>- Segmented Crash Pad for more seamless heel-to-toe transitions <br>- Road-ready traction and durability for a distraction-free run', N'<div class="row"><div class="small-4 columns"><strong>Support:</strong></div><div class="small-8 columns">Stability</div></div><div class="row"><div class="small-4 columns"><strong>Upper:</strong></div><div class="small-8 columns">Knit</div></div><div class="row"><div class="small-4 columns"><strong>Midsole:</strong></div><div class="small-8 columns">Brooks DNA Loft</div></div><div class="row"><div class="small-4 columns"><strong>Heel Height:</strong></div><div class="small-8 columns">24mm</div></div><div class="row"><div class="small-4 columns"><strong>Forefoot Height:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Drop:</strong></div><div class="small-8 columns">12mm</div></div><div class="row"><div class="small-4 columns"><strong>Weight:</strong></div><div class="small-8 columns">289g / 10.2oz</div></div>', null, N'2022-09-29 00:00:30.0000000', N'2022-09-29 00:00:30.0000000', 5, 2);

SET IDENTITY_INSERT Shoes OFF;
go

/*create table IF NOT EXISTS ShoeColor
(
    Id           int identity
        constraint PK_ShoeColor
            primary key,
    ProductCode  nvarchar(max)  not null,
    FactoryPrice decimal(10, 2) not null,
    SalePrice    decimal(10, 2) not null,
    SortOrder    int            not null,
    Priority     int            not null,
    Active       bit            not null,
    Url          nvarchar(max),
    Created      datetime2      not null,
    Edited       datetime2      not null,
    ShoeId       int            not null
        constraint FK_ShoeColor_Shoes_ShoeId
            references Shoes
            on delete cascade,
    ColorId      int            not null
        constraint FK_ShoeColor_Colors_ColorId
            references Colors
            on delete cascade
)
go

create index IX_ShoeColor_ColorId
    on ShoeColor (ColorId)
go

create index IX_ShoeColor_ShoeId
    on ShoeColor (ShoeId)
go
*/
SET IDENTITY_INSERT ShoeColor ON;
go

INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (1, N'W880M12-B', 123.45, 125.45, 1, 1, 1, N'new-balance-fresh-foam-x-880v12-womens-running-shoes-eclipse-vibrant-apricot-vibrant-pink', N'2022-09-28 23:59:52.0000000', N'2022-09-28 23:59:52.0000000', 1, 1);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (2, N'W880B12-B', 123.45, 125.45, 1, 1, 1, N'new-balance-fresh-foam-x-880v12-womens-running-shoes-black-violet-haze-steel', N'2022-09-28 23:59:53.0000000', N'2022-09-28 23:59:53.0000000', 1, 2);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (3, N'W880S11-B', 110.90, 112.90, 1, 1, 1, N'new-balance-fresh-foam-880v11-womens-running-shoes-light-cyclone-virtual-sky', N'2022-09-28 23:59:53.0000000', N'2022-09-28 23:59:53.0000000', 2, 3);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (4, N'M880L11-D', 104.63, 106.63, 1, 1, 1, N'new-balance-fresh-foam-880v11-mens-running-shoes-black-cyclone', N'2022-09-28 23:59:53.0000000', N'2022-09-28 23:59:53.0000000', 3, 4);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (5, N'M880F11-D', 104.63, 106.63, 1, 1, 1, N'new-balance-fresh-foam-880v11-mens-running-shoes-wave-blue-virtual-sky', N'2022-09-28 23:59:53.0000000', N'2022-09-28 23:59:53.0000000', 3, 5);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (6, N'M413LK1-2E', 43.16, 45.16, 1, 1, 1, N'new-balance-413-mens-running-shoes-black-white', N'2022-09-28 23:59:56.0000000', N'2022-09-28 23:59:56.0000000', 4, 6);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (7, N'W1080S11-B', 110.90, 112.90, 1, 1, 1, N'new-balance-fresh-foam-1080v11-womens-running-shoes-virtual-sky-bleached-lime-glo', N'2022-09-28 23:59:57.0000000', N'2022-09-28 23:59:57.0000000', 5, 7);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (8, N'MTNTRCE4-2E', 73.27, 75.27, 1, 1, 1, N'new-balance-nitrel-v4-mens-trail-running-shoes-grey-yellow-orange', N'2022-09-28 23:59:57.0000000', N'2022-09-28 23:59:57.0000000', 6, 8);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (9, N'CT2392-004', 129.72, 131.72, 1, 1, 1, N'nike-zoom-fly-4-mens-running-shoes-black-anthracite-hyper-violet', N'2022-09-28 23:59:57.0000000', N'2022-09-28 23:59:57.0000000', 7, 9);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (10, N'DA8535-401', 123.45, 125.45, 1, 1, 1, N'nike-air-zoom-structure-24-mens-running-shoes-old-royal-white-black-racer-blue', N'2022-09-28 23:59:58.0000000', N'2022-09-28 23:59:58.0000000', 8, 10);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (11, N'DQ5038-100', 104.63, 106.63, 1, 1, 1, N'nike-air-zoom-pegasus-38-womens-running-shoes-white-metallic-gold-siren-red', N'2022-09-29 00:00:01.0000000', N'2022-09-29 00:00:01.0000000', 9, 11);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (12, N'CZ1856-003', 93.97, 95.97, 1, 1, 1, N'nike-wildhorse-7-mens-trail-running-shoes-smoke-grey-mint-foam-dusty-sage', N'2022-09-29 00:00:01.0000000', N'2022-09-29 00:00:01.0000000', 10, 12);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (13, N'DH5392-100', 127.84, 129.84, 1, 1, 1, N'nike-react-infinity-run-flyknit-3-mens-running-shoes-white-particle-grey-kumquat-photon-dust', N'2022-09-29 00:00:02.0000000', N'2022-09-29 00:00:02.0000000', 11, 13);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (14, N'CT2392-005', 129.72, 131.72, 1, 1, 1, N'nike-zoom-fly-4-mens-running-shoes-wolf-grey-white-photo-blue-black', N'2022-09-29 00:00:02.0000000', N'2022-09-29 00:00:02.0000000', 7, 14);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (15, N'DJ6158-001', 117.18, 119.18, 1, 1, 1, N'nike-react-pegasus-trail-4-mens-trail-running-shoes-black-aura-dark-grey-wolf-grey', N'2022-09-29 00:00:03.0000000', N'2022-09-29 00:00:03.0000000', 12, 15);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (16, N'S10575-31', 110.90, 112.90, 1, 1, 1, N'saucony-echelon-8-womens-running-shoes-space-razzle', N'2022-09-29 00:00:05.0000000', N'2022-09-29 00:00:05.0000000', 13, 16);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (17, N'S10678-15', 98.36, 100.36, 1, 1, 1, N'saucony-triumph-19-womens-running-shoes-shadow-quartz', N'2022-09-29 00:00:06.0000000', N'2022-09-29 00:00:06.0000000', 14, 17);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (18, N'CW6062-800', 89.58, 91.58, 1, 1, 1, N'nike-air-zoom-terra-kiger-7-mens-trail-running-shoes-total-orange-obsidian-signal-blue', N'2022-09-29 00:00:06.0000000', N'2022-09-29 00:00:06.0000000', 15, 18);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (19, N'S20756-23', 161.08, 163.08, 1, 1, 1, N'saucony-endorphin-speed-3-chicago-mens-running-shoes-chicago', N'2022-09-29 00:00:07.0000000', N'2022-09-29 00:00:07.0000000', 16, 19);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (20, N'S20755-200', 211.27, 213.27, 1, 1, 1, N'saucony-endorphin-pro-3-panda-mens-road-racing-shoes-chengdu-marathon', N'2022-09-29 00:00:08.0000000', N'2022-09-29 00:00:08.0000000', 17, 20);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (21, N'S20689-25', 110.90, 112.90, 1, 1, 1, N'saucony-endorphin-shift-2-mens-running-shoes-blue-raz-acid', N'2022-09-29 00:00:12.0000000', N'2022-09-29 00:00:12.0000000', 18, 21);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (22, N'S20755-85', 211.27, 213.27, 1, 1, 1, N'saucony-endorphin-pro-3-mens-road-racing-shoes-white-black-vizired', N'2022-09-29 00:00:13.0000000', N'2022-09-29 00:00:13.0000000', 19, 22);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (23, N'S20756-10', 161.08, 163.08, 1, 1, 1, N'saucony-endorphin-speed-3-mens-running-shoes-black-goldstruck', N'2022-09-29 00:00:13.0000000', N'2022-09-29 00:00:13.0000000', 20, 23);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (24, N'S20723-65', 123.45, 125.45, 1, 1, 1, N'saucony-kinvara-13-mens-running-shoes-nite-lite', N'2022-09-29 00:00:13.0000000', N'2022-09-29 00:00:13.0000000', 21, 24);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (25, N'1011B342.020', 142.27, 144.27, 1, 1, 1, N'asics-gel-kayano-28-platinum-mens-running-shoes-carrier-grey-pure-silver', N'2022-09-29 00:00:13.0000000', N'2022-09-29 00:00:13.0000000', 22, 25);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (26, N'1012B306.001', 154.81, 156.81, 1, 1, 1, N'asics-gel-nimbus-24-platinum-womens-running-shoes-black-blue-white', N'2022-09-29 00:00:17.0000000', N'2022-09-29 00:00:17.0000000', 23, 26);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (27, N'1012B272.500', 167.36, 169.36, 1, 1, 1, N'asics-gel-kayano-29-womens-running-shoes-orchid-dive-blue', N'2022-09-29 00:00:17.0000000', N'2022-09-29 00:00:17.0000000', 24, 27);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (28, N'1012B047.402', 135.99, 137.99, 1, 1, 1, N'asics-gel-kayano-28-womens-running-shoes-mako-blue-barely-rose', N'2022-09-29 00:00:17.0000000', N'2022-09-29 00:00:17.0000000', 25, 28);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (29, N'1012B272.101', 167.36, 169.36, 1, 1, 1, N'asics-gel-kayano-29-womens-running-shoes-white-sea-glass', N'2022-09-29 00:00:18.0000000', N'2022-09-29 00:00:18.0000000', 24, 29);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (30, N'1011B359.400', 123.45, 125.45, 1, 1, 1, N'asics-gel-nimbus-24-mens-running-shoes-lake-drive-hazard-green', N'2022-09-29 00:00:18.0000000', N'2022-09-29 00:00:18.0000000', 26, 30);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (31, N'1011B336.400', 142.27, 144.27, 1, 1, 1, N'asics-glideride-3-mens-running-shoes-mako-blue-french-blue', N'2022-09-29 00:00:21.0000000', N'2022-09-29 00:00:21.0000000', 27, 31);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (32, N'110369D056', 133.48, 135.48, 1, 1, 1, N'brooks-ghost-14-mens-running-shoes-black-blackened-pearl-blue', N'2022-09-29 00:00:22.0000000', N'2022-09-29 00:00:22.0000000', 28, 32);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (33, N'120356B424', 133.48, 135.48, 1, 1, 1, N'brooks-ghost-14-womens-running-shoes-peacoat-blissful-blue', N'2022-09-29 00:00:23.0000000', N'2022-09-29 00:00:23.0000000', 29, 33);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (34, N'110366D034', 135.99, 137.99, 1, 1, 1, N'brooks-adrenaline-gts-22-mens-running-shoes-black-blue-orange', N'2022-09-29 00:00:23.0000000', N'2022-09-29 00:00:23.0000000', 30, 34);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (35, N'1011B185.002', 117.18, 119.18, 1, 1, 1, N'asics-gt-2000-10-mens-running-shoes-black-white', N'2022-09-29 00:00:24.0000000', N'2022-09-29 00:00:24.0000000', 31, 6);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (36, N'110349D438', 123.45, 125.45, 1, 1, 1, N'brooks-adrenaline-gts-21-mens-running-shoes-navy-stellar-white', N'2022-09-29 00:00:29.0000000', N'2022-09-29 00:00:29.0000000', 32, 35);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (37, N'120344B074', 133.48, 135.48, 1, 1, 1, N'brooks-glycerin-gts-19-womens-running-shoes-black-ombre-metallic', N'2022-09-29 00:00:29.0000000', N'2022-09-29 00:00:29.0000000', 33, 36);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (38, N'120356D026', 148.52, 150.52, 1, 1, 1, N'brooks-ghost-14-womens-running-shoes-black-pearl-peach', N'2022-09-29 00:00:30.0000000', N'2022-09-29 00:00:30.0000000', 29, 37);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (39, N'120338D034', 127.21, 129.21, 1, 1, 1, N'brooks-ghost-13-womens-running-shoes-black-turquoise', N'2022-09-29 00:00:30.0000000', N'2022-09-29 00:00:30.0000000', 34, 38);
INSERT INTO ShoeColor (Id, ProductCode, FactoryPrice, SalePrice, SortOrder, Priority, Active, Url, Created, Edited, ShoeId, ColorId) VALUES (40, N'110366D445', 135.99, 137.99, 1, 1, 1, N'brooks-adrenaline-gts-22-knit-mens-running-shoes-titan-teal-grey', N'2022-09-29 00:00:30.0000000', N'2022-09-29 00:00:30.0000000', 35, 39);

SET IDENTITY_INSERT ShoeColor OFF;
go

/*create table IF NOT EXISTS Images
(
    Id          int identity
        constraint PK_Images
            primary key,
    Path        nvarchar(max) not null,
    SortOrder   int           not null,
    ShoeColorId int           not null
        constraint FK_Images_ShoeColor_ShoeColorId
            references ShoeColor
            on delete cascade
)
go

create index IX_Images_ShoeColorId
    on Images (ShoeColorId)
go
*/
SET IDENTITY_INSERT Images ON;
go

INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (1, N'/images/shoes/881dd84f-87f7-42e3-9a07-5ef15d576197.jpg', 1, 1);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (2, N'/images/shoes/c35dd48f-f32b-4174-b541-6596e485d831.jpg', 2, 1);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (3, N'/images/shoes/d809222e-53ee-4389-912d-a9fa4b65a1f0.jpg', 3, 1);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (4, N'/images/shoes/d1e750fc-f433-40c7-9dfb-0832777ce5f8.jpg', 4, 1);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (5, N'/images/shoes/6c00a32c-0251-4439-bea8-92447755f1f5.jpg', 5, 1);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (6, N'/images/shoes/d81352d6-1203-4108-bf53-a04d26cbddaf.jpg', 6, 1);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (7, N'/images/shoes/28b282c1-92b6-4807-9a53-ac5547935287.jpg', 1, 2);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (8, N'/images/shoes/86239a4f-af7c-4507-a1fd-65e3ce6f99e9.jpg', 2, 2);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (9, N'/images/shoes/eb734101-cad0-47e1-883b-67dc08a1c5ab.jpg', 3, 2);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (10, N'/images/shoes/2baacbf9-dc6d-4134-a6ee-65525db3828c.jpg', 4, 2);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (11, N'/images/shoes/15af6a3f-9af5-4e4f-8c1a-febcba4d7d53.jpg', 5, 2);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (12, N'/images/shoes/1c7bc124-5109-4f17-85bc-9a2a08c40e01.jpg', 6, 2);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (13, N'/images/shoes/a8037376-7fe5-45be-848a-6f520cc8ea77.jpg', 1, 3);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (14, N'/images/shoes/2614b0c8-1020-4e91-a58f-169973c3f6c2.jpg', 2, 3);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (15, N'/images/shoes/660792e9-a0f4-4fb0-99d6-a05b5a9526fd.jpg', 3, 3);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (16, N'/images/shoes/5c511b2e-4e19-477d-b81c-e37358517145.jpg', 4, 3);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (17, N'/images/shoes/b0e349de-e072-44e2-9e48-2b249d0e5be3.jpg', 1, 4);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (18, N'/images/shoes/b3c63ec4-a544-4d1c-875d-ff147fc174ab.jpg', 2, 4);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (19, N'/images/shoes/60a21e0d-ac59-469e-8bc6-a7ac922740c5.jpg', 3, 4);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (20, N'/images/shoes/365d0572-80c6-4716-9116-345a02504eb4.jpg', 4, 4);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (21, N'/images/shoes/9c0cc482-2325-4123-bb5f-9a576c139b69.jpg', 1, 5);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (22, N'/images/shoes/67c1d808-aa5c-4f86-8c7b-65c176cc59b0.jpg', 2, 5);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (23, N'/images/shoes/e48e4b47-0cbd-4ad1-b474-3c40c054a97c.jpg', 3, 5);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (24, N'/images/shoes/6520373d-c4de-4f8c-be2d-7e7d20546f1a.jpg', 4, 5);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (25, N'/images/shoes/ea9486af-850a-4ad6-83d8-7d74884d9456.jpg', 1, 6);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (26, N'/images/shoes/00890b5a-563c-4362-9b02-dc244a3584cf.jpg', 2, 6);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (27, N'/images/shoes/22d12e79-d65b-4eae-aab2-1ad4c02f4283.jpg', 3, 6);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (28, N'/images/shoes/ffe0ab0e-09be-44d2-81e9-943c498c41cf.jpg', 4, 6);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (29, N'/images/shoes/96bf0aa6-4d56-4381-95a6-064730d00bf6.jpg', 1, 7);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (30, N'/images/shoes/696c0924-1a13-48f4-8218-6b8634fd4d0c.jpg', 2, 7);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (31, N'/images/shoes/a3dc3ab5-8dca-477b-b554-a57002008838.jpg', 3, 7);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (32, N'/images/shoes/bc3899d5-6bfc-40db-93a6-dd27fa6462e2.jpg', 4, 7);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (33, N'/images/shoes/c169e8d1-9072-4ffb-8fd9-ea36da48fea9.jpg', 1, 8);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (34, N'/images/shoes/3b5853b8-2a7d-4a8a-97e1-f75ae53629bd.jpg', 2, 8);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (35, N'/images/shoes/c13c55f3-266b-4500-9e9c-ba205f84799a.jpg', 3, 8);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (36, N'/images/shoes/38d8a0d7-e70f-4338-a71e-9d891b9b3348.jpg', 4, 8);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (37, N'/images/shoes/fbda1cba-670c-4896-a6f9-f3886c75fc30.jpg', 5, 8);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (38, N'/images/shoes/6c16bc13-c3d8-4e33-b19a-844bd5e3a3bb.jpg', 1, 9);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (39, N'/images/shoes/104dd6dc-903f-4fc4-93c9-2d7667e42824.jpg', 2, 9);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (40, N'/images/shoes/1595609c-dffd-4c5c-ab00-572981b6d8bb.jpg', 3, 9);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (41, N'/images/shoes/7f0d8582-8c27-41ed-8ec1-d977e02e1dd4.jpg', 4, 9);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (42, N'/images/shoes/de7c10c6-dec0-4f2a-979f-9a3e2b7b8c25.jpg', 5, 9);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (43, N'/images/shoes/b9f15d26-4ab3-426f-acc7-ebc7d8a4b22f.jpg', 6, 9);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (44, N'/images/shoes/1f41ced2-d08d-42f9-b415-386233c4f076.jpg', 1, 10);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (45, N'/images/shoes/9edf71c7-3edf-4334-8314-48087da1b605.jpg', 2, 10);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (46, N'/images/shoes/48ec2a24-0f3f-4f31-a62c-133ea3b2c2e8.jpg', 3, 10);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (47, N'/images/shoes/c3b1b59f-31b1-43ca-a9d2-9567d555d35e.jpg', 4, 10);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (48, N'/images/shoes/f9413327-af27-434a-b4fb-2511c525373a.jpg', 5, 10);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (49, N'/images/shoes/8465f3c7-e2b9-46ac-afc4-4fcc0a57059e.jpg', 6, 10);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (50, N'/images/shoes/e574d450-1c8b-41c0-bca1-fa61973ec878.jpg', 1, 11);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (51, N'/images/shoes/fec4d91d-7c3b-4e40-9c17-5a8c81ccf6ce.jpg', 2, 11);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (52, N'/images/shoes/83247272-a110-4851-bf2a-7b8fb2f2afc1.jpg', 3, 11);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (53, N'/images/shoes/aafc7758-3795-49e3-a68d-e6d8d5600bf7.jpg', 4, 11);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (54, N'/images/shoes/8fcf18ef-1e08-451b-9463-b6d9f50d3cec.jpg', 5, 11);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (55, N'/images/shoes/7be5f635-bdb3-4e7c-a483-06f0688624a1.jpg', 6, 11);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (56, N'/images/shoes/0682c89a-a8e6-4548-8bb4-ca86f61d8f87.jpg', 1, 12);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (57, N'/images/shoes/cd58f21f-baf0-4076-b4d8-f26b412454ef.jpg', 2, 12);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (58, N'/images/shoes/8c953cae-066f-43b3-a0f3-98d2f5756f39.jpg', 3, 12);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (59, N'/images/shoes/807a1a42-8c61-44d3-aaf8-9970a731cf06.jpg', 4, 12);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (60, N'/images/shoes/6b92ec53-395c-4fa7-8852-3836e278b5d6.jpg', 5, 12);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (61, N'/images/shoes/5199f421-d4d9-431e-a31f-a3bf67a6827b.jpg', 6, 12);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (62, N'/images/shoes/95b7a03c-d66c-4281-86d9-2a973357cc92.jpg', 1, 13);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (63, N'/images/shoes/8360e563-5d2a-41cb-b4b9-561e9dff24da.jpg', 2, 13);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (64, N'/images/shoes/51deef7f-e22f-4903-927d-15e50c6081d0.jpg', 3, 13);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (65, N'/images/shoes/30b5b77f-8c7f-4768-9730-eb2625d046e3.jpg', 4, 13);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (66, N'/images/shoes/97aa9fc8-59d7-4be3-87ea-45a61f5ca6f8.jpg', 5, 13);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (67, N'/images/shoes/40c65a70-8b0f-4d0b-aa0d-05c0e77cd866.jpg', 6, 13);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (68, N'/images/shoes/34ce0f75-0e1f-4322-a798-2da18cf548a9.jpg', 1, 14);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (69, N'/images/shoes/1fa17669-ca86-4751-8ee2-ea896c94fa75.jpg', 2, 14);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (70, N'/images/shoes/cb78685f-886e-4c9c-8b0b-4558dd527a83.jpg', 3, 14);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (71, N'/images/shoes/ad1ef565-16b9-4e18-897e-ca5eac66aab3.jpg', 4, 14);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (72, N'/images/shoes/d9f4c6d1-d7c4-458e-aab8-3e4a69a7d0c1.jpg', 5, 14);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (73, N'/images/shoes/2f72035a-00de-42ce-bc7b-eb136b9beb11.jpg', 6, 14);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (74, N'/images/shoes/09d1a1c0-5c53-46b2-be0b-46ab2675abdb.jpg', 1, 15);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (75, N'/images/shoes/00aae392-1c39-4db9-967e-99570e1127e7.jpg', 2, 15);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (76, N'/images/shoes/09666411-9238-4c80-a2a6-1f986ecc0bcd.jpg', 3, 15);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (77, N'/images/shoes/db54fda0-799f-47a3-9ce1-127d458d8f53.jpg', 4, 15);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (78, N'/images/shoes/0aa1ecff-ed91-452a-92d4-d1a7284f6e66.jpg', 5, 15);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (79, N'/images/shoes/52443768-c81d-4742-b66f-184cc82ed8dd.jpg', 6, 15);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (80, N'/images/shoes/b7fadcae-de5d-4f3a-b49b-191a4c0fcb1f.jpg', 1, 16);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (81, N'/images/shoes/5fd440a3-5868-4d25-b689-176c2d388b6d.jpg', 2, 16);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (82, N'/images/shoes/1446ce86-5e7d-4820-9130-47764aeef193.jpg', 3, 16);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (83, N'/images/shoes/191938bd-22f9-469e-8281-36bf82d81cbc.jpg', 4, 16);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (84, N'/images/shoes/35019045-1c92-4963-a2c5-923403080f39.jpg', 1, 17);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (85, N'/images/shoes/9a1f7038-823f-4dae-942e-0504e649dcfe.jpg', 2, 17);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (86, N'/images/shoes/150208b9-a250-475e-b625-bd67a263651e.jpg', 3, 17);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (87, N'/images/shoes/2f2cf656-e852-4cdf-bd30-65131125c3cd.jpg', 1, 18);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (88, N'/images/shoes/7af3080d-9b56-4735-beec-98adc9220448.jpg', 2, 18);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (89, N'/images/shoes/ea56a59e-3e94-462a-a67f-52275f21cf85.jpg', 3, 18);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (90, N'/images/shoes/93a0c0ef-a514-46fe-ad21-1d3f60655f13.jpg', 4, 18);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (91, N'/images/shoes/2c11b2d2-e78e-43ea-a09d-ca0df37889ae.jpg', 5, 18);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (92, N'/images/shoes/e44a1130-ba39-41f2-bab8-e0272525eaeb.jpg', 6, 18);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (93, N'/images/shoes/8fcf1564-1a15-4570-a82a-5e29dccdb8f1.jpg', 1, 19);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (94, N'/images/shoes/ff9d4afa-f77f-4f3a-a3cf-5dbb7cf8368b.jpg', 2, 19);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (95, N'/images/shoes/ceb08bd4-5663-4dba-a04c-5d3d9c1ae77d.jpg', 3, 19);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (96, N'/images/shoes/77fa2add-d651-4c3b-a6b1-eb2295d165f0.jpg', 4, 19);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (97, N'/images/shoes/419ad199-1f14-4362-b463-d1d68ec1d982.jpg', 5, 19);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (98, N'/images/shoes/6582cca5-e6d8-4a43-bbac-77b7dda1c871.jpg', 6, 19);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (99, N'/images/shoes/504b51ac-013f-4bbd-a955-7de6957b14e4.jpg', 1, 20);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (100, N'/images/shoes/090f67ac-1c1e-4280-8a9e-3706b20a027d.jpg', 2, 20);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (101, N'/images/shoes/5abb8a56-03bb-47af-93d6-a3eed4e34554.jpg', 3, 20);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (102, N'/images/shoes/0df2f9c7-57a2-4302-9a5b-179524e7ad30.jpg', 4, 20);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (103, N'/images/shoes/2d5c7d4b-9117-4afc-9a89-31182da55984.jpg', 5, 20);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (104, N'/images/shoes/d98ce543-036c-4816-8723-022e1e66dc68.jpg', 6, 20);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (105, N'/images/shoes/96e4a9bc-bb69-4486-ac2b-d2ce048a37db.jpg', 1, 21);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (106, N'/images/shoes/e6fa6387-f750-4820-af71-d248328874b5.jpg', 2, 21);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (107, N'/images/shoes/429b8c20-a428-4b2c-9be2-7402af7cb1dd.jpg', 3, 21);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (108, N'/images/shoes/2eb05520-32d9-4059-9d2b-05509033b665.jpg', 1, 22);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (109, N'/images/shoes/278409d1-2d86-4b49-b97c-f029e5125db4.jpg', 2, 22);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (110, N'/images/shoes/e1ab1533-8721-42ff-8264-f20b00d013c4.jpg', 3, 22);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (111, N'/images/shoes/52f82950-14a3-48c8-b391-859a6d3bddf6.jpg', 4, 22);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (112, N'/images/shoes/7feb61a1-15be-46f5-b93b-33da8c4d531c.jpg', 5, 22);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (113, N'/images/shoes/c5a1751b-2158-4848-899c-5d86009957ef.jpg', 1, 23);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (114, N'/images/shoes/128902eb-2f90-4c52-8439-7507adbe46c6.jpg', 2, 23);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (115, N'/images/shoes/8e42c465-537d-4313-9366-7128488edf25.jpg', 3, 23);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (116, N'/images/shoes/d20a412e-1f74-4f4b-8ab2-9baf37c12f94.jpg', 4, 23);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (117, N'/images/shoes/a1f2061b-2f25-4e9f-996b-3bbdb8795218.jpg', 5, 23);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (118, N'/images/shoes/bf6feeae-f5a7-4e54-9ce1-83a7c31330bb.jpg', 1, 24);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (119, N'/images/shoes/96865075-11cf-475b-9dcb-e5b645d58c1b.jpg', 2, 24);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (120, N'/images/shoes/3d8290dd-a445-44cc-9d79-2e2793ec5a53.jpg', 3, 24);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (121, N'/images/shoes/f068bb6a-9434-4147-a097-993e9f79a456.jpg', 4, 24);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (122, N'/images/shoes/c5630c26-f7da-4cee-b695-5e10c2baaf54.jpg', 1, 25);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (123, N'/images/shoes/37ff639a-2f53-477f-a527-32c72ab2f7dc.jpg', 2, 25);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (124, N'/images/shoes/5df8e7d8-2b22-4581-a480-b1a57819fc4f.jpg', 3, 25);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (125, N'/images/shoes/a3b30f7b-2946-472b-a49f-f6e6b227ead9.jpg', 4, 25);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (126, N'/images/shoes/a805846d-9a35-44fa-af22-ff031cc87451.jpg', 5, 25);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (127, N'/images/shoes/2c838356-57af-4bbe-8c3f-f1abfa7a3e0b.jpg', 6, 25);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (128, N'/images/shoes/bf28e7f5-c859-44a2-a963-32f2dfd23ac7.jpg', 1, 26);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (129, N'/images/shoes/4adbf186-d2d0-4c50-a0bd-8ddde1e2beea.jpg', 2, 26);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (130, N'/images/shoes/23f351f8-7b20-425d-85b7-a71c3f640ab6.jpg', 3, 26);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (131, N'/images/shoes/e690c6d6-beec-4ee1-b059-f5bd3c0d0550.jpg', 4, 26);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (132, N'/images/shoes/59a4c0d0-0fec-4bc7-8766-a2dac126e621.jpg', 5, 26);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (133, N'/images/shoes/45411b83-0578-4c22-837a-e6b522980c6a.jpg', 6, 26);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (134, N'/images/shoes/b26ff16a-a935-4a08-a771-9f76f8098395.jpg', 1, 27);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (135, N'/images/shoes/6c056f47-ee18-46c2-a52b-78fc59421257.jpg', 2, 27);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (136, N'/images/shoes/7dc7ad39-267f-453e-956d-247b9ed970a3.jpg', 3, 27);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (137, N'/images/shoes/ba0da219-b6b5-469e-bfaf-f695850c11e5.jpg', 4, 27);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (138, N'/images/shoes/baa6d13d-150b-4fa7-a6cb-cee40ef70da2.jpg', 5, 27);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (139, N'/images/shoes/502bdb18-d617-4063-8d70-45a8aa11ff16.jpg', 6, 27);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (140, N'/images/shoes/ddd44122-8f38-4398-8cf8-ff4c2f667634.jpg', 1, 28);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (141, N'/images/shoes/fe05063a-ecd6-4d2f-a262-00c35dea3cd0.jpg', 2, 28);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (142, N'/images/shoes/39d1b167-c86b-41ad-932a-b10e5c03d94d.jpg', 3, 28);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (143, N'/images/shoes/decd9533-8a70-43b2-8afa-a2a35911c373.jpg', 4, 28);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (144, N'/images/shoes/614c9e00-0b58-4565-afe8-8510324000ce.jpg', 5, 28);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (145, N'/images/shoes/da0bc90e-64b6-4b9a-81ee-e3a70ec59d77.jpg', 6, 28);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (146, N'/images/shoes/2e89d630-b702-4104-bdd9-872c2f1a5304.jpg', 1, 29);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (147, N'/images/shoes/7ace1d34-a9f0-45f1-b375-cb01cb9d0a96.jpg', 2, 29);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (148, N'/images/shoes/03cb3ff9-ea9f-4b4c-b161-207a0422eec9.jpg', 3, 29);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (149, N'/images/shoes/0bf36f88-6e42-4dfb-863b-a3a047379f86.jpg', 4, 29);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (150, N'/images/shoes/f2ff6b65-4a4a-4760-88dc-e114e91fc82c.jpg', 5, 29);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (151, N'/images/shoes/f71bb493-898c-44cf-b2b2-09a7eb6937ae.jpg', 6, 29);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (152, N'/images/shoes/6dedb350-6767-4aea-8da4-735dfda21e2f.jpg', 1, 30);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (153, N'/images/shoes/19af3bbb-395e-4e3b-8b70-d173cc3409a2.jpg', 2, 30);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (154, N'/images/shoes/2ec18938-30f2-4a6d-b4b1-1c0841dcb839.jpg', 3, 30);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (155, N'/images/shoes/18123eb7-90bd-4fa0-b0e7-75b37e530d1e.jpg', 4, 30);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (156, N'/images/shoes/990e577f-157a-4075-9205-ece6ec4da53e.jpg', 5, 30);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (157, N'/images/shoes/d215ffa7-2bc2-4cec-a8f3-2f6c69b2c167.jpg', 6, 30);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (158, N'/images/shoes/682f5130-0570-431e-b842-8193aada9e0f.jpg', 1, 31);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (159, N'/images/shoes/8ce7be16-4285-470c-9009-8b03bc5582c2.jpg', 2, 31);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (160, N'/images/shoes/c0d86609-e141-4aa6-a66b-70202b7daea8.jpg', 3, 31);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (161, N'/images/shoes/a24f7616-bb81-4f90-86f0-f46286b0d659.jpg', 4, 31);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (162, N'/images/shoes/44886ca9-f95c-41ed-ad49-68b2c4f10923.jpg', 5, 31);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (163, N'/images/shoes/061495d1-edeb-49b5-8345-1673758ce03e.jpg', 6, 31);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (164, N'/images/shoes/c6493c6a-d20f-49a8-aa2f-087a9e0aa201.jpg', 1, 32);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (165, N'/images/shoes/e4771545-03ec-4bbf-bb54-4d511ba59eb3.jpg', 2, 32);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (166, N'/images/shoes/9599a1d1-1263-4e06-9903-360bfe4c1efa.jpg', 3, 32);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (167, N'/images/shoes/aba0b68b-0906-4e63-83a8-9e910a8b4930.jpg', 4, 32);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (168, N'/images/shoes/8c172741-01fa-452b-b4a1-4017e4646657.jpg', 5, 32);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (169, N'/images/shoes/dbcaebc0-cbc5-43b4-9727-100445c6143c.jpg', 6, 32);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (170, N'/images/shoes/35718af1-1c8c-4e11-bb5b-880478e25c21.jpg', 1, 33);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (171, N'/images/shoes/3f66eb34-4971-4cd6-a1d2-1c7a56b2a177.jpg', 2, 33);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (172, N'/images/shoes/118d90a5-d439-4538-9d49-9ffff8b5b464.jpg', 3, 33);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (173, N'/images/shoes/bb0e9a26-352e-4875-9679-c27b75add57a.jpg', 4, 33);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (174, N'/images/shoes/61f70f7f-2545-4973-9aaf-c7240c3bb0c4.jpg', 5, 33);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (175, N'/images/shoes/67954cb0-7e57-4f01-8899-26b616a082fc.jpg', 6, 33);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (176, N'/images/shoes/5e203c34-56b9-4934-8ee6-3e2efa88cb25.jpg', 1, 34);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (177, N'/images/shoes/3f5bb527-6274-4ff5-8a2c-d6b427ffd653.jpg', 2, 34);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (178, N'/images/shoes/597ae3dd-ef84-44fa-b520-bef329e1ff1f.jpg', 3, 34);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (179, N'/images/shoes/3e7118b2-80cf-43f4-acfe-5fe5c20055f1.jpg', 4, 34);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (180, N'/images/shoes/f5a3a75d-68a4-4e8a-9468-c19552929ba9.jpg', 5, 34);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (181, N'/images/shoes/c10cd897-e88e-43f9-a52c-0d365aa16ec6.jpg', 6, 34);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (182, N'/images/shoes/70a831b2-3225-41f6-928d-3352c06f9598.jpg', 1, 35);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (183, N'/images/shoes/fbdb955e-ef85-48a4-bd25-54e4c8059741.jpg', 2, 35);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (184, N'/images/shoes/21dcaeb8-902c-4e8f-a6de-83f474001e8a.jpg', 3, 35);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (185, N'/images/shoes/86651d63-cf72-4b23-8e4b-8a6dfa1d1f1c.jpg', 4, 35);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (186, N'/images/shoes/69cfc160-8c95-439b-ac8f-2b0c763133f5.jpg', 5, 35);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (187, N'/images/shoes/b226f744-7612-43f3-b14e-e000eda82019.jpg', 6, 35);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (188, N'/images/shoes/9310fd87-0dbf-4d3a-80da-0ba6f0a14d78.jpg', 1, 36);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (189, N'/images/shoes/de869f39-a178-4d8e-a1d4-c2b9fea1df38.jpg', 2, 36);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (190, N'/images/shoes/b64c8fa0-8fd6-4344-8057-b357d9a94e0b.jpg', 3, 36);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (191, N'/images/shoes/889cae4c-093e-4dd0-babd-1837b49519fa.jpg', 4, 36);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (192, N'/images/shoes/c8a9f811-9471-49d7-afc4-3b8379e9bf70.jpg', 5, 36);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (193, N'/images/shoes/a094439a-9809-467a-aa78-f14d9e37656d.jpg', 6, 36);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (194, N'/images/shoes/c0b374a8-4a5c-4b52-8f0f-eb6855aee5ae.jpg', 1, 37);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (195, N'/images/shoes/31272086-535f-46da-8829-df37a7cd7410.jpg', 2, 37);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (196, N'/images/shoes/16c14885-96ae-42c7-b91d-831d436647b8.jpg', 3, 37);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (197, N'/images/shoes/25f0df1b-a40c-4cb7-be00-cfc8364bd1fe.jpg', 4, 37);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (198, N'/images/shoes/1e60faa8-c5c4-4f2e-a77c-c66ba2350150.jpg', 5, 37);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (199, N'/images/shoes/5205adc1-647d-4402-ab3e-dc060a175e9b.jpg', 6, 37);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (200, N'/images/shoes/cf884eaa-c0a2-42d3-b3cb-2ccd0cc693d2.jpg', 1, 38);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (201, N'/images/shoes/16fe69e0-933a-4b33-bd2c-dd451eaa3cf0.jpg', 2, 38);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (202, N'/images/shoes/59862caf-f187-4f91-a3a0-9fea66f08a34.jpg', 3, 38);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (203, N'/images/shoes/8c71cf6c-66f1-44d7-867f-82ff968ffa77.jpg', 4, 38);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (204, N'/images/shoes/9aebf9d4-dc88-4310-8e15-49c7a612e510.jpg', 5, 38);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (205, N'/images/shoes/e915f75f-7c42-4b73-bdc7-3a5d15502986.jpg', 6, 38);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (206, N'/images/shoes/af33104d-3ff6-4cfb-af0e-ca37d1609d07.jpg', 1, 39);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (207, N'/images/shoes/4ca55469-9626-4be3-812d-2fa3ff9e963c.jpg', 2, 39);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (208, N'/images/shoes/572464fe-3d13-422c-92e8-74d06b067fc9.jpg', 3, 39);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (209, N'/images/shoes/53112f2d-0933-4991-8783-fc5bbfdbf68f.jpg', 4, 39);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (210, N'/images/shoes/38ffa166-46ba-48a1-9b33-25a8f59a74bf.jpg', 5, 39);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (211, N'/images/shoes/8b1e38c8-63fd-4701-9362-74469fdf65dc.jpg', 6, 39);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (212, N'/images/shoes/0e5e2778-046d-48bb-82a9-1c870c4f1355.jpg', 1, 40);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (213, N'/images/shoes/dd63129a-380a-47b4-b610-50bf6b7f51cc.jpg', 2, 40);
INSERT INTO Images (Id, Path, SortOrder, ShoeColorId) VALUES (214, N'/images/shoes/ef78356b-74a9-430a-9458-82c3d4c89f08.jpg', 3, 40);

SET IDENTITY_INSERT Images OFF;
go

/*create table IF NOT EXISTS ShoeSize
(
    Id          int identity
        constraint PK_ShoeSize
            primary key,
    Quantity    int not null,
    ShoeColorId int not null
        constraint FK_ShoeSize_ShoeColor_ShoeColorId
            references ShoeColor
            on delete cascade,
    SizeId      int not null
        constraint FK_ShoeSize_Sizes_SizeId
            references Sizes
            on delete cascade
)
go

create index IX_ShoeSize_ShoeColorId
    on ShoeSize (ShoeColorId)
go

create index IX_ShoeSize_SizeId
    on ShoeSize (SizeId)
go
*/
SET IDENTITY_INSERT ShoeSize ON;
go

INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (1, 97, 1, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (2, 25, 1, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (3, 9, 1, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (4, 86, 1, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (5, 49, 1, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (6, 10, 1, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (7, 92, 1, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (8, 18, 1, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (9, 76, 1, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (10, 46, 1, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (11, 34, 1, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (12, 83, 1, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (13, 81, 1, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (14, 32, 1, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (15, 33, 1, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (16, 22, 1, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (17, 81, 1, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (18, 53, 2, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (19, 14, 2, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (20, 11, 2, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (21, 25, 2, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (22, 52, 2, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (23, 27, 2, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (24, 14, 2, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (25, 53, 2, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (26, 74, 2, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (27, 25, 2, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (28, 19, 2, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (29, 25, 2, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (30, 25, 2, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (31, 17, 2, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (32, 29, 2, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (33, 67, 2, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (34, 36, 2, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (35, 31, 3, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (36, 45, 3, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (37, 12, 3, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (38, 79, 3, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (39, 33, 3, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (40, 79, 3, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (41, 18, 3, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (42, 46, 3, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (43, 49, 3, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (44, 58, 3, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (45, 45, 3, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (46, 90, 3, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (47, 77, 3, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (48, 84, 3, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (49, 32, 3, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (50, 81, 3, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (51, 24, 3, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (52, 52, 4, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (53, 78, 4, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (54, 18, 4, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (55, 35, 4, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (56, 88, 4, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (57, 96, 4, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (58, 39, 4, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (59, 59, 4, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (60, 91, 4, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (61, 22, 4, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (62, 47, 4, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (63, 75, 4, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (64, 31, 4, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (65, 54, 4, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (66, 74, 4, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (67, 91, 4, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (68, 63, 4, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (69, 1, 5, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (70, 42, 5, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (71, 18, 5, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (72, 74, 5, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (73, 97, 5, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (74, 39, 5, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (75, 2, 5, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (76, 54, 5, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (77, 60, 5, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (78, 61, 5, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (79, 30, 5, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (80, 14, 5, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (81, 32, 5, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (82, 66, 5, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (83, 70, 5, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (84, 19, 5, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (85, 28, 5, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (86, 70, 6, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (87, 69, 6, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (88, 5, 6, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (89, 64, 6, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (90, 2, 6, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (91, 57, 6, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (92, 97, 6, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (93, 25, 6, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (94, 91, 6, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (95, 21, 6, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (96, 49, 6, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (97, 68, 6, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (98, 3, 6, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (99, 44, 6, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (100, 20, 6, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (101, 22, 6, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (102, 51, 6, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (103, 34, 7, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (104, 69, 7, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (105, 10, 7, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (106, 35, 7, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (107, 13, 7, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (108, 64, 7, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (109, 71, 7, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (110, 12, 7, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (111, 5, 7, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (112, 92, 7, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (113, 18, 7, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (114, 49, 7, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (115, 64, 7, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (116, 73, 7, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (117, 16, 7, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (118, 21, 7, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (119, 45, 7, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (120, 86, 8, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (121, 51, 8, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (122, 64, 8, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (123, 79, 8, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (124, 60, 8, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (125, 61, 8, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (126, 2, 8, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (127, 1, 8, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (128, 56, 8, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (129, 20, 8, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (130, 93, 8, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (131, 35, 8, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (132, 91, 8, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (133, 89, 8, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (134, 35, 8, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (135, 27, 8, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (136, 55, 8, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (137, 25, 9, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (138, 31, 9, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (139, 66, 9, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (140, 10, 9, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (141, 89, 9, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (142, 7, 9, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (143, 73, 9, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (144, 29, 9, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (145, 66, 9, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (146, 50, 9, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (147, 8, 9, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (148, 82, 9, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (149, 65, 9, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (150, 58, 9, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (151, 88, 9, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (152, 96, 9, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (153, 39, 9, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (154, 43, 10, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (155, 7, 10, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (156, 18, 10, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (157, 46, 10, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (158, 76, 10, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (159, 86, 10, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (160, 60, 10, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (161, 17, 10, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (162, 23, 10, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (163, 81, 10, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (164, 90, 10, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (165, 73, 10, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (166, 45, 10, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (167, 40, 10, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (168, 98, 10, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (169, 89, 10, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (170, 68, 10, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (171, 41, 11, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (172, 30, 11, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (173, 64, 11, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (174, 8, 11, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (175, 44, 11, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (176, 66, 11, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (177, 91, 11, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (178, 99, 11, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (179, 55, 11, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (180, 44, 11, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (181, 70, 11, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (182, 97, 11, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (183, 50, 11, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (184, 43, 11, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (185, 81, 11, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (186, 36, 11, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (187, 6, 11, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (188, 27, 12, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (189, 79, 12, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (190, 41, 12, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (191, 82, 12, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (192, 49, 12, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (193, 56, 12, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (194, 2, 12, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (195, 64, 12, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (196, 82, 12, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (197, 52, 12, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (198, 43, 12, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (199, 98, 12, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (200, 11, 12, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (201, 19, 12, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (202, 24, 12, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (203, 89, 12, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (204, 2, 12, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (205, 90, 13, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (206, 76, 13, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (207, 91, 13, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (208, 34, 13, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (209, 88, 13, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (210, 3, 13, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (211, 94, 13, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (212, 43, 13, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (213, 51, 13, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (214, 6, 13, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (215, 37, 13, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (216, 33, 13, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (217, 52, 13, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (218, 7, 13, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (219, 70, 13, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (220, 10, 13, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (221, 81, 13, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (222, 69, 14, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (223, 96, 14, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (224, 92, 14, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (225, 32, 14, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (226, 73, 14, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (227, 81, 14, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (228, 62, 14, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (229, 81, 14, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (230, 66, 14, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (231, 13, 14, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (232, 6, 14, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (233, 54, 14, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (234, 76, 14, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (235, 64, 14, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (236, 80, 14, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (237, 62, 14, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (238, 2, 14, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (239, 2, 15, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (240, 63, 15, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (241, 84, 15, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (242, 64, 15, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (243, 96, 15, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (244, 50, 15, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (245, 20, 15, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (246, 92, 15, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (247, 26, 15, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (248, 64, 15, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (249, 47, 15, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (250, 80, 15, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (251, 2, 15, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (252, 49, 15, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (253, 87, 15, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (254, 8, 15, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (255, 2, 15, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (256, 88, 16, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (257, 33, 16, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (258, 3, 16, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (259, 9, 16, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (260, 77, 16, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (261, 25, 16, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (262, 19, 16, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (263, 19, 16, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (264, 27, 16, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (265, 14, 16, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (266, 79, 16, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (267, 92, 16, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (268, 78, 16, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (269, 28, 16, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (270, 82, 16, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (271, 30, 16, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (272, 90, 16, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (273, 30, 17, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (274, 5, 17, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (275, 82, 17, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (276, 62, 17, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (277, 56, 17, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (278, 45, 17, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (279, 69, 17, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (280, 66, 17, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (281, 50, 17, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (282, 7, 17, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (283, 65, 17, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (284, 2, 17, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (285, 5, 17, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (286, 33, 17, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (287, 19, 17, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (288, 94, 17, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (289, 62, 17, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (290, 20, 18, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (291, 88, 18, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (292, 17, 18, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (293, 65, 18, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (294, 64, 18, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (295, 29, 18, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (296, 85, 18, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (297, 50, 18, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (298, 13, 18, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (299, 60, 18, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (300, 47, 18, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (301, 43, 18, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (302, 30, 18, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (303, 85, 18, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (304, 78, 18, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (305, 23, 18, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (306, 57, 18, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (307, 46, 19, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (308, 95, 19, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (309, 20, 19, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (310, 21, 19, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (311, 46, 19, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (312, 55, 19, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (313, 34, 19, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (314, 51, 19, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (315, 25, 19, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (316, 79, 19, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (317, 18, 19, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (318, 12, 19, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (319, 22, 19, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (320, 42, 19, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (321, 27, 19, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (322, 6, 19, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (323, 87, 19, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (324, 66, 20, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (325, 32, 20, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (326, 17, 20, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (327, 52, 20, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (328, 46, 20, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (329, 3, 20, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (330, 69, 20, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (331, 23, 20, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (332, 88, 20, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (333, 41, 20, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (334, 46, 20, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (335, 40, 20, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (336, 41, 20, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (337, 64, 20, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (338, 45, 20, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (339, 41, 20, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (340, 41, 20, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (341, 16, 21, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (342, 3, 21, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (343, 24, 21, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (344, 72, 21, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (345, 72, 21, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (346, 79, 21, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (347, 25, 21, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (348, 50, 21, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (349, 69, 21, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (350, 45, 21, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (351, 60, 21, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (352, 47, 21, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (353, 36, 21, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (354, 5, 21, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (355, 27, 21, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (356, 10, 21, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (357, 67, 21, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (358, 89, 22, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (359, 3, 22, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (360, 84, 22, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (361, 49, 22, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (362, 26, 22, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (363, 71, 22, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (364, 68, 22, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (365, 28, 22, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (366, 31, 22, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (367, 19, 22, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (368, 38, 22, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (369, 28, 22, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (370, 49, 22, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (371, 52, 22, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (372, 93, 22, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (373, 9, 22, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (374, 73, 22, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (375, 12, 23, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (376, 81, 23, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (377, 13, 23, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (378, 66, 23, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (379, 95, 23, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (380, 11, 23, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (381, 25, 23, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (382, 73, 23, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (383, 59, 23, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (384, 85, 23, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (385, 28, 23, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (386, 68, 23, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (387, 65, 23, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (388, 6, 23, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (389, 31, 23, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (390, 29, 23, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (391, 22, 23, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (392, 11, 24, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (393, 48, 24, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (394, 48, 24, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (395, 3, 24, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (396, 71, 24, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (397, 6, 24, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (398, 75, 24, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (399, 14, 24, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (400, 72, 24, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (401, 38, 24, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (402, 26, 24, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (403, 84, 24, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (404, 84, 24, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (405, 92, 24, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (406, 3, 24, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (407, 60, 24, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (408, 97, 24, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (409, 45, 25, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (410, 33, 25, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (411, 65, 25, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (412, 68, 25, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (413, 69, 25, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (414, 22, 25, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (415, 47, 25, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (416, 71, 25, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (417, 80, 25, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (418, 36, 25, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (419, 63, 25, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (420, 25, 25, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (421, 73, 25, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (422, 36, 25, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (423, 79, 25, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (424, 25, 25, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (425, 83, 25, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (426, 22, 26, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (427, 60, 26, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (428, 91, 26, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (429, 51, 26, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (430, 36, 26, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (431, 86, 26, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (432, 37, 26, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (433, 94, 26, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (434, 84, 26, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (435, 20, 26, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (436, 18, 26, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (437, 90, 26, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (438, 77, 26, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (439, 58, 26, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (440, 77, 26, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (441, 2, 26, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (442, 33, 26, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (443, 57, 27, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (444, 3, 27, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (445, 49, 27, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (446, 74, 27, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (447, 13, 27, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (448, 50, 27, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (449, 55, 27, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (450, 70, 27, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (451, 56, 27, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (452, 91, 27, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (453, 95, 27, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (454, 93, 27, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (455, 56, 27, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (456, 51, 27, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (457, 89, 27, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (458, 43, 27, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (459, 96, 27, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (460, 29, 28, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (461, 96, 28, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (462, 1, 28, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (463, 28, 28, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (464, 79, 28, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (465, 94, 28, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (466, 13, 28, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (467, 44, 28, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (468, 34, 28, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (469, 79, 28, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (470, 96, 28, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (471, 54, 28, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (472, 74, 28, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (473, 34, 28, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (474, 71, 28, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (475, 45, 28, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (476, 35, 28, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (477, 18, 29, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (478, 32, 29, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (479, 35, 29, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (480, 59, 29, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (481, 19, 29, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (482, 28, 29, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (483, 72, 29, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (484, 87, 29, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (485, 3, 29, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (486, 97, 29, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (487, 71, 29, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (488, 48, 29, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (489, 19, 29, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (490, 21, 29, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (491, 78, 29, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (492, 44, 29, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (493, 88, 29, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (494, 92, 30, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (495, 17, 30, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (496, 39, 30, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (497, 14, 30, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (498, 16, 30, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (499, 97, 30, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (500, 79, 30, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (501, 64, 30, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (502, 72, 30, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (503, 94, 30, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (504, 78, 30, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (505, 85, 30, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (506, 18, 30, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (507, 76, 30, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (508, 96, 30, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (509, 82, 30, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (510, 95, 30, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (511, 49, 31, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (512, 19, 31, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (513, 40, 31, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (514, 45, 31, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (515, 8, 31, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (516, 21, 31, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (517, 28, 31, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (518, 39, 31, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (519, 86, 31, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (520, 99, 31, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (521, 30, 31, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (522, 78, 31, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (523, 37, 31, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (524, 3, 31, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (525, 46, 31, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (526, 89, 31, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (527, 31, 31, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (528, 12, 32, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (529, 13, 32, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (530, 43, 32, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (531, 35, 32, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (532, 52, 32, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (533, 78, 32, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (534, 15, 32, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (535, 93, 32, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (536, 84, 32, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (537, 78, 32, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (538, 34, 32, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (539, 97, 32, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (540, 38, 32, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (541, 37, 32, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (542, 92, 32, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (543, 17, 32, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (544, 24, 32, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (545, 73, 33, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (546, 9, 33, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (547, 71, 33, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (548, 35, 33, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (549, 27, 33, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (550, 33, 33, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (551, 63, 33, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (552, 30, 33, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (553, 92, 33, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (554, 22, 33, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (555, 52, 33, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (556, 75, 33, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (557, 33, 33, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (558, 13, 33, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (559, 23, 33, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (560, 62, 33, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (561, 44, 33, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (562, 37, 34, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (563, 54, 34, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (564, 82, 34, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (565, 87, 34, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (566, 59, 34, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (567, 59, 34, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (568, 50, 34, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (569, 66, 34, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (570, 25, 34, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (571, 23, 34, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (572, 84, 34, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (573, 95, 34, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (574, 64, 34, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (575, 60, 34, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (576, 6, 34, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (577, 74, 34, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (578, 83, 34, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (579, 19, 35, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (580, 17, 35, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (581, 41, 35, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (582, 54, 35, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (583, 88, 35, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (584, 21, 35, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (585, 11, 35, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (586, 71, 35, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (587, 98, 35, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (588, 76, 35, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (589, 50, 35, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (590, 26, 35, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (591, 94, 35, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (592, 42, 35, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (593, 91, 35, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (594, 72, 35, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (595, 23, 35, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (596, 11, 36, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (597, 25, 36, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (598, 21, 36, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (599, 95, 36, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (600, 11, 36, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (601, 42, 36, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (602, 83, 36, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (603, 18, 36, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (604, 95, 36, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (605, 96, 36, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (606, 56, 36, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (607, 62, 36, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (608, 43, 36, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (609, 86, 36, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (610, 25, 36, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (611, 20, 36, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (612, 59, 36, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (613, 70, 37, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (614, 54, 37, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (615, 55, 37, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (616, 59, 37, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (617, 47, 37, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (618, 49, 37, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (619, 81, 37, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (620, 72, 37, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (621, 98, 37, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (622, 40, 37, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (623, 9, 37, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (624, 28, 37, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (625, 49, 37, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (626, 97, 37, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (627, 67, 37, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (628, 95, 37, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (629, 82, 37, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (630, 21, 38, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (631, 48, 38, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (632, 55, 38, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (633, 79, 38, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (634, 45, 38, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (635, 3, 38, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (636, 46, 38, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (637, 49, 38, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (638, 36, 38, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (639, 12, 38, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (640, 45, 38, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (641, 26, 38, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (642, 33, 38, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (643, 49, 38, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (644, 74, 38, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (645, 33, 38, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (646, 47, 38, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (647, 95, 39, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (648, 42, 39, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (649, 12, 39, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (650, 28, 39, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (651, 19, 39, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (652, 18, 39, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (653, 39, 39, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (654, 94, 39, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (655, 22, 39, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (656, 56, 39, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (657, 64, 39, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (658, 74, 39, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (659, 4, 39, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (660, 8, 39, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (661, 51, 39, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (662, 15, 39, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (663, 37, 39, 17);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (664, 44, 40, 1);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (665, 54, 40, 2);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (666, 13, 40, 3);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (667, 37, 40, 4);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (668, 62, 40, 5);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (669, 47, 40, 6);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (670, 3, 40, 7);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (671, 23, 40, 8);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (672, 97, 40, 9);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (673, 3, 40, 10);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (674, 45, 40, 11);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (675, 83, 40, 12);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (676, 42, 40, 13);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (677, 11, 40, 14);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (678, 5, 40, 15);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (679, 98, 40, 16);
INSERT INTO ShoeSize (Id, Quantity, ShoeColorId, SizeId) VALUES (680, 81, 40, 17);

SET IDENTITY_INSERT ShoeSize OFF;
go