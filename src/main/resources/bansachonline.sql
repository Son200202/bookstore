-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2023 at 04:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bansachonline`
--
CREATE DATABASE IF NOT EXISTS `bansachonline` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bansachonline`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `ma_Admin` int(11) NOT NULL,
  `taikhoan_Admin` varchar(20) DEFAULT NULL,
  `matkhau_Admin` varchar(50) DEFAULT NULL,
  `hoten_Admin` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gmail_Admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`ma_Admin`, `taikhoan_Admin`, `matkhau_Admin`, `hoten_Admin`, `gmail_Admin`) VALUES
(1, 'admin', '123', 'Nguyễn Thanh Sơn', 'thanhson@gmail.com'),
(2, 'toan', 'toan', 'Nguyễn Hữu Vẹn Toàn', 'toan@gmail.com'),
(3, 'linh', 'linh', 'Phan Hồng Lĩnh', 'linh@gmail.com'),
(4, 'quan', 'quan', 'Nguyễn Đắc Hồng Quân', 'quan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `ma_DH` int(11) NOT NULL,
  `ma_CuonSach` int(11) NOT NULL,
  `soluong` int(10) DEFAULT NULL,
  `gia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`ma_DH`, `ma_CuonSach`, `soluong`, `gia`) VALUES
(1, 1, 2, 49500),
(2, 2, 1, 27000);

-- --------------------------------------------------------

--
-- Table structure for table `cuonsach`
--

CREATE TABLE `cuonsach` (
  `ma_CuonSach` int(11) NOT NULL,
  `ma_DauSach` int(11) DEFAULT NULL,
  `ten_CuonSach` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tacgia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `anh_CuonSach` varchar(150) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `giabia` int(11) DEFAULT NULL,
  `mota` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cuonsach`
--

INSERT INTO `cuonsach` (`ma_CuonSach`, `ma_DauSach`, `ten_CuonSach`, `tacgia`, `soluong`, `anh_CuonSach`, `discount`, `giabia`, `mota`) VALUES
(1, 3, 'Ở đây có bí kíp cưa crush', 'Văn Nghĩa', 18, 'Ởđâycóbíkípcưacrush.jpg', 10, 55000, 'Crush chưa hẳn chỉ người bạn yêu, nhưng crush cũng không chỉ người mà bạn mới vừa rung rinh một tẹo. Crush nằm trên lằn ranh của yêu tha thiết đắm đuối nhiều năm và cảm nắng vài ngày là hết.\nBạn có muốn biến crush trở thành báu vật thực sự của riêng mình hay không?\nHãy đọc quyển sách này và nắm trọn bí kíp, bạn nha.'),
(2, 3, 'Người mẹ cầm súng', 'Nguyễn Thi', 19, 'Ngườimẹcầmsúng.jpg', 10, 30000, '“Văn Nguyễn Thi không phải là thứ văn đa nghĩa, vậy mà vẫn khiến người sành văn đọc hoài. Có phải những câu chuyện hết sức bình dị ấy hàm chứa sức sống của một đất nước trong thời bão lửa chiến tranh, nhà văn là nhân chứng trung thực? Hay là do ngôn ngữ, lời ăn tiếng nói hàng ngày của người Nam Bộ, được nhà văn chọn lọc, nâng cấp trở nên giàu sức biểu cảm đến vậy?”'),
(3, 3, 'Dế mèn phiêu lưu ký', 'Tô Hoài', 10, 'Dếmènphiêulưuký.jpg', 0, 200000, 'Nét chữ nết người, yêu mến nhà văn Tô Hoài và tác phẩm “Dế Mèn phiêu lưu ký” không thể bỏ qua cuốn sách độc đáo này!'),
(4, 3, 'Trong sương thương má', 'Trương Chí Hùng', 10, 'Trongsươngthươngmá.jpg', 10, 40000, 'Mỗi trang văn trong quyển sách này có thể xem như lát cắt từ kí ức của một đứa trẻ miền Tây. Đọc Trong sương thương má, biết đâu bạn sẽ bắt gặp khung trời tuổi thơ mình trong đó. Mà tuổi thơ nào cũng chỉ đong đầy khi có má có ba…'),
(5, 3, 'Nhâm nhi Tết Tân Sửu 2021', 'Nhiều tác giả', 10, 'NhâmnhiTếtTânSửu2021.jpg', 0, 150000, 'Hãy cùng Sáo và Nghé thăm xuân vùng cao, ghé vào bếp nhà nào ấm lửa, rong chơi trên cao nguyên bảng lảng mây trời, ngắm cây nêu ở làng quê Bắc, chậu mai e ấp nụ xinh phương Nam, nếm canh miến măng, gà luộc, thịt đông, nem rán, bún thang, lại thêm thịt kho hột vịt, canh khổ qua, dưa món củ kiệu tôm khô.'),
(6, 3, 'Các bạn của đam đam', 'Vũ Hùng', 20, 'Cácbạncủađamđam.jpg', 10, 40000, 'Các bạn của Đam Đam là câu chuyện tình bạn xúc động giữa cậu bé Đam Đam và chú chó Phay Phay. Cả hai lớn lên bên nhau, bắt đầu những cuộc đi săn trong rừng sâu. Rồi Đam Đam và Phay Phay có thêm chú khỉ Xa-ni làm bạn. Cả ba cùng nhau có những kỉ niệm khó quên.'),
(7, 3, 'Qua khỏi dốc là nhà', 'PhanThúy Hằng', 10, 'Quakhỏidốclànhà.jpg', 5, 56000, 'Cuốn sách kết thúc ở chỗ kết thúc khoảng đời đẹp nhất với một con người – thời đi học – khiến ta nghẹn giọng, vì nỗi buồn nặng như đất, mạnh mẽ và khô rốc ở trong đó.'),
(8, 3, 'Cuộc trùng phùng trong mơ', 'Nguyễn Đông Thức', 10, 'Cuộctrùngphùngtrongmơ.jpg', 0, 23000, 'Với cách viết lôi cuốn, sống động mà cũng thật truyền cảm, nhà văn Nguyễn Đông Thức đưa độc giả vào một hành trình trưởng thành đầy những bất ngờ. Để ở chặng cuối, ta cảm nhận một điều giản dị: Dù gian nan trắc trở thế nào, hạnh phúc sẽ đến với ta, một khi ta có tình bạn thật ấm áp.'),
(9, 3, 'Sự tích hoa phượng', 'Phạm Sông Đông', 10, 'Sựtíchhoaphượng.jpg', 10, 18000, 'Hoa phượng năm cánh với sắc màu rực rỡ luôn gắn bó với tuổi thơ, học trò và mùa hạ. Thế nhưng không phải ai cũng biết, có ít nhất một truyện cổ tích vừa mang hơi hướng dân gian lại vừa có phong cách hiện đại về loài hoa thân thương này. Đó là câu chuyện cảm động về nghĩa thầy trò, lòng nhân ái, ý chí chuyên cần và sự lương thiện như ánh sáng xua đi bóng tối xấu xa, hắc ám…'),
(10, 3, 'Thơ Xuân Hương', 'Hồ Xuân Hương', 10, 'ThơXuânHương.jpg', 10, 28000, '“Thơ Hồ Xuân Hương là tiếng nói tâm tình của người phụ nữ, thể hiện một bản lĩnh sống mạnh mẽ khác thường”. (Giáo sư LÊ TRÍ VIỄN)\n“Ngôn ngữ dân tộc dưới ngòi bút của Hồ Xuân Hương vừa súc tích, chính xác lại vừa uyển chuyển, linh hoạt phong phú về nghĩa, đặc sắc về tạo hình, dồi dào về âm thanh, nhịp điệu.” (Giáo sư NGUYỄN LỘC)'),
(11, 3, 'Truyện Tây Bắc', 'Tô Hoài', 10, 'TruyệnTâyBắc.jpg', 10, 50000, '“Đọc Truyện Tây Bắc, chúng ta có cảm tưởng đó vừa là một bản cáo trạng, vừa là một khúc tình ca: cáo trạng đối với phong kiến miền núi và thực dân, tình ca ngợi khen cảnh đẹp, tập quán hay, tinh thần cách mạng, quan hệ giữa người và người Tây Bắc, như bản tình ca viết với một bút pháp trữ tình nồng đượm và nên thơ.”'),
(12, 3, 'Những hạnh phúc rực rỡ', 'Nhiều tác giả', 10, 'Nhữnghạnhphúcrựcrỡ.jpg', 5, 38000, 'Những hạnh phúc rực rỡ - cuốn sách đến từ những tác giả được yêu thích nhất của Văn Học Trẻ: Raxu Nguyễn, Jathy, Bảo Châu, Huy Hải, sẽ là món quà ý nghĩa dành cho tất cả chúng ta, đặc biệt là những người trẻ đang kiếm tìm cho mình hạnh phúc'),
(13, 3, 'Nhạc đồng quê', 'Nguyễn Văn Thanh', 10, 'Nhạcđồngquê.jpg', 0, 16000, 'Truyện đồng thoại vừa cổ tích vừa hiện đại, thoáng chút ưu phiền, trầm lắng trăn trở nhưng vẫn lấp lánh niềm vui, lạc quan và hi vọng như dư âm của giai điệu Nhạc đồng quê.'),
(14, 4, 'Đóa hoa hạnh phúc', 'Koyoharu Gotouge', 15, 'Đóahoahạnhphúc.jpg', 10, 50000, 'cuốn sách nhỏ này còn chứa những câu chuyện về Zenitsu, Inosuke và các thành viên trong đội Diệt Quỷ chưa từng được nhắc tới trong truyện chính! Không những thế, phần phụ lục “Học viện Diệt Quỷ” rất được yêu thích cũng được viết thành tiểu thuyết!! Sách tặng kèm 01 lót ly cho những bản in đầu. Xin trân trọng giới thiệu cùng bạn đọc.'),
(15, 4, 'Mùa đông bất tận', 'Laura Ingalls Wilder', 10, 'Mùađôngbấttận.jpg', 10, 80000, 'Những trận bão tuyết kinh hoàng giày xéo thị trấn De Smet. Tất cả mọi người trong đó có nhà Laura, mòn mỏi, buồn lo với những bữa ăn ngày càng ít ỏi và phải chống chọi với nguy cơ chết đói. Almanzo Wilder đã quyết tâm vượt bão tuyết, chấp nhận mọi rủi ro và cùng với Cap Garland đi mua lúa mì cứu thị trấn. Cuối cùng mùa xuân cũng về, mặt trời lên, cỏ xanh mướt và mọi người có thể ca hát trong no ấm, quên đi những nỗi sợ hãi suốt mùa đông khắc nghiệt...'),
(16, 4, 'Thần thoại Hy Lạp', 'Phạm Văn Khỏa', 10, 'ThầnthoạiHyLạp.jpg', 10, 86000, 'Chuyện những người Argonaut giành lại bộ lông cừu vàng từ miền đất Colchis thần thoại, cuộc trường chinh ròng rã một thập niên các anh hùng Hy Lạp công phá thành Troy, hải trình đầy bão táp dũng tướng Odysseus tài trí về quê xứ… là những bản trường ca của binh lửa và giáo gươm, trong một vũ trụ thần thoại có trung tâm là vẻ đẹp của con người.'),
(17, 4, 'Câu chuyện đời tôi', 'Helen Keller', 10, 'Câuchuyệnđờitôi.jpg', 10, 45000, 'Đây cũng là câu chuyện nổi tiếng về cô gái vừa khiếm thính, vừa khiếm thị đầu tiên trên thế giới giành được bằng đại học. Và hơn tất cả, đây là câu chuyện của trái tim − điều khiến cho tác giả Helen Keller trở  thành  “Một  trong  những  người  phụ  nữ vĩ đại nhất trong thời đại của chúng ta.”'),
(18, 4, 'Sự tích các loài vật', 'Rudyard Kipling', 30, 'Sựtíchcácloàivật.jpg', 0, 160000, 'Những điều thần diệu người ta thường tìm thấy trong các tác phẩm kì diệu. “Sự tích các loài vật - Chuyện như thế đó” là một tác phẩm như thế. Trong cuốn sách này, nội dung các chuyện kể chúng tôi dịch theo bản tiếng Pháp của dịch giả Nathalie Peronny và sử dụng minh họa của họa sĩ Pháp Sébastien Pelon. Chúng tôi hi vọng những nét minh họa vừa mềm mại, vừa tinh nghịch, mới mẻ, sẽ làm tăng sức hấp dẫn của 12 chuyện kể'),
(19, 4, 'Phòng khám cho ma', 'Nhiều tác giả', 10, 'Phòngkhámchoma.jpg', 0, 45000, 'Bởi những nguyên do hết sức tình cờ, tớ có dịp đặt chân vào thế giới yêu ma và trở thành phụ tá bất đắc dĩ cho bác sĩ Hozuki Kyujuro, người duy nhất trên đời chữa bệnh cho yêu ma quỷ quái. Những  cuộc phiêu lưu cùng bác sĩ cuốn tớ vào biết bao rắc rối. Một hôm, đúng đợt khám sức khỏe định kì ở trường tớ, bác sĩ Hozuki bất ngờ xuất hiện. Bác sĩ làm gì ở thế giới loài người nhỉ?'),
(20, 4, 'Đóa hoa hạnh phúc', 'Koyoharu Gotouge', 15, 'Đóahoahạnhphúc.jpg', 10, 50000, 'cuốn sách nhỏ này còn chứa những câu chuyện về Zenitsu, Inosuke và các thành viên trong đội Diệt Quỷ chưa từng được nhắc tới trong truyện chính! Không những thế, phần phụ lục “Học viện Diệt Quỷ” rất được yêu thích cũng được viết thành tiểu thuyết!! Sách tặng kèm 01 lót ly cho những bản in đầu. Xin trân trọng giới thiệu cùng bạn đọc.'),
(21, 4, 'Mùa đông bất tận', 'Laura Ingalls Wilder', 10, 'Mùađôngbấttận.jpg', 10, 80000, 'Những trận bão tuyết kinh hoàng giày xéo thị trấn De Smet. Tất cả mọi người trong đó có nhà Laura, mòn mỏi, buồn lo với những bữa ăn ngày càng ít ỏi và phải chống chọi với nguy cơ chết đói. Almanzo Wilder đã quyết tâm vượt bão tuyết, chấp nhận mọi rủi ro và cùng với Cap Garland đi mua lúa mì cứu thị trấn. Cuối cùng mùa xuân cũng về, mặt trời lên, cỏ xanh mướt và mọi người có thể ca hát trong no ấm, quên đi những nỗi sợ hãi suốt mùa đông khắc nghiệt...'),
(22, 4, 'Thần thoại Hy Lạp', 'Phạm Văn Khỏa', 10, 'ThầnthoạiHyLạp.jpg', 10, 86000, 'Chuyện những người Argonaut giành lại bộ lông cừu vàng từ miền đất Colchis thần thoại, cuộc trường chinh ròng rã một thập niên các anh hùng Hy Lạp công phá thành Troy, hải trình đầy bão táp dũng tướng Odysseus tài trí về quê xứ… là những bản trường ca của binh lửa và giáo gươm, trong một vũ trụ thần thoại có trung tâm là vẻ đẹp của con người.'),
(23, 4, 'Câu chuyện đời tôi', 'Helen Keller', 10, 'Câuchuyệnđờitôi.jpg', 10, 45000, 'Đây cũng là câu chuyện nổi tiếng về cô gái vừa khiếm thính, vừa khiếm thị đầu tiên trên thế giới giành được bằng đại học. Và hơn tất cả, đây là câu chuyện của trái tim − điều khiến cho tác giả Helen Keller trở  thành  “Một  trong  những  người  phụ  nữ vĩ đại nhất trong thời đại của chúng ta.”'),
(24, 4, 'Sự tích các loài vật', 'Rudyard Kipling', 30, 'Sựtíchcácloàivật.jpg', 0, 160000, 'Những điều thần diệu người ta thường tìm thấy trong các tác phẩm kì diệu. “Sự tích các loài vật - Chuyện như thế đó” là một tác phẩm như thế. Trong cuốn sách này, nội dung các chuyện kể chúng tôi dịch theo bản tiếng Pháp của dịch giả Nathalie Peronny và sử dụng minh họa của họa sĩ Pháp Sébastien Pelon. Chúng tôi hi vọng những nét minh họa vừa mềm mại, vừa tinh nghịch, mới mẻ, sẽ làm tăng sức hấp dẫn của 12 chuyện kể'),
(25, 4, 'Phòng khám cho ma', 'Nhiều tác giả', 10, 'Phòngkhámchoma.jpg', 0, 45000, 'Bởi những nguyên do hết sức tình cờ, tớ có dịp đặt chân vào thế giới yêu ma và trở thành phụ tá bất đắc dĩ cho bác sĩ Hozuki Kyujuro, người duy nhất trên đời chữa bệnh cho yêu ma quỷ quái. Những  cuộc phiêu lưu cùng bác sĩ cuốn tớ vào biết bao rắc rối. Một hôm, đúng đợt khám sức khỏe định kì ở trường tớ, bác sĩ Hozuki bất ngờ xuất hiện. Bác sĩ làm gì ở thế giới loài người nhỉ?'),
(26, 4, 'Lớn lên trên đảo vắng', 'Johann David Wyss', 10, 'Lớnlêntrênđảovắng.jpg', 0, 58000, 'Những chi tiết thú vị về cuộc sống nơi hoang dã, những bài học bổ ích về thế giới tự nhiên đã khiến \"Lớn lên trên đảo vắng\" của Johann David Wyss trở thành một trong những tác phẩm nổi tiếng nhất mọi thời đại'),
(27, 4, 'Đảo giấu vàng', 'R.L.Stevenson', 10, 'Đảogiấuvàng.jpg', 0, 36000, 'Ngay sau khi xuất bản, câu chuyện đi tìm kho báu của nhà văn Stevenson đã tạo nên một tiếng vang lớn. Thủ tướng Anh khi đó là William Gladstone đã thức tới hai giờ sáng để đọc hết cuốn sách. Đến nay, đã có hơn 50 bộ phim truyện và phim truyền hình được chuyển thể từ tác phẩm của Stevenson. Và trải qua một thời gian dài, Đảo giấu vàng đã trở nên gắn bó với nhiều thế hệ độc giả nhỏ tuổi trên toàn thế giới'),
(28, 4, 'Công chúa nhỏ', 'Hodgson Burnett', 10, 'Côngchúanhỏ.jpg', 10, 68000, 'Với tâm hồn trong trẻo và cao quý của một nàng công chúa, Sara có thể can đảm vượt qua tất cả những nghiệt ngã để vươn tới cuộc sống tốt đẹp trong tương lai? Đó là một câu chuyện cảm động sâu sắc về nhân cách của nàng công chúa bé nhỏ và, chắc chắn rồi, về cả những phép màu...'),
(29, 4, 'Hoàng tử bé', 'Saint Exupéry', 10, 'Hoàngtửbé.jpg', 0, 25000, '“Hoàng Tử Bé” (tên tiếng Pháp: Le Petit Prince) xuất bản năm 1943 và là tác phẩm nối tiếng nhất trong sự nghiệp của nhà văn phi công Pháp Antoine de Saint-Exupéry. Tác phẩm đã được dịch sang hơn 250 ngôn ngữ và cho đến nay đã bán được hơn 200 triệu bản khắp thế giới.'),
(30, 4, 'Lối thoát tử thần', 'Dames Dashner', 10, 'Lốithoáttửthần.jpg', 10, 95000, 'Trong một thế giới bị tàn phá vì biến đổi khí hậu, Thomas và các bạn làm mọi cách để sống sót và tồn tại. Nhưng, hiểm họa lớn nhất lại đến từ phía khó ngờ nhất: Con người. Con người mù quáng vì tham vọng. Con người điên cuồng vì hận thù. Con người vì virus Nhật trùng mà mất hết nhân tính. Ai sẽ sống sót? Ai sẽ chấp nhận hi sinh vì sự tồn vong của nhân loại? Lối thoát nào đang chờ đợi những người trẻ sau quá nhiều mất mát đau thương?'),
(31, 1, 'Chị Sáu ở Côn Đảo', ' Lê Quang Vịnh', 10, 'ChịSáuởCônĐảo.jpg', 10, 10000, 'Truyện kể về chị Võ Thị Sáu, người con gái Đất Đỏ anh hùng.'),
(32, 1, 'Lý Thường Kiệt', 'Tạ Huy Long', 10, 'LýThườngKiệt.jpg', 10, 15000, 'Lý Thường Kiệt tên thật là Ngô Tuấn, một vị tướng kiệt xuất trong lịch sử Việt Nam. Ông nhiều lần thống lĩnh ba quân “phá Tống, bình Chiêm”, giữ bờ cõi nhiều năm trong cảnh thanh bình. Ông lại đem tài sức giúp vua Lý phát mở mang canh nông, xây dựng nhà học, góp phần gây dựng nền văn hiến Đại Việt'),
(33, 1, 'Suốt đời học Bác', 'Kiều Mai Sơn', 10, 'SuốtđờihọcBác.jpg', 10, 40000, 'Bác Hồ, vị lãnh tụ kính yêu của dân tộc Việt Nam, người chiến sĩ cộng sản suốt đời tận tụy vì nước, vì dânvới những phẩm chất giản dị mà cao đẹp luôn là tấm gương sáng cho nhiều thế hệ tìm hiểu, học tập, noi theo.'),
(34, 1, 'Người lính Điện Biên kể chuyện', 'Kiều Mai Sơn', 20, 'NgườilínhĐiệnBiênkểchuyện.jpg', 10, 30000, '“Mỗi lần trở lại Điện Biên Phủ, tôi tới nghĩa trang liệt sĩ dưới chân đồi A1 thắp nén hương tưởng niệm những người đồng đội đã nằm lại đây. Đứng trước rất nhiều ngôi mộ không có tên, tôi hình dung ra anh chiến sĩ trẻ tới chiến trường giữa trận đánh, chiến đấu bên những người đồng đội chưa kịp biết tên mình và mình cũng chưa kịp biết là ở đơn vị nào...”'),
(35, 1, 'Chu Văn An', 'Nhiều tác giả', 20, 'ChuVănAn.jpg', 0, 45, 'hân kỉ niệm 650 năm ngày mất Chu Văn An (1370 - 2020), Nhà xuất bản Kim Đồng trân trọng gửi tới các em cuốn sách này - nơi những trang sách ghi lại nét đẹp nhân cách người thầy mẫu mực - nhà giáo Chu Văn An'),
(36, 1, 'Nghìn xưa Văn Hiến', 'Trần Quốc Vượng', 10, 'NghìnxưaVănHiến.jpg', 0, 198000, 'Cuốn sách “Nghìn xưa văn hiến” được xây dựng từnhững năm 60 - 70 của thế kỉ trước với vai trò chủ đạo củanhà sử học Trần Quốc Vượng, cùng sự đóng góp công phucủa các nhà nghiên cứu lịch sử và văn hóa truyền thông cóuy tín là Nguyễn Từ Chi, Nguyễn Cao Lũy, Nguyễn Trần Đản.'),
(37, 1, 'Kim Đồng', 'Tô Hoài', 20, 'KimĐồng.jpg', 0, 24000, 'Cuốn sách là câu chuyện cảm động về một trong những đội viên đầu tiên của Đội Thiếu niên Tiền phong Hồ Chí Minh - anh Kim Đồng.'),
(38, 1, 'Lý Tự Trọng', 'Nhiều tác giả', 20, 'LýTựTrọng.jpg', 10, 30000, 'Câu chuyện về cuộc đời và tấm gương hi sinh anh dũng của anh Lý Tự Trọng đã được kể bằng nhiều hình thức nghệ thuật như văn học, điện ảnh, âm nhạc… Đây là lần đầu tiên hình tượng những người anh hùng thiếu niên Lý Tự Trọng được tái hiện trong tác phẩm sách tranh minh họa màu khổ lớn'),
(39, 1, 'Trong giông gió Trường Sa', 'Nhiều tác giả', 20, 'TronggiônggióTrườngSa.jpg', 10, 30000, 'Qua những trang viết giàu hình ảnh và đầy xúc cảm, độc giả sẽ được trải nghiệm cuộc sống trên đảo với nhiều cung bậc cảm xúc: một Trường Sa thật dữ dội, khắc nghiệt nhưng cũng thật hiền hòa, dịu êm; cuộc sống trên đảo có lúc cô đơn rợn ngợp nhưng cũng thật thú vị, đầm ấm, chứa chan tình người. Đọc xong cuốn sách, chắc hẳn mỗi độc giả sẽ đều ấp ủ mong muốn một lần được đến với Trường Sa'),
(40, 2, 'Vén màn ảo thuật', 'John Wood', 20, 'Vénmànảothuật.jpg', 10, 42000, 'Cuốn sách giới thiệu về Ảo thuật đánh lừa thị giác. Vậy là, bạn muốn trở thành một ảo thuật gia phải không nào? Chà, bạn tìm tới đúng chỗ rồi đấy. Rất nhiều bí mật đang chờ bạn khám phá bên trong cuốn sách này. Đọc xong sách, bạn sẽ trở thành bậc thầy về ảo thuật đánh lừa thị giác. Cùng bắt đầu nhé!'),
(41, 2, 'Từ điển cảm xúc cho bé', 'Chuyện', 20, 'Từđiểncảmxúcchobé.jpg', 10, 124000, 'Từ điển cảm xúc cho bé là cuộc phiêu lưu của bố mẹ và bé vào thế giới ngôn từ. Những từ ngữ mới lạ mô tả rất nhiều cảm xúc, hành động, tình cảm khác nhau mà bố mẹ có thể dạy cho các bé, gieo những hạt mầm đầu tiên vào tâm trí trẻ thơ, giúp bé yêu ngôn ngữ, chăm đọc sách, ngày càng hiểu biết cuộc sống và thế giới này.'),
(42, 2, 'Vòng quanh thế giới', 'Hoài Nam', 10, 'Vòngquanhthếgiới.jpg', 0, 12000, 'Mỗi đất nước trên thế giới đều có rất nhiều điều thú vị để khám phá. Với chuyến du hành Vòng quanh thế giới, bạn sẽ được ghé thăm rất nhiều quốc gia, địa điểm nổi tiếng, biết thêm nhiều truyền thống văn hóa, lễ hội lí thú của con người khắp mọi nơi. Nào, còn chần chừ gì nữa, lên đường thôi!'),
(43, 2, 'Châu Âu huyền bí', 'Phillip Ngo', 10, 'ChâuÂuhuyềnbí.jpg', 0, 85000, 'Hi vọng các bạn cùng tôi bước vào chuyến phiêu lưu kì bí, tha hồ sởn gai ốc và cũng học rất nhiều điều về lịch sử, văn hóa của châu Âu.'),
(44, 5, 'Không sao đâu con', 'Shen Nuan', 10, 'Khôngsaođâucon.jpg', 0, 33000, 'Thật vui khi được dự sinh nhật bạn thân, phải không các em? Bạn heo con trong câu chuyện này hớn hở mang một đoá hoa tươi đến làm quà sinh nhật bạn. Nhưng, trên đường đi, cậu gặp phải rất nhiều rắc rối. Chuyện gì xảy ra thế nhỉ? Chúng mình cùng đọc truyện nhé!'),
(45, 5, 'Cần cả ngôi làng', 'Hillary Rodham Clinton', 10, 'Cầncảngôilàng.jpg', 0, 40000, 'Nếu thế giới là một ngôi làng, hãy chung tay xây một ngôi làng đáng sống cho mọi trẻ em trên đời.'),
(46, 5, 'Tý Quậy - Tập 1', 'Đào Hải', 10, 'TýQuậy-Tập1.jpg', 0, 40000, '“ Những trò đùa vui học trò ai cũng đã từng kinh qua, những nghịch ngợm nho nhỏ trên đường trưởng thành… bạn đọc nhí sẽ cười nghiêng ngả, cha mẹ cũng bật cười : “ Sao Tý và Tèo giống mình ngày xưa quá vậy!” Sau những trận cười ấy, hẳn bạn sẽ nhận ra điều nhắn nhủ giản đơn mà sâu sắc của tác giả, giúp chúng ta  học hỏi và tiến bộ hơn sau mỗi tiếng cười vui vẻ.'),
(47, 5, 'Tý Quậy - Tập 2', 'Đào Hải', 10, 'TýQuậy-Tập2.jpg', 0, 40000, '“ Những trò đùa vui học trò ai cũng đã từng kinh qua, những nghịch ngợm nho nhỏ trên đường trưởng thành… bạn đọc nhí sẽ cười nghiêng ngả, cha mẹ cũng bật cười : “ Sao Tý và Tèo giống mình ngày xưa quá vậy!” Sau những trận cười ấy, hẳn bạn sẽ nhận ra điều nhắn nhủ giản đơn mà sâu sắc của tác giả, giúp chúng ta  học hỏi và tiến bộ hơn sau mỗi tiếng cười vui vẻ.'),
(48, 5, 'Tý Quậy - Tập 3', 'Đào Hải', 10, 'TýQuậy-Tập3.jpg', 0, 40000, '“ Những trò đùa vui học trò ai cũng đã từng kinh qua, những nghịch ngợm nho nhỏ trên đường trưởng thành… bạn đọc nhí sẽ cười nghiêng ngả, cha mẹ cũng bật cười : “ Sao Tý và Tèo giống mình ngày xưa quá vậy!” Sau những trận cười ấy, hẳn bạn sẽ nhận ra điều nhắn nhủ giản đơn mà sâu sắc của tác giả, giúp chúng ta  học hỏi và tiến bộ hơn sau mỗi tiếng cười vui vẻ.'),
(49, 5, 'Tý Quậy - Tập 4', 'Đào Hải', 10, 'TýQuậy-Tập4.jpg', 0, 40000, 'Chúng ta như tìm thấy chính mình trong hình ảnh của Tý và Tèo những lúc nghịch ngợm, bị điểm kém, bị bố mẹ mắng... hay những phút giây nhận ra lỗi lầm và thấy mình ngày một trưởng thành, lớn khôn hơn, biết yêu thương cha mẹ, kính trọng thầy cô và yêu quý bè bạn.'),
(50, 5, 'Tý Quậy - Tập 5', 'Đào Hải', 10, 'TýQuậy-Tập5.jpg', 0, 40000, 'Chúng ta như tìm thấy chính mình trong hình ảnh của Tý và Tèo những lúc nghịch ngợm, bị điểm kém, bị bố mẹ mắng... hay những phút giây nhận ra lỗi lầm và thấy mình ngày một trưởng thành, lớn khôn hơn, biết yêu thương cha mẹ, kính trọng thầy cô và yêu quý bè bạn.'),
(51, 5, 'Tý Quậy - Tập 6', 'Đào Hải', 10, 'TýQuậy-Tập6.jpg', 0, 40000, 'Chúng ta như tìm thấy chính mình trong hình ảnh của Tý và Tèo những lúc nghịch ngợm, bị điểm kém, bị bố mẹ mắng... hay những phút giây nhận ra lỗi lầm và thấy mình ngày một trưởng thành, lớn khôn hơn, biết yêu thương cha mẹ, kính trọng thầy cô và yêu quý bè bạn.'),
(52, 5, 'Tý Quậy - Tập 7', 'Đào Hải', 10, 'TýQuậy-Tập7.jpg', 0, 40000, '“ Những trò đùa vui học trò ai cũng đã từng kinh qua, những nghịch ngợm nho nhỏ trên đường trưởng thành… bạn đọc nhí sẽ cười nghiêng ngả, cha mẹ cũng bật cười : “ Sao Tý và Tèo giống mình ngày xưa quá vậy!” Sau những trận cười ấy, hẳn bạn sẽ nhận ra điều nhắn nhủ giản đơn mà sâu sắc của tác giả, giúp chúng ta  học hỏi và tiến bộ hơn sau mỗi tiếng cười vui vẻ.'),
(53, 5, 'Bật đèn soi bí mật', 'Carron Brown', 10, 'Bậtđènsoibímật.jpg', 10, 45000, 'Sách tranh kiến thức đơn giản về thiên nhiên, phương tiện giao thông và kì quan thế giới với thể nghiệm mới - soi đèn pin để tìm đáp án'),
(54, 6, 'Gintama - Tập 65', 'Hideaki Sorachi', 10, 'Gintama-Tập65.jpg', 10, 20000, 'Quỷ Biển buộc phải quyết chiến với Utsuro nhằm bảo vệ gia đình. Trước kẻ địch quá mạnh, ông ta chỉ còn cách lấy mạng đổi mạng. Mặt khác, Kamui vô cùng thèm khát danh hiệu “mạnh nhất vũ trụ” của cha mình, bản năng bộ tộc Yato trong cậu liền trỗi dậy.'),
(55, 6, 'Đạo làm chồng đảm - Tập 2', 'Kousuke Oono', 10, 'Đạolàmchồngđảm-Tập2.jpg', 5, 30000, 'Huyền thoại của giới xã hội đen - Tatsu Bất Tử - sau khi lấy vợ bỗng lột xác trở thành một người chồng siêu đảm đang! Từ NẤU CƠM, GIẶT GIŨ đến ĐI CHỢ, QUÉT NHÀ… mọi thứ đều CHU TOÀN TUYỆT ĐỐI!!'),
(56, 6, 'Doraemon Plus - Tập 2', 'Fujiko F Fujio', 10, 'DoraemonPlus-Tập2.jpg', 20, 20000, 'Doraemon Plus tập hợp những truyện ngắn chưa từng có trong bộ truyện Doraemon 45 tập đã rất quen thuộc với tất cả chúng ta. Đặc biệt Doraemon Plus tập 6 còn giới thiệu 21 truyện ngắn cực kì hấp dẫn và chưa từng được công bố!'),
(57, 6, 'Gintama - Tập 63', 'Hideaki Sorachi', 10, 'Gintama-Tập63.jpg', 10, 20000, 'Cuộc chiến với tam hung tinh của Mưa Xuân và đám cường địch đã khiến Katsura, Sakamoto, Gintoki dần kiệt sức. Katsura đọ kiếm với gã lực sĩ đội trưởng đội 4, trong khi đó Sakamoto, Gintoki cũng khổ chiến với tinh thần của những võ sĩ cuối cùng còn lại…'),
(58, 6, 'Gintama - Tập 64', 'Hideaki Sorachi', 10, 'Gintama-Tập64.jpg', 10, 20000, 'Khi cuộc chiến giữa các phe phái Mưa Xuân, Quỷ Biển và nhóm Gintoki lên tới đỉnh điểm gay cấn thì cuối cùng, “người đó” đã tỉnh lại… Lần nào gặp nhau, hai cha con Kamui và Quỷ Biển cũng tranh cãi gay gắt, nay có thêm sự góp mặt của Kagura, bí mật về gia đình họ đã dần được hé lộ…'),
(59, 6, 'Gintama - Tập 66', 'Hideaki Sorachi', 10, 'Gintama-Tập65.jpg', 10, 20000, 'Khi xưa, thầy Shoyo đã tới thôn Tùng Hạ mở lớp học cùng đệ tử đầu tiên là Oboro. Sau đó, Oboro rời khỏi đó, trở thành thủ lĩnh của Naraku. Chính hắn đã tiết lộ âm mưu kinh thiên động địa mà Utsuro suy tính bấy lâu. Utsuro đã chọn cách thức nào để kết thúc sinh mệnh vĩnh cửu của mình đây?'),
(60, 6, 'Gintama - Tập 67', 'Hideaki Sorachi', 10, 'Gintama-Tập66.jpg', 10, 20000, 'Để ngăn chặn chiến tranh tầm cỡ vũ trụ do Utsuro khởi xướng. Tokugawa Nobunobu âm mưu liên minh mới quân giải phóng. Cuộc liên minh ấy sẽ đem lại kết quả gì đây? Mặt khác, đội quân bất tử Utsuro phóng thích đang hoành hành khắp Edo, tình hình nguy khốn hơn bao giờ hết. Ấy thế mà, lại một lần nữa...'),
(61, 6, 'Gintama - Tập 68', 'Hideaki Sorachi', 10, 'Gintama-Tập67.jpg', 10, 20000, 'Người dân Edo và lính Mạc Phủ cũ đang nhất tề đứng dậy chống lại gọng kìm của không quân và lục quân giải phóng. Giữ lúc dầu sôi lửa bỏng, kĩ sư vĩ đại Gengai đã tung ra vũ khí bí mật vô cùng lợi hại. Cùng lúc đó, Tiệm Vạn Năng cũng tái xuất giang hồ!!'),
(62, 6, 'Gintama - Tập 69', 'Hideaki Sorachi', 10, 'Gintama-Tập68.jpg', 10, 20000, 'Nhằm hồi phục sau thương tích do đại bác khổng lồ Gengai gây ra, quân Shinra đã bắt cóc Otae và mọi người rồi đuổi theo “kẻ khai thác năng lượng”. Trước tình hình Edo đang tan rã, nhóm “hộ vệ Kabuki” hết sức đau lòng, họ buộc phải quay lại và giải cứu cho những con tin...'),
(63, 6, 'Gintama - Tập 70', 'Hideaki Sorachi', 10, 'Gintama-Tập69.jpg', 10, 20000, 'Quân giải phóng đã bắt cóc ông Gengai để ngăn chặn virus-những cỗ máy siêu nhỏ- đang lây lan khắp Địa Cầu. Chúng cưỡng ép ông bằng cách bổ sung Trái Đất vào danh sách những hành tinh chờ phá huỷ. Ngay thời điểm nguy khốn ấy, bất ngờ xuất hiện một đạo quân tiếp viện...'),
(64, 6, 'Gintama - Tập 71', 'Hideaki Sorachi', 10, 'Gintama-Tập70.jpg', 10, 20000, 'Ý đồ của Utsuro đã rõ! Hắn sẽ cholong mạch Altana va chạm với vũ khí của quân giải phóng để tạo ra một cú nổ lớn đủ sức phá tan tành cả thế giới. Để ngăn chặn họng pháo khổng lồ của quân giải phóng, Binh Đoàn Quỷ đã kêu gọi toàn quân tham chiến. Và rồi, vào giờ khắc quan trọng, một vị anh hùng đã giáng thế!?'),
(65, 6, 'Gintama - Tập 72', 'Hideaki Sorachi', 10, 'Gintama-Tập71.jpg', 10, 20000, 'Ensho và Takasugi. Thứ trói buộc những kẻ sẵn sàng vứt bỏ mạng sống của mình nơi chiến trường phải chăng là xiềng xích của thù hận? Trên mặt đất lúc này, còn có một nhóm người nọ cũng đang cật lực góp phần ngăn chặn họng pháo khổng lồ kia. Thậm chí là cả cún con Sadaharu...'),
(66, 6, 'Gintama - Tập 73', 'Hideaki Sorachi', 10, 'Gintama-Tập72.jpg', 10, 20000, 'Chiến hạm Amenotori đã mất kiểm soát và vẫn đang tiếp tục rơi tự do xuống Địa Cầu. Trước cảnhdân tình đang căng thẳng nghĩ cách ngăn con tàu này va chạm với nguồn Altana sôi sục bên dưới, chú Hasegawa đã nảy ra một ý tưởng không ai ngờ tới!? Giữa lúc dầu sôi lửa bỏng, cơ thể Utsuro đã có một thay đổi lạ lùng khi giao chiến với tiệm Vạn Năng...'),
(67, 6, 'Gintama - Tập 74', 'Hideaki Sorachi', 10, 'Gintama-Tập73.jpg', 10, 20000, 'Cảm xúc của Utsuro đã bắt đầu lay động khi chứng kiến những con người với sinh mệnh ngắn ngủi đang không ngần ngại xả thân vì nhau. Thêm nữa, các phản ứng của long mạch Altana đã suy yếu khiến Utsuro không thể chống đỡ sự tấn công dồn dập của bọn Gintoki. Trận chiến sinh tử đang dần đi vào hồi kết và vận mệnh của Trái Đất sẽ ra sao?'),
(68, 6, 'Gintama - Tập 75', 'Hideaki Sorachi', 10, 'Gintama-Tập74.jpg', 10, 20000, 'Gintoki bị một đám không rõ thân thế truy đuổi gắt gao. Chúng lăm le cướp đi một món hàng cực kì quý giá trên người anh. Sau 2 năm ở ẩn và tu luyện đạt tới trí tuệ siêu việt, Gintoki đã thu về được thành quả gì?');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ma_Customer` int(11) NOT NULL,
  `taikhoan_Customer` varchar(20) DEFAULT NULL,
  `matkhau_Customer` varchar(20) DEFAULT NULL,
  `hoten_Customer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gmail_Customer` varchar(100) DEFAULT NULL,
  `sdt_Customer` varchar(15) DEFAULT NULL,
  `vitien` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ma_Customer`, `taikhoan_Customer`, `matkhau_Customer`, `hoten_Customer`, `gmail_Customer`, `sdt_Customer`, `vitien`) VALUES
(1, 'son123', 'son123', 'Nguyễn Thanh Sơn', 'thanhson123@gmail', '0777239563', 1230000),
(2, 'toan123', 'toan123', 'Nguyễn Hữu Vẹn Toàn', 'toan123@gmail.com', '098 729 1386', 2250000),
(3, 'linh123', 'linh123', 'Phan Hồng Lĩnh', 'linh123@gmail.com', '098 729 2386', 5260000),
(4, 'quan123', 'quan123', 'Nguyễn Đắc Hồng Quân', 'quan123@gmail.com', '098 729 3386', 1330000),
(5, 'hung123', 'hung123', 'Nguyễn Ngọc Hưng', 'hung123@gmail.com', '098 729 4386', 1180000);

-- --------------------------------------------------------

--
-- Table structure for table `dausach`
--

CREATE TABLE `dausach` (
  `ma_DauSach` int(11) NOT NULL,
  `ten_DauSach` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dausach`
--

INSERT INTO `dausach` (`ma_DauSach`, `ten_DauSach`) VALUES
(1, 'Lịch sử - Truyền thống'),
(2, 'Kiến thức khoa học'),
(3, 'Văn học Việt Nam'),
(4, 'Văn học nước ngoài'),
(5, 'Truyện tranh'),
(6, 'Manga - Comic');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `ma_DH` int(11) NOT NULL,
  `ma_Customer` int(11) DEFAULT NULL,
  `diachi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sdt` varchar(15) DEFAULT NULL,
  `ngaydat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tongtien` int(11) DEFAULT NULL,
  `tinhtrang` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ghichu` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`ma_DH`, `ma_Customer`, `diachi`, `sdt`, `ngaydat`, `tongtien`, `tinhtrang`, `ghichu`) VALUES
(1, 1, '97 Man thiện', '077 723 9563', '2023-11-21 07:38:54', 99000, 'Đã giao', 'Đã thanh toán'),
(2, 1, '97 Man Thiện', '077 723 9563', '2023-11-26 15:09:43', 27000, 'Chưa giao', 'Chưa thanh toán');

-- --------------------------------------------------------

--
-- Table structure for table `giaohang`
--

CREATE TABLE `giaohang` (
  `ma_DH` int(11) NOT NULL,
  `ma_Shipper` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `giaohang`
--

INSERT INTO `giaohang` (`ma_DH`, `ma_Shipper`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `giohang`
--

CREATE TABLE `giohang` (
  `ma_Customer` int(11) NOT NULL,
  `ma_CuonSach` int(11) NOT NULL,
  `soluong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `ma_Review` int(11) NOT NULL,
  `ma_Customer` int(11) DEFAULT NULL,
  `ngay_Review` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `binhluan` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`ma_Review`, `ma_Customer`, `ngay_Review`, `binhluan`) VALUES
(1, 3, '2023-12-11 17:00:00', 'Sách còn mới, như quảng cáo. Nói chung tốt, sẽ quay lại ủng hộ shop tiếp ạ'),
(2, 1, '2023-12-12 17:00:00', 'Giao hàng nhanh, hàng như mẫu');

-- --------------------------------------------------------

--
-- Table structure for table `shipper`
--

CREATE TABLE `shipper` (
  `ma_Shipper` int(11) NOT NULL,
  `taikhoan_Shipper` varchar(20) DEFAULT NULL,
  `matkhau_Shipper` varchar(20) DEFAULT NULL,
  `hoten_Shipper` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gmail_Shipper` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipper`
--

INSERT INTO `shipper` (`ma_Shipper`, `taikhoan_Shipper`, `matkhau_Shipper`, `hoten_Shipper`, `gmail_Shipper`) VALUES
(1, 'shipper', '123', 'Nguyễn Văn A', 'shipper@gmail.com'),
(2, 'shipper2', '222', 'Nguyễn Văn B', 'shipper2@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`ma_Admin`),
  ADD UNIQUE KEY `taikhoan_Admin` (`taikhoan_Admin`),
  ADD UNIQUE KEY `gmail_Admin` (`gmail_Admin`);

--
-- Indexes for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`ma_DH`,`ma_CuonSach`),
  ADD KEY `CTDH_maCS_FK` (`ma_CuonSach`);

--
-- Indexes for table `cuonsach`
--
ALTER TABLE `cuonsach`
  ADD PRIMARY KEY (`ma_CuonSach`),
  ADD KEY `CS_maDS_FK` (`ma_DauSach`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ma_Customer`),
  ADD UNIQUE KEY `taikhoan_Customer` (`taikhoan_Customer`),
  ADD UNIQUE KEY `gmail_Customer` (`gmail_Customer`),
  ADD UNIQUE KEY `sdt_Customer` (`sdt_Customer`);

--
-- Indexes for table `dausach`
--
ALTER TABLE `dausach`
  ADD PRIMARY KEY (`ma_DauSach`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`ma_DH`),
  ADD KEY `DH_maCustomer_FK` (`ma_Customer`);

--
-- Indexes for table `giaohang`
--
ALTER TABLE `giaohang`
  ADD PRIMARY KEY (`ma_DH`,`ma_Shipper`),
  ADD KEY `GIAOHANG_maShipper_FK` (`ma_Shipper`);

--
-- Indexes for table `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`ma_Customer`,`ma_CuonSach`),
  ADD KEY `GH_maCS_FK` (`ma_CuonSach`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ma_Review`),
  ADD KEY `RV_maCustomer_FK` (`ma_Customer`);

--
-- Indexes for table `shipper`
--
ALTER TABLE `shipper`
  ADD PRIMARY KEY (`ma_Shipper`),
  ADD UNIQUE KEY `taikhoan_Shipper` (`taikhoan_Shipper`),
  ADD UNIQUE KEY `gmail_Shipper` (`gmail_Shipper`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `ma_Admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cuonsach`
--
ALTER TABLE `cuonsach`
  MODIFY `ma_CuonSach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ma_Customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dausach`
--
ALTER TABLE `dausach`
  MODIFY `ma_DauSach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `ma_DH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `ma_Review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipper`
--
ALTER TABLE `shipper`
  MODIFY `ma_Shipper` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `CTDH_maCS_FK` FOREIGN KEY (`ma_CuonSach`) REFERENCES `cuonsach` (`ma_CuonSach`) ON DELETE CASCADE,
  ADD CONSTRAINT `CTDH_maDH_FK` FOREIGN KEY (`ma_DH`) REFERENCES `donhang` (`ma_DH`) ON DELETE CASCADE;

--
-- Constraints for table `cuonsach`
--
ALTER TABLE `cuonsach`
  ADD CONSTRAINT `CS_maDS_FK` FOREIGN KEY (`ma_DauSach`) REFERENCES `dausach` (`ma_DauSach`) ON DELETE CASCADE;

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `DH_maCustomer_FK` FOREIGN KEY (`ma_Customer`) REFERENCES `customer` (`ma_Customer`) ON DELETE CASCADE;

--
-- Constraints for table `giaohang`
--
ALTER TABLE `giaohang`
  ADD CONSTRAINT `GIAOHANG_maDH_FK` FOREIGN KEY (`ma_DH`) REFERENCES `donhang` (`ma_DH`) ON DELETE CASCADE,
  ADD CONSTRAINT `GIAOHANG_maShipper_FK` FOREIGN KEY (`ma_Shipper`) REFERENCES `shipper` (`ma_Shipper`) ON DELETE NO ACTION;

--
-- Constraints for table `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `GH_maCS_FK` FOREIGN KEY (`ma_CuonSach`) REFERENCES `cuonsach` (`ma_CuonSach`) ON DELETE NO ACTION,
  ADD CONSTRAINT `GH_maCUS_FK` FOREIGN KEY (`ma_Customer`) REFERENCES `customer` (`ma_Customer`) ON DELETE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `RV_maCustomer_FK` FOREIGN KEY (`ma_Customer`) REFERENCES `customer` (`ma_Customer`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
