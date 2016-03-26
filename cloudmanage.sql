-- phpMyAdmin SQL Dump
-- version 4.4.15.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 26, 2016 at 02:05 PM
-- Server version: 5.5.44-MariaDB
-- PHP Version: 5.6.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cloudmanage`
--

-- --------------------------------------------------------

--
-- Table structure for table `apicallstaskgroupsmap`
--

CREATE TABLE IF NOT EXISTS `apicallstaskgroupsmap` (
  `pkid` varchar(40) NOT NULL,
  `fkapitaskgroup` varchar(40) NOT NULL,
  `fkapitask` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apicallstaskgroupsmap`
--

INSERT INTO `apicallstaskgroupsmap` (`pkid`, `fkapitaskgroup`, `fkapitask`) VALUES
('279736a2-c931-11e5-9d09-02549f4e45a9', '3aa88658-c926-11e5-9d09-02549f4e45a9', '04cb57a9-c92b-11e5-9d09-02549f4e45a9'),
('62cdaddc-c931-11e5-9d09-02549f4e45a9', '3aa88658-c926-11e5-9d09-02549f4e45a9', '4a964175-c5de-11e5-9d09-02549f4e45a9'),
('64be3e3c-c931-11e5-9d09-02549f4e45a9', '3aa88658-c926-11e5-9d09-02549f4e45a9', '73487b66-c54a-11e5-9d09-02549f4e45a9'),
('668e6d2c-c931-11e5-9d09-02549f4e45a9', '3aa88658-c926-11e5-9d09-02549f4e45a9', 'c71510c0-c92d-11e5-9d09-02549f4e45a9');

--
-- Triggers `apicallstaskgroupsmap`
--
DELIMITER $$
CREATE TRIGGER `t_apicallstaskgroupsmap` BEFORE INSERT ON `apicallstaskgroupsmap`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `apicallstasksmap`
--

CREATE TABLE IF NOT EXISTS `apicallstasksmap` (
  `id` int(11) NOT NULL,
  `morder` int(11) NOT NULL,
  `fkapicall` varchar(40) NOT NULL,
  `fkapitask` varchar(40) NOT NULL,
  `parm1` varchar(200) NOT NULL,
  `parm2` varchar(200) NOT NULL,
  `parm3` varchar(200) NOT NULL,
  `retdata` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apicallstasksmap`
--

INSERT INTO `apicallstasksmap` (`id`, `morder`, `fkapicall`, `fkapitask`, `parm1`, `parm2`, `parm3`, `retdata`) VALUES
(1, 1, '936586fa-c3ed-11e5-9d09-02549f4e45a9', '70b3118f-c3ee-11e5-9d09-02549f4e45a9', 'SELECT pkid,Name FROM device WHERE Name LIKE ''SEP%''', '11.0', '', '*'),
(2, 2, '83fb0d11-c49e-11e5-9d09-02549f4e45a9', '0eac9c2c-c49f-11e5-9d09-02549f4e45a9', '%ret1%', '', '', '*'),
(3, 1, '37457a1d-c49e-11e5-9d09-02549f4e45a9', '0eac9c2c-c49f-11e5-9d09-02549f4e45a9', '', '', '', 'XML=aaaLogin;attributes,outCookie-)ret1'),
(4, 3, '3b906fff-c4f7-11e5-9d09-02549f4e45a9', '0eac9c2c-c49f-11e5-9d09-02549f4e45a9', '%ret1%', '', '', ''),
(5, 1, '54ce3fec-c534-11e5-9d09-02549f4e45a9', '38b95eac-c537-11e5-9d09-02549f4e45a9', '', '', '', 'COOKIE=APIC-cookie-)ret1'),
(6, 3, '7384b68d-c534-11e5-9d09-02549f4e45a9', '38b95eac-c537-11e5-9d09-02549f4e45a9', '%ret1%', '', '', ''),
(7, 2, '43d326b9-c545-11e5-9d09-02549f4e45a9', '38b95eac-c537-11e5-9d09-02549f4e45a9', '%ret1%', '', '', '*'),
(8, 1, '21f4eb6c-c54a-11e5-9d09-02549f4e45a9', '73487b66-c54a-11e5-9d09-02549f4e45a9', '', '', '', 'COOKIE=nxapi_auth-)ret1'),
(10, 1, '066063a5-c5de-11e5-9d09-02549f4e45a9', '4a964175-c5de-11e5-9d09-02549f4e45a9', '', '', '', 'COOKIE=vmware_soap_session-)ret1'),
(11, 2, 'ae8845c7-c5e3-11e5-9d09-02549f4e45a9', '4a964175-c5de-11e5-9d09-02549f4e45a9', '%ret1%', '', '', '*'),
(16, 9, '1abcce47-c7a0-11e5-9d09-02549f4e45a9', '66e54b13-c8ec-11e5-9d09-02549f4e45a9', 'p1', 'p2', '', 'ret'),
(18, 2, 'aa4e5008-c929-11e5-9d09-02549f4e45a9', '73487b66-c54a-11e5-9d09-02549f4e45a9', '%ret1%', '', '', '*'),
(22, 1, '54ce3fec-c534-11e5-9d09-02549f4e45a9', '04cb57a9-c92b-11e5-9d09-02549f4e45a9', '', '', '', 'COOKIE=APIC-cookie-)ret1'),
(23, 3, '7384b68d-c534-11e5-9d09-02549f4e45a9', '04cb57a9-c92b-11e5-9d09-02549f4e45a9', '%ret1%', '', '', ''),
(24, 2, '552a2d53-c92b-11e5-9d09-02549f4e45a9', '04cb57a9-c92b-11e5-9d09-02549f4e45a9', '%ret1%', '', '', '*'),
(25, 1, '37457a1d-c49e-11e5-9d09-02549f4e45a9', 'c71510c0-c92d-11e5-9d09-02549f4e45a9', '', '', '', 'XML=aaaLogin;attributes,outCookie-)ret1'),
(26, 2, 'a914a248-c92d-11e5-9d09-02549f4e45a9', 'c71510c0-c92d-11e5-9d09-02549f4e45a9', '%ret1%', '', '', '*'),
(27, 3, '3b906fff-c4f7-11e5-9d09-02549f4e45a9', 'c71510c0-c92d-11e5-9d09-02549f4e45a9', '%ret1%', '', '', ''),
(29, 1, '9411a1ef-cea7-11e5-9d09-02549f4e45a9', 'bb121242-cea7-11e5-9d09-02549f4e45a9', '', '', '', '*'),
(30, 1, 'bca86262-efc5-11e5-8dec-02549f4e45a9', 'c695492a-efdf-11e5-8dec-02549f4e45a9', '%q1%', '', '', ''),
(31, 2, 'df3b9af2-efc7-11e5-8dec-02549f4e45a9', 'c695492a-efdf-11e5-8dec-02549f4e45a9', '%q1%', '%q2%', '', ''),
(32, 3, '57fa241d-efc6-11e5-8dec-02549f4e45a9', 'c695492a-efdf-11e5-8dec-02549f4e45a9', '', '', '%q3%', ''),
(33, 4, 'ce3186bb-efc6-11e5-8dec-02549f4e45a9', 'c695492a-efdf-11e5-8dec-02549f4e45a9', '%q1%', '%q2%', '', '*'),
(34, 1, '2593bcbc-efc6-11e5-8dec-02549f4e45a9', 'b405ae49-f05c-11e5-8dec-02549f4e45a9', '%q1%', '', '', ''),
(35, 4, '339e601d-efc7-11e5-8dec-02549f4e45a9', 'b405ae49-f05c-11e5-8dec-02549f4e45a9', '%q1%', '%q2%', '', '*'),
(36, 3, 'a8d98e86-efc6-11e5-8dec-02549f4e45a9', 'b405ae49-f05c-11e5-8dec-02549f4e45a9', '', '', '%q3%', ''),
(37, 2, 'fa25eecd-efc7-11e5-8dec-02549f4e45a9', 'b405ae49-f05c-11e5-8dec-02549f4e45a9', '%q1%', '%q2%', '', ''),
(38, 2, '0ce3fee9-efc8-11e5-8dec-02549f4e45a9', '593bad3d-f05d-11e5-8dec-02549f4e45a9', '%q1%', '%q2%', '', ''),
(39, 1, 'fea6029c-efc5-11e5-8dec-02549f4e45a9', '593bad3d-f05d-11e5-8dec-02549f4e45a9', '%q1%', '', '', ''),
(40, 4, '171a3fff-efc7-11e5-8dec-02549f4e45a9', '593bad3d-f05d-11e5-8dec-02549f4e45a9', '%q1%', '%q2%', '', '*'),
(41, 3, '958e5dae-efc6-11e5-8dec-02549f4e45a9', '593bad3d-f05d-11e5-8dec-02549f4e45a9', '', '', '%q3%', ''),
(42, 1, '2bf1f110-f0bb-11e5-8dec-02549f4e45a9', 'ad4f62f4-f0bb-11e5-8dec-02549f4e45a9', '%q1%', '%q2%', '%q3%', ''),
(43, 2, '71de150e-f0bb-11e5-8dec-02549f4e45a9', 'ad4f62f4-f0bb-11e5-8dec-02549f4e45a9', '%q1%', '%q2%', '%q3%', '*'),
(44, 1, '7dbf7054-f1ff-11e5-8dec-02549f4e45a9', '93db7418-f1ff-11e5-8dec-02549f4e45a9', '', '', '', '*'),
(46, 1, '61bbc731-f1ff-11e5-8dec-02549f4e45a9', 'a36af30f-f200-11e5-8dec-02549f4e45a9', '', '', '', '*'),
(47, 1, '9b34a068-f203-11e5-8dec-02549f4e45a9', 'c524a6ff-f203-11e5-8dec-02549f4e45a9', '', '', '', '*'),
(48, 1, 'af5c01f7-f203-11e5-8dec-02549f4e45a9', 'd63b2e48-f203-11e5-8dec-02549f4e45a9', '', '', '', '*');

-- --------------------------------------------------------

--
-- Table structure for table `apifamilydeviceseriesmap`
--

CREATE TABLE IF NOT EXISTS `apifamilydeviceseriesmap` (
  `id` int(11) NOT NULL,
  `fkapifamily` varchar(40) NOT NULL,
  `fkdevicefamily` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apifamilydeviceseriesmap`
--

INSERT INTO `apifamilydeviceseriesmap` (`id`, `fkapifamily`, `fkdevicefamily`) VALUES
(1, '1545cd1f-da2d-11e5-8dec-02549f4e45a9', 155),
(2, '179d36da-da2d-11e5-8dec-02549f4e45a9', 162),
(3, '179d36da-da2d-11e5-8dec-02549f4e45a9', 163),
(4, '179d36da-da2d-11e5-8dec-02549f4e45a9', 165),
(5, '1dc58550-da2d-11e5-8dec-02549f4e45a9', 159),
(6, '266579d8-da2d-11e5-8dec-02549f4e45a9', 161),
(7, '30a871ca-da2d-11e5-8dec-02549f4e45a9', 4),
(8, '30a871ca-da2d-11e5-8dec-02549f4e45a9', 27),
(9, '30a871ca-da2d-11e5-8dec-02549f4e45a9', 28),
(10, '30a871ca-da2d-11e5-8dec-02549f4e45a9', 29),
(11, '30a871ca-da2d-11e5-8dec-02549f4e45a9', 30),
(12, '30a871ca-da2d-11e5-8dec-02549f4e45a9', 31),
(13, '3844915d-da2d-11e5-8dec-02549f4e45a9', 7),
(14, '3844915d-da2d-11e5-8dec-02549f4e45a9', 9),
(15, '3844915d-da2d-11e5-8dec-02549f4e45a9', 10),
(16, '3844915d-da2d-11e5-8dec-02549f4e45a9', 12),
(19, '3844915d-da2d-11e5-8dec-02549f4e45a9', 66),
(20, '3844915d-da2d-11e5-8dec-02549f4e45a9', 67),
(21, '3844915d-da2d-11e5-8dec-02549f4e45a9', 69),
(22, '3844915d-da2d-11e5-8dec-02549f4e45a9', 164),
(24, '3844915d-da2d-11e5-8dec-02549f4e45a9', 71),
(25, 'af8ca412-efc5-11e5-8dec-02549f4e45a9', 167);

-- --------------------------------------------------------

--
-- Table structure for table `api_calls`
--

CREATE TABLE IF NOT EXISTS `api_calls` (
  `pkid` varchar(40) NOT NULL,
  `description` varchar(50) NOT NULL,
  `method` varchar(10) NOT NULL,
  `url` varchar(125) NOT NULL,
  `content_type` varchar(20) NOT NULL,
  `soap_action` varchar(30) NOT NULL,
  `credentials` varchar(80) NOT NULL,
  `cookie` varchar(100) NOT NULL,
  `return_header` int(11) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `filekey` varchar(50) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `dtcreateduid` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_calls`
--

INSERT INTO `api_calls` (`pkid`, `description`, `method`, `url`, `content_type`, `soap_action`, `credentials`, `cookie`, `return_header`, `message`, `filekey`, `dtcreated`, `dtcreateduid`) VALUES
('066063a5-c5de-11e5-9d09-02549f4e45a9', 'vCenter Login', 'POST', 'https://%ip%/sdk', 'text/xml', '', '', '', 0, '<soap:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">\n  <soap:Body>\n    <Login xmlns="urn:internalvim25">\n      <_this xsi:type="SessionManager" type="SessionManager" serverGuid="">SessionManager</_this>\n      <userName>%un%</userName>\n      <password>%pw%</password>\n      <locale>en_US</locale>\n    </Login>\n  </soap:Body>\n</soap:Envelope>', '', '2016-01-01 00:00:00', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('0ce3fee9-efc8-11e5-8dec-02549f4e45a9', 'UCCX Delete File - Prompt', 'DELETE', 'http://%ip%/adminapi/prompt/en_US/%1%/%2%', 'application/xml', '', '%un%:%pw%', '', 0, '', '', '2016-03-21 19:50:19', 'df3b9af2-efc7-11e5-8dec-02549f4e45a9'),
('171a3fff-efc7-11e5-8dec-02549f4e45a9', 'UCCX Copy Temp to DB - Prompt', 'POST', 'http://%ip%/adminapi/prompt/', 'application/xml', '', '%un%:%pw%', '', 0, '<?xml version="1.0" encoding="UTF-8"?>\n<Files xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="Files.xsd">\n  <Prompt>\n    <File>\n      <path>/en_US/%1%</path>\n      <FileName>%2%</FileName>\n    </File>\n  </Prompt>\n</Files>', '', '2016-03-21 19:43:26', 'ce3186bb-efc6-11e5-8dec-02549f4e45a9'),
('1abcce47-c7a0-11e5-9d09-02549f4e45a9', 'Josh Test', '1', '2', '3', '4', '5', '6', 0, '7', '', '2016-01-30 16:23:36', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('21f4eb6c-c54a-11e5-9d09-02549f4e45a9', 'NXAPI Login', 'GET', 'http://%ip%', 'text/json', '', '%un%:%pw%', '', 0, '', '', '2016-01-01 00:00:00', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('2593bcbc-efc6-11e5-8dec-02549f4e45a9', 'UCCX Create Folder - Document', 'POST', 'http://%ip%/adminapi/document', 'application/xml', '', '%un%:%pw%', '', 0, '<?xml version="1.0" encoding="UTF-8"?>\n<Files xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="Files.xsd">\n  <Document>\n    <Folder>\n      <path>/en_US</path>\n      <FolderName>%1%</FolderName>\n    </Folder>\n  </Document>\n</Files>', '', '2016-03-21 19:36:41', 'fea6029c-efc5-11e5-8dec-02549f4e45a9'),
('2bf1f110-f0bb-11e5-8dec-02549f4e45a9', 'UCCX - Create Application', 'POST', 'http://%ip%/adminapi/application', 'application/xml', '', '%un%:%pw%', '', 0, '<?xml version="1.0" encoding="UTF-8"?>\n<application>\n    <ScriptApplication>\n        <script>SCRIPT[%1%/%2%]</script>\n        <scriptParams>\n            <name>DocFolder</name>\n            <value>&quot;%1%&quot;</value>\n            <type>java.lang.String</type>\n        </scriptParams>\n    </ScriptApplication>\n    <id>5000</id>\n    <applicationName>%1%</applicationName>\n    <type>Cisco Script Application</type>\n    <description>newtest</description>\n    <maxsession>10</maxsession>\n    <enabled>true</enabled>\n</application>', '', '2016-03-23 00:50:39', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('339e601d-efc7-11e5-8dec-02549f4e45a9', 'UCCX Copy Temp to DB - Document', 'POST', 'http://%ip%/adminapi/document/', 'application/xml', '', '%un%:%pw%', '', 0, '<?xml version="1.0" encoding="UTF-8"?>\n<Files xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="Files.xsd">\n  <Document>\n    <File>\n      <path>/en_US/%1%</path>\n      <FileName>%2%</FileName>\n    </File>\n  </Document>\n</Files>', '', '2016-03-21 19:44:14', '171a3fff-efc7-11e5-8dec-02549f4e45a9'),
('37457a1d-c49e-11e5-9d09-02549f4e45a9', 'UCS CIMC Login', 'POST', 'https://%ip%/nuova', 'text/xml', '', '', '', 0, '<aaaLogin\r\n    inName=\\"%un%\\"\r\n    inPassword=\\"%pw%\\">\r\n</aaaLogin>', '', '2016-01-01 00:00:00', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('3b906fff-c4f7-11e5-9d09-02549f4e45a9', 'UCS CIMC Logout', 'POST', 'https://%ip%/nuova', 'text/xml', '', '', '', 0, '<aaaLogout\r\n    cookie="%1%"\r\n    inCookie="%1%">\r\n</aaaLogout>', '', '2016-01-01 00:00:00', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('43d326b9-c545-11e5-9d09-02549f4e45a9', 'APIC Fabric Inventory', 'GET', 'https://%ip%/api/class/topSystem.json', 'text/json', '', '', '%1%', 0, '', '', '2016-01-01 00:00:00', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('54ce3fec-c534-11e5-9d09-02549f4e45a9', 'APIC Login', 'POST', 'https://%ip%/api/aaaLogin.json', 'text/json', '', '', '', 0, '{\n  "aaaUser":{\n    "attributes":{\n      "name":"%un%",\n      "pwd":"%pw%"\n    }\n  }\n}', '', '2016-01-01 00:00:00', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('552a2d53-c92b-11e5-9d09-02549f4e45a9', 'APIC Version', 'GET', 'http://%ip%/api/class/firmwareIfcFwStatusCont.json?query-target=subtree&target-subtree-class=firmwareIfcRunning', 'text/json', '', '', '%1%', 0, '', '', '2016-02-01 15:32:45', '43d326b9-c545-11e5-9d09-02549f4e45a9'),
('57fa241d-efc6-11e5-8dec-02549f4e45a9', 'UCCX Upload to Temp - Script', 'POST', 'http://%ip%/adminapi/script/uploadFile', 'multipart/form-data', '', '%un%:%pw%', '', 0, '', 'file-)%3%', '2016-03-21 19:38:06', 'bca86262-efc5-11e5-8dec-02549f4e45a9'),
('61bbc731-f1ff-11e5-8dec-02549f4e45a9', 'UCCX - Get CSQs', 'GET', 'http://%ip%/adminapi/csq', '', '', '%un%:%pw%', '', 0, '', '', '2016-03-24 15:31:26', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('6458f64a-c54a-11e5-9d09-02549f4e45a9', 'NXAPI "show switchname"', 'POST', 'http://%ip%/ins', 'application/json', '', '', '%1%', 0, '{\n    "ins_api": {\n        "version": "0.1",\n        "type": "cli_show",\n        "chunk": "0",\n        "sid": "session1",\n        "input": "show switchname",\n        "output_format": "json"\n    }\n}', '', '2016-01-01 00:00:00', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('71de150e-f0bb-11e5-8dec-02549f4e45a9', 'UCCX - Create Trigger', 'POST', 'http://%ip%/adminapi/trigger', 'application/xml', '', '%un%:%pw%', '', 0, '<?xml version="1.0" encoding="UTF-8"?>\n<trigger>\n    <directoryNumber>%3%</directoryNumber>\n    <locale>en_US</locale>\n    <application name="%1%">\n        <refURL>http://%ip%/adminapi/application/%1%</refURL>\n    </application>\n    <deviceName>UCCX_%3%</deviceName>\n    <description>UCCX_%3%</description>\n    <callControlGroup name="2">\n        <refURL>http://%ip%/adminapi/callControlGroup/2</refURL>\n    </callControlGroup>\n    <triggerEnabled>true</triggerEnabled>\n    <maxNumOfSessions>10</maxNumOfSessions>\n    <idleTimeout>5000</idleTimeout>\n    <overrideMediaTermination>\n        <dialogGroup name="0">\n            <refURL>http://%ip%/adminapi/dialogGroup/0</refURL>\n        </dialogGroup>\n    </overrideMediaTermination>\n    <alertingNameAscii></alertingNameAscii>\n    <devicePool>Default</devicePool>\n    <location>Hub_None</location>\n    <partition>None</partition>\n    <voiceMailProfile>None</voiceMailProfile>\n    <callingSearchSpace>None</callingSearchSpace>\n    <callingSearchSpaceForRedirect>default</callingSearchSpaceForRedirect>\n    <presenceGroup>Standard Presence group</presenceGroup>\n    <forwardBusy>\n        <forwardBusyVoiceMail>false</forwardBusyVoiceMail>\n        <forwardBusyDestination></forwardBusyDestination>\n        <forwardBusyCallingSearchSpace>None</forwardBusyCallingSearchSpace>\n    </forwardBusy>\n    <display></display>\n    <externalPhoneMaskNumber></externalPhoneMaskNumber>\n</trigger>', '', '2016-03-23 00:52:36', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('7384b68d-c534-11e5-9d09-02549f4e45a9', 'APIC Logout', 'POST', 'https://%ip%/api/aaaLogout.json', 'text/json', '', '', '%1%', 0, '{\n  "aaaUser":{\n    "attributes":{\n      "name":"%un%"\n    }\n  }\n}', '', '2016-01-01 00:00:00', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('7dbf7054-f1ff-11e5-8dec-02549f4e45a9', 'UCCX - Get Applications', 'GET', 'http://%ip%/adminapi/application', '', '', '%un%:%pw%', '', 0, '', '', '2016-03-24 15:32:13', '61bbc731-f1ff-11e5-8dec-02549f4e45a9'),
('83fb0d11-c49e-11e5-9d09-02549f4e45a9', 'UCS CIMC Get Logs', 'POST', 'https://%ip%/nuova', 'text/xml', '', '', '', 0, '<configResolveClass cookie=''%1%'' classId=''faultInst'' inHierarchical=''true''></configResolveClass>', '', '2016-01-01 00:00:00', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('936586fa-c3ed-11e5-9d09-02549f4e45a9', 'CUCM Get Phones', 'POST', 'https://%ip%:%port%/axl/', 'text/xml', 'CUCM:DB ver=11.0', '%un%:%pw%', '', 0, '<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">\n  <SOAP-ENV:Body>\n    <axlapi:executeSQLQuery sequence="1" xmlns:axlapi="http://www.cisco.com/AXL/API/%2%" xmlns:axl="http://www.cisco.com/AXL/API/%2%" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.cisco.com/AXL/API/%2% axlsoap.xsd">\n      <sql>%1%</sql>\n    </axlapi:executeSQLQuery>\n  </SOAP-ENV:Body>\n</SOAP-ENV:Envelope>', '', '2016-01-01 00:00:00', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('9411a1ef-cea7-11e5-9d09-02549f4e45a9', 'CCP Express - "show running-config"', 'GET', 'http://%ip%/level/15/exec/-/show/running-config/CR', '', '', '%un%:%pw%', '', 0, '', '', '2016-02-08 15:04:44', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('958e5dae-efc6-11e5-8dec-02549f4e45a9', 'UCCX Upload to Temp - Prompt', 'POST', 'http://%ip%/adminapi/prompt/uploadFile', 'multipart/form-data', '', '%un%:%pw%', '', 0, '', 'file-)%3%', '2016-03-21 19:39:49', '57fa241d-efc6-11e5-8dec-02549f4e45a9'),
('9b34a068-f203-11e5-8dec-02549f4e45a9', 'UCCX - Get Resources', 'GET', 'http://%ip%/adminapi/resource', '', '', '%un%:%pw%', '', 0, '', '', '2016-03-24 16:01:40', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('a8d98e86-efc6-11e5-8dec-02549f4e45a9', 'UCCX Upload to Temp - Document', 'POST', 'http://%ip%/adminapi/document/uploadFile', 'multipart/form-data', '', '%un%:%pw%', '', 0, '', 'file-)%3%', '2016-03-21 19:40:22', '958e5dae-efc6-11e5-8dec-02549f4e45a9'),
('a914a248-c92d-11e5-9d09-02549f4e45a9', 'UCS CIMC - show version', 'POST', 'https://%ip%/nuova', 'text/xml', '', '', '', 0, '<configResolveClass cookie="%1%" inHierarchical="false" classId="firmwareRunning"/>', '', '2016-02-01 15:49:25', '83fb0d11-c49e-11e5-9d09-02549f4e45a9'),
('aa4e5008-c929-11e5-9d09-02549f4e45a9', 'NXAPI "show version"', 'POST', 'http://%ip%/ins', 'application/json', '', '', '%1%', 0, '{\n    "ins_api": {\n        "version": "0.1",\n        "type": "cli_show",\n        "chunk": "0",\n        "sid": "session1",\n        "input": "show version",\n        "output_format": "json"\n    }\n}', '', '2016-02-01 15:20:49', '6458f64a-c54a-11e5-9d09-02549f4e45a9'),
('ae8845c7-c5e3-11e5-9d09-02549f4e45a9', 'vCenter - show version', 'POST', 'https://%ip%/sdk', 'text/xml', 'urn:internalvim25/4.1', '', '%1%', 0, '<soap:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">\n  <soap:Body>\n    <RetrievePropertiesEx xmlns="urn:internalvim25">\n      <_this type="PropertyCollector">propertyCollector</_this>\n        <specSet>\n          <propSet>\n            <type>ServiceInstance</type>\n            <all>false</all>\n            <pathSet>content</pathSet>\n          </propSet>\n          <objectSet>\n            <obj type="ServiceInstance">ServiceInstance</obj>\n            <selectSet xsi:type="TraversalSpec">\n              <name>folderTraversalSpec</name>\n              <type>Folder</type>\n              <path>childEntity</path>\n              <skip>false</skip>\n              <selectSet>\n                <name>folderTraversalSpec</name>\n              </selectSet>\n              <selectSet>\n                <name>datacenterHostTraversalSpec</name>\n              </selectSet>\n              <selectSet>\n                <name>datacenterVmTraversalSpec</name>\n              </selectSet>\n              <selectSet>\n                <name>datacenterDatastoreTraversalSpec</name>\n              </selectSet>\n              <selectSet>\n                <name>datacenterNetworkTraversalSpec</name>\n              </selectSet>\n              <selectSet>\n                <name>computeResourceRpTraversalSpec</name>\n              </selectSet>\n              <selectSet>\n                <name>computeResourceHostTraversalSpec</name>\n              </selectSet>\n              <selectSet>\n                <name>hostVmTraversalSpec</name>\n              </selectSet>\n              <selectSet>\n                <name>resourcePoolVmTraversalSpec</name>\n              </selectSet>\n            </selectSet>\n            <selectSet xsi:type="TraversalSpec">\n              <name>datacenterDatastoreTraversalSpec</name>\n              <type>Datacenter</type>\n              <path>datastoreFolder</path>\n              <skip>false</skip>\n              <selectSet>\n                <name>folderTraversalSpec</name>\n              </selectSet>\n            </selectSet>\n            <selectSet xsi:type="TraversalSpec">\n              <name>datacenterNetworkTraversalSpec</name>\n              <type>Datacenter</type>\n              <path>networkFolder</path>\n              <skip>false</skip>\n              <selectSet>\n                <name>folderTraversalSpec</name>\n              </selectSet>\n            </selectSet>\n            <selectSet xsi:type="TraversalSpec">\n              <name>datacenterVmTraversalSpec</name>\n              <type>Datacenter</type>\n              <path>vmFolder</path>\n              <skip>false</skip>\n              <selectSet>\n                <name>folderTraversalSpec</name>\n              </selectSet>\n            </selectSet>\n            <selectSet xsi:type="TraversalSpec">\n              <name>datacenterHostTraversalSpec</name>\n              <type>Datacenter</type>\n              <path>hostFolder</path>\n              <skip>false</skip>\n              <selectSet>\n                <name>folderTraversalSpec</name>\n              </selectSet>\n            </selectSet>\n            <selectSet xsi:type="TraversalSpec">\n              <name>computeResourceHostTraversalSpec</name>\n              <type>ComputeResource</type>\n              <path>host</path>\n              <skip>false</skip>\n            </selectSet>\n            <selectSet xsi:type="TraversalSpec">\n              <name>computeResourceRpTraversalSpec</name>\n              <type>ComputeResource</type>\n              <path>resourcePool</path>\n              <skip>false</skip>\n              <selectSet>\n                <name>resourcePoolTraversalSpec</name>\n              </selectSet>\n              <selectSet>\n                <name>resourcePoolVmTraversalSpec</name>\n              </selectSet>\n            </selectSet>\n            <selectSet xsi:type="TraversalSpec">\n              <name>resourcePoolTraversalSpec</name>\n              <type>ResourcePool</type>\n              <path>resourcePool</path>\n              <skip>false</skip>\n              <selectSet>\n                <name>resourcePoolTraversalSpec</name>\n              </selectSet>\n              <selectSet>\n                <name>resourcePoolVmTraversalSpec</name>\n              </selectSet>\n            </selectSet>\n            <selectSet xsi:type="TraversalSpec">\n              <name>hostVmTraversalSpec</name>\n              <type>HostSystem</type>\n              <path>vm</path>\n              <skip>false</skip>\n              <selectSet>\n                <name>folderTraversalSpec</name>\n              </selectSet>\n            </selectSet>\n            <selectSet xsi:type="TraversalSpec">\n              <name>resourcePoolVmTraversalSpec</name>\n              <type>ResourcePool</type>\n              <path>vm</path>\n              <skip>false</skip>\n            </selectSet>\n          </objectSet>\n        </specSet>\n        <options>\n        </options>\n    </RetrievePropertiesEx>\n  </soap:Body>\n</soap:Envelope>', '', '2016-01-01 00:00:00', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('af5c01f7-f203-11e5-8dec-02549f4e45a9', 'UCCX - Get Skills', 'GET', 'http://%ip%/adminapi/skill', '', '', '%un%:%pw%', '', 0, '', '', '2016-03-24 16:02:14', '9b34a068-f203-11e5-8dec-02549f4e45a9'),
('bca86262-efc5-11e5-8dec-02549f4e45a9', 'UCCX Create Folder - Script', 'POST', 'http://%ip%/adminapi/script', 'application/xml', '', '%un%:%pw%', '', 0, '<?xml version="1.0" encoding="UTF-8"?>\n<Files xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="Files.xsd">\n  <Script>\n    <Folder>\n      <path>/</path>\n      <FolderName>%1%</FolderName>\n    </Folder>\n  </Script>\n</Files>', '', '2016-03-21 19:33:45', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('ce3186bb-efc6-11e5-8dec-02549f4e45a9', 'UCCX Copy Temp to DB - Script', 'POST', 'http://%ip%/adminapi/script/', 'application/xml', '', '%un%:%pw%', '', 0, '<?xml version="1.0" encoding="UTF-8"?>\n<Files xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="Files.xsd">\n  <Script>\n    <File>\n      <path>/%1%</path>\n      <FileName>%2%</FileName>\n    </File>\n  </Script>\n</Files>', '', '2016-03-21 19:41:24', 'bca86262-efc5-11e5-8dec-02549f4e45a9'),
('df3b9af2-efc7-11e5-8dec-02549f4e45a9', 'UCCX Delete File - Script', 'DELETE', 'http://%ip%/adminapi/script/%1%/%2%', 'application/xml', '', '%un%:%pw%', '', 0, '', '', '2016-03-21 19:49:02', '2593bcbc-efc6-11e5-8dec-02549f4e45a9'),
('fa25eecd-efc7-11e5-8dec-02549f4e45a9', 'UCCX Delete File - Document', 'DELETE', 'http://%ip%/adminapi/document/en_US/%1%/%2%', 'application/xml', '', '%un%:%pw%', '', 0, '', '', '2016-03-21 19:49:47', 'df3b9af2-efc7-11e5-8dec-02549f4e45a9'),
('fea6029c-efc5-11e5-8dec-02549f4e45a9', 'UCCX Create Folder - Prompt', 'POST', 'http://%ip%/adminapi/prompt', 'application/xml', '', '%un%:%pw%', '', 0, '<?xml version="1.0" encoding="UTF-8"?>\n<Files xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="Files.xsd">\n  <Prompt>\n    <Folder>\n      <path>/en_US</path>\n      <FolderName>%1%</FolderName>\n    </Folder>\n  </Prompt>\n</Files>', '', '2016-03-21 19:35:36', 'bca86262-efc5-11e5-8dec-02549f4e45a9');

--
-- Triggers `api_calls`
--
DELIMITER $$
CREATE TRIGGER `t_api_calls` BEFORE INSERT ON `api_calls`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `api_family`
--

CREATE TABLE IF NOT EXISTS `api_family` (
  `pkid` varchar(40) NOT NULL,
  `description` varchar(50) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `dtcreateduid` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_family`
--

INSERT INTO `api_family` (`pkid`, `description`, `dtcreated`, `dtcreateduid`) VALUES
('1545cd1f-da2d-11e5-8dec-02549f4e45a9', 'APIC', '0000-00-00 00:00:00', ''),
('179d36da-da2d-11e5-8dec-02549f4e45a9', 'UCS', '0000-00-00 00:00:00', ''),
('1dc58550-da2d-11e5-8dec-02549f4e45a9', 'VMware', '0000-00-00 00:00:00', ''),
('266579d8-da2d-11e5-8dec-02549f4e45a9', 'CUCM', '0000-00-00 00:00:00', ''),
('30a871ca-da2d-11e5-8dec-02549f4e45a9', 'Nexus NXAPI', '0000-00-00 00:00:00', ''),
('3844915d-da2d-11e5-8dec-02549f4e45a9', 'CCP Express', '0000-00-00 00:00:00', ''),
('af8ca412-efc5-11e5-8dec-02549f4e45a9', 'UCCX', '2016-03-21 19:33:23', '2b67b036-b693-11e5-8b39-296fb12cc761');

--
-- Triggers `api_family`
--
DELIMITER $$
CREATE TRIGGER `t_api_family` BEFORE INSERT ON `api_family`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `api_taskgroups`
--

CREATE TABLE IF NOT EXISTS `api_taskgroups` (
  `pkid` varchar(40) NOT NULL,
  `description` varchar(50) NOT NULL,
  `dtcreated` datetime DEFAULT '0000-00-00 00:00:00',
  `dtcreateduid` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_taskgroups`
--

INSERT INTO `api_taskgroups` (`pkid`, `description`, `dtcreated`, `dtcreateduid`) VALUES
('3aa88658-c926-11e5-9d09-02549f4e45a9', 'show version', '0000-00-00 00:00:00', '');

--
-- Triggers `api_taskgroups`
--
DELIMITER $$
CREATE TRIGGER `t_api_taskgroups` BEFORE INSERT ON `api_taskgroups`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `api_tasks`
--

CREATE TABLE IF NOT EXISTS `api_tasks` (
  `pkid` varchar(40) NOT NULL,
  `fkfamily` varchar(40) NOT NULL,
  `description` varchar(60) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `dtcreateduid` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_tasks`
--

INSERT INTO `api_tasks` (`pkid`, `fkfamily`, `description`, `dtcreated`, `dtcreateduid`) VALUES
('04cb57a9-c92b-11e5-9d09-02549f4e45a9', '1545cd1f-da2d-11e5-8dec-02549f4e45a9', 'APIC - show version', '2016-02-01 15:30:30', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('0eac9c2c-c49f-11e5-9d09-02549f4e45a9', '179d36da-da2d-11e5-8dec-02549f4e45a9', 'UCS CIMC Discovery', '0000-00-00 00:00:00', ''),
('38b95eac-c537-11e5-9d09-02549f4e45a9', '1545cd1f-da2d-11e5-8dec-02549f4e45a9', 'APIC Discovery', '0000-00-00 00:00:00', ''),
('4a964175-c5de-11e5-9d09-02549f4e45a9', '1dc58550-da2d-11e5-8dec-02549f4e45a9', 'vCenter - show version', '0000-00-00 00:00:00', ''),
('593bad3d-f05d-11e5-8dec-02549f4e45a9', 'af8ca412-efc5-11e5-8dec-02549f4e45a9', 'UCCX - Upload Prompt (Force Overwrite)', '2016-03-22 13:39:02', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('70b3118f-c3ee-11e5-9d09-02549f4e45a9', '266579d8-da2d-11e5-8dec-02549f4e45a9', 'CUCM Phone Discovery', '0000-00-00 00:00:00', ''),
('73487b66-c54a-11e5-9d09-02549f4e45a9', '30a871ca-da2d-11e5-8dec-02549f4e45a9', 'NXAPI - show version', '0000-00-00 00:00:00', ''),
('93db7418-f1ff-11e5-8dec-02549f4e45a9', 'af8ca412-efc5-11e5-8dec-02549f4e45a9', 'UCCX - Application Discovery', '2016-03-24 15:32:50', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('a36af30f-f200-11e5-8dec-02549f4e45a9', 'af8ca412-efc5-11e5-8dec-02549f4e45a9', 'UCCX - CSQ Discovery', '2016-03-24 15:40:26', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('ad4f62f4-f0bb-11e5-8dec-02549f4e45a9', 'af8ca412-efc5-11e5-8dec-02549f4e45a9', 'UCCX - Create App + Trigger', '2016-03-23 00:54:16', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('b405ae49-f05c-11e5-8dec-02549f4e45a9', 'af8ca412-efc5-11e5-8dec-02549f4e45a9', 'UCCX - Upload Document (Force Overwrite)', '2016-03-22 13:34:25', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('bb121242-cea7-11e5-9d09-02549f4e45a9', '3844915d-da2d-11e5-8dec-02549f4e45a9', 'CCP Express - "show running-configuration"', '2016-02-08 15:05:49', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('c524a6ff-f203-11e5-8dec-02549f4e45a9', 'af8ca412-efc5-11e5-8dec-02549f4e45a9', 'UCCX - Resource Discovery', '2016-03-24 16:02:51', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('c695492a-efdf-11e5-8dec-02549f4e45a9', 'af8ca412-efc5-11e5-8dec-02549f4e45a9', 'UCCX - Upload Script (Force Overwrite)', '2016-03-21 22:40:09', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('c71510c0-c92d-11e5-9d09-02549f4e45a9', '179d36da-da2d-11e5-8dec-02549f4e45a9', 'UCS CIMC - show version', '2016-02-01 15:50:15', '2b67b036-b693-11e5-8b39-296fb12cc761'),
('d63b2e48-f203-11e5-8dec-02549f4e45a9', 'af8ca412-efc5-11e5-8dec-02549f4e45a9', 'UCCX - Skill Discovery', '2016-03-24 16:03:19', '2b67b036-b693-11e5-8b39-296fb12cc761');

--
-- Triggers `api_tasks`
--
DELIMITER $$
CREATE TRIGGER `t_api_tasks` BEFORE INSERT ON `api_tasks`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE IF NOT EXISTS `app` (
  `pkid` varchar(40) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app`
--

INSERT INTO `app` (`pkid`, `description`) VALUES
('8eb7eba9-ede9-11e5-8dec-02549f4e45a9', 'Easy CCX');

--
-- Triggers `app`
--
DELIMITER $$
CREATE TRIGGER `t_app` BEFORE INSERT ON `app`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `appblob`
--

CREATE TABLE IF NOT EXISTS `appblob` (
  `pkid` varchar(40) NOT NULL,
  `fkapp` varchar(40) NOT NULL,
  `fktenant` varchar(40) NOT NULL,
  `fkxref` varchar(40) NOT NULL,
  `b1` longblob NOT NULL,
  `vc1` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appblob`
--

INSERT INTO `appblob` (`pkid`, `fkapp`, `fktenant`, `fkxref`, `b1`, `vc1`) VALUES
('82f1b34a-efee-11e5-8dec-02549f4e45a9', '8eb7eba9-ede9-11e5-8dec-02549f4e45a9', 'ac1eeb4e-b766-11e5-8b39-296fb12cc761', '', 0xaced000573720024636f6d2e636973636f2e77666672616d65776f726b2e6f626a2e5746576f726b666c6f7773ed60aae1a667c403000b5a0008636f6d70696c65644a000b6e4c6173745573656449444c0005636163686574000f4c6a6176612f7574696c2f4d61703b4c0011636f6e74657874446566696e6974696f6e7400374c636f6d2f636973636f2f77666672616d65776f726b2f6f626a2f5746576f726b666c6f77436f6e74657874446566696e6974696f6e3b4c0018636f6e74657874446566696e6974696f6e507269766174657400374c636f6d2f636973636f2f77666672616d65776f726b2f6f626a2f5746576f726b666c6f774d6f6469666961626c65436f6e746578743b4c000866696c654e616d657400124c6a6176612f6c616e672f537472696e673b4c000b7374657049524374726c737400154c6a6176612f7574696c2f486173687461626c653b4c00097374657053746172747400224c636f6d2f636973636f2f77666672616d65776f726b2f6f626a2f5746537465703b4c000573746570737400214c636f6d2f636973636f2f7574696c2f446f75626c794c696e6b65644c6973743b4c00077374724e616d6571007e00044c000b73756d6d617279496e666f7400294c636f6d2f636973636f2f77666672616d65776f726b2f6f626a2f574653756d6d617279496e666f3b7870770800000000000000047372001f636f6d2e636973636f2e7574696c2e446f75626c794c696e6b65644c6973744fdb7f255aafa4d4030000787077040000008a73720024636f6d2e636973636f2e77666672616d65776f726b2e6f626a2e57464265616e53746570283b4438e36664100300044c00046265616e74001d4c636f6d2f636973636f2f77666170692f737465702f5746537465703b4c00116265616e496e666f436c6173734e616d6571007e00044c0007636f6d6d656e7471007e00044c00056c6162656c71007e000478720020636f6d2e636973636f2e77666672616d65776f726b2e6f626a2e574653746570c0dcf3d0a61c57df0300034a000269644c00086c6f636174696f6e7400264c636f6d2f636973636f2f77666672616d65776f726b2f6f626a2f57464c6f636174696f6e3b4c000e6f7574436f6e6e656374696f6e737400124c6a6176612f7574696c2f566563746f723b78707711000000000000000200000000000000000070707877080000000000000003740032636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657053746172744265616e496e666f7372002a636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570537461727423ce7896bf52c9450300007872002b636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e436f72654a4253746570c5cd66a31081848c03000078720024636f6d2e636973636f2e77666170692e737465702e6a62737465702e57464a425374657049e295046b4847310300024c0009636f6e7461696e657274001c4c636f6d2f636973636f2f77666170692f5746576f726b666c6f773b4c000c6f75747075744c6162656c7371007e001078707708000000000000000271007e0009737200106a6176612e7574696c2e566563746f72d9977d5b803baf010300034900116361706163697479496e6372656d656e7449000c656c656d656e74436f756e745b000b656c656d656e74446174617400135b4c6a6176612f6c616e672f4f626a6563743b78700000000000000001757200135b4c6a6176612e6c616e672e4f626a6563743b90ce589f1073296c02000078700000000a707070707070707070707878770800000000000000017877080000000000000001787070787371007e000c7711000000000000000200000000000000010070707877080000000000000003740030636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570456e644265616e496e666f73720028636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570456e64ee0b2aef707be64f0300007871007e00147708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001787070787371007e000c7711000000000000000200000000000000020070707877080000000000000003740029636f6d2e636973636f2e77662e73746570732e6976722e416363657074537465704265616e496e666f73720021636f6d2e636973636f2e77662e73746570732e6976722e416363657074537465704653cd91ba717e680300014c000e636f6e746163745661724e616d6571007e000478720022636f6d2e636973636f2e77662e73746570732e6976722e436f726549565253746570f1a4efa8cc6289610300007871007e00157708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a707070707070707070707878770400000001787704000000027400162d2d54726967676572696e6720436f6e746163742d2d787070787371007e000c7711000000000000000200000000000000060070707877080000000000000003740031636f6d2e636973636f2e77662e73746570732e6976722e47657453657373696f6e496e666f537465704265616e496e666f73720029636f6d2e636973636f2e77662e73746570732e6976722e47657453657373696f6e496e666f53746570a03c2437ddd3a9870300025b000d617474726962757465566172737400265b4c636f6d2f636973636f2f65787072657373696f6e2f5465787445787072657373696f6e3b4c000e636f6e746163745661724e616d6571007e00047871007e00267708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a707070707070707070707878770400000001787704000000077400162d2d54726967676572696e6720436f6e746163742d2d757200265b4c636f6d2e636973636f2e65787072657373696f6e2e5465787445787072657373696f6e3b3bad62101a31344702000078700000000673720023636f6d2e636973636f2e65787072657373696f6e2e5465787445787072657373696f6e0c430520afb7b0fb0300014c00047465787471007e00047872001f636f6d2e636973636f2e65787072657373696f6e2e45787072657373696f6e0c43b2c01162a97b0300075a0008636f6e7374616e7449000573746174654c0004696e666f71007e00044c000870617373776f726471007e00044c0006726573756c747400124c6a6176612f6c616e672f4f626a6563743b4c000a73656c656374696f6e737400154c6a6176612f7574696c2f41727261794c6973743b4c00077665746f6572737400164c6a6176612f7574696c2f4c696e6b65644c6973743b7870770800000006000000037070737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078737200146a6176612e7574696c2e4c696e6b65644c6973740c29535d4a6088220300007870770400000000787701007078770400000001740000787371007e00357708000000060000000173720028636f6d2e636973636f2e65787072657373696f6e2e696d706c2e4964656e746966696572496d706c018ab4dcbec1ee3b0300025a0007697346696e616c4c00036b657971007e000478720022636f6d2e636973636f2e65787072657373696f6e2e696d706c2e4e6f6465496d706c0ab80eebdf453cd3030004490003636f6c4900046c696e654c0004696e666f74002a4c636f6d2f636973636f2f65787072657373696f6e2f696d706c2f45787072657373696f6e496e666f3b4c0004747970657400114c6a6176612f6c616e672f436c6173733b7870770400000002767200106a6176612e6c616e672e537472696e67a0f0a4387a3bb34202000078707708000000010000000173720028636f6d2e636973636f2e65787072657373696f6e2e696d706c2e45787072657373696f6e496e666f0dc73fbcdbd93be80300024c0004636f646571007e00045b0004686173687400025b4278707704000000017070787877040000000174000c43616c6c65644e756d62657277010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000c43616c6c65644e756d626572787371007e00357708000000060000000370707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000171007e003f787371007e00357708000000060000000370707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000171007e003f787371007e00357708000000060000000370707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000171007e003f787371007e00357708000000060000000370707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000171007e003f787874000070787371007e000c7711000000000000000200000000000000080070707877080000000000000003740032636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e537465704c6162656c4265616e496e666f7372002a636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e537465704c6162656c3917fbb24266d9410300014c00087468654c6162656c71007e00047871007e00147708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c77110000000000000002000000000000000a0070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f73720028636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465702dcd0b2c6fa65bb00300034c0016584d4c44657374696e6174696f6e5661726961626c657400254c636f6d2f636973636f2f65787072657373696f6e2f5465787445787072657373696f6e3b4c000f584d4c446f63756d656e744e616d6571007e00044c0013584d4c446f63756d656e74506174684578707271007e006778720020636f6d2e636973636f2e77662e73746570732e696f2e436f7265496f53746570eb82024a5b57472f0300007871007e00157708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000037400152f656173796363782f696e7075746e756d62657273707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740017222f656173796363782f696e7075746e756d6265727322787371007e0035770800000006000000017371007e0041770400000002767200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870770800000001000000017371007e00487704000000017070787877040000000174000a496e707574436f756e7477010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000a496e707574436f756e74787874000070787371007e000c77110000000000000002000000000000000c0070707877080000000000000003740032636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e537465704c6162656c4265616e496e666f7371007e005e7708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740009496e7075744c6f6f707874000070787371007e000c77110000000000000002000000000000000f0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7372002b636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e100d1b1079426bb60300024c000a65787072657373696f6e71007e00674c00087661726961626c6571007e00677871007e00147708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0076770800000001000000017371007e00487704000000017070787877040000000174000c496e707574436f756e74657277010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000c496e707574436f756e746572787371007e00357708000000060000000173720021636f6d2e636973636f2e65787072657373696f6e2e456e636f64696e674e6f646504ae6d715653d83e0300034c0004696e666f71007e00044c00046e6f646574001b4c636f6d2f636973636f2f65787072657373696f6e2f4e6f64653b4c00047479706571007e004478707704000000017372001e636f6d2e636973636f2e65787072657373696f6e2e696d706c2e506c75730a4c1d1197570a4d0300014c0006646f5479706571007e004478720024636f6d2e636973636f2e65787072657373696f6e2e696d706c2e4e756d6265724e6f64650a28fbe24a1bf5bd03000149000674797065496478720024636f6d2e636973636f2e65787072657373696f6e2e696d706c2e42696e6172794e6f6465093fcae7c4f36e140300024c00036c687371007e00374c000372687371007e00377871007e004277040000000271007e00767708000000010000000e7371007e0048770400000001707078787704000000017371007e004177040000000271007e00767708000000010000000171007e00997877040000000174000c496e707574436f756e746572770100787371007e00740000000178770800000001000000037877040000000371007e00477871007e00767078707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740010496e707574436f756e746572202b2031787874000070787371007e000c771100000000000000020000000000000014007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f73720027636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049663ab81cba3f7498530300014c000a65787072657373696f6e71007e00677871007e00147708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017372001c636f6d2e636973636f2e65787072657373696f6e2e696d706c2e45710dc764f94269d44c03000078720025636f6d2e636973636f2e65787072657373696f6e2e696d706c2e426f6f6c65616e4e6f6465073ffed674538a290300014c00056e7479706571007e00447871007e0097770400000002767200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c756578707708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e00af7877040000000174000a496e70757456616c7565770100787371007e004177040000000271007e00477708000000010000000f71007e00af7877040000000174000c43616c6c65644e756d626572770100787877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174001a496e70757456616c7565203d3d2043616c6c65644e756d626572787874000070787371007e000c7711000000000000000200000000000000170070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f73720029636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f254eeea11d24b5d00300014c0009676f746f4c6162656c71007e00047871007e00147708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740009496e7075744c6f6f707874000070787371007e000c77110000000000000002000000000000001a0070707877080000000000000003740032636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e537465704c6162656c4265616e496e666f7371007e005e7708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740009536372697074456e647874000070787371007e000c77110000000000000002000000000000001b007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017372001c636f6d2e636973636f2e65787072657373696f6e2e696d706c2e4774076a0e3e521f33170300007871007e00ab77040000000271007e00ae7708000000010000000e7371007e0048770400000001707078787704000000017371007e004177040000000271007e00767708000000010000000171007e00d17877040000000174000c496e707574436f756e746572770100787371007e004177040000000271007e00767708000000010000001071007e00d17877040000000174000a496e707574436f756e74770100787877040000000171007e00767877040000000178707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740019496e707574436f756e746572203e20496e707574436f756e74787874000070787371007e000c77110000000000000002000000000000001d0070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740009536372697074456e647874000070787371007e000c77110000000000000002000000000000001e0070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e0047770800000001000000287371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000001971007e00e9787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00767708000000010000001b71007e00e97877040000000174000c496e707574436f756e7465727701007878770800000001ffffffff7877040000000371007e00477874001d275d2f6f7574707574735b6e756d6265723d2730275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740048222f656173796363782f696e7075745b6e616d653d2722202b20496e707574436f756e746572202b2022275d2f6f7574707574735b6e756d6265723d2730275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000000200070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000000220070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e0047770800000001000000277371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000001971007e0109787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e01097877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740007275d2f7479706578770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740031222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f7479706522787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e004877040000000170707878770400000001740009496e7075745479706577010078707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740009496e70757454797065787874000070787371007e000c77110000000000000002000000000000006f0070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e0047770800000001000000287371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000001971007e0122787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00767708000000010000001b71007e01227877040000000174000c496e707574436f756e7465727701007878770800000001ffffffff7877040000000371007e004778740009275d2f6e756d62657278770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740034222f656173796363782f696e7075745b6e616d653d2722202b20496e707574436f756e746572202b2022275d2f6e756d62657222787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000a496e70757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000a496e70757456616c7565787874000070787371007e000c771100000000000000020000000000000076007070787708000000000000000374002e636f6d2e636973636f2e77662e73746570732e696f2e437265617465584d4c446f63537465704265616e496e666f73720026636f6d2e636973636f2e77662e73746570732e696f2e437265617465584d4c446f63537465707894f0cbd4d51dd00300034c0011584d4c526573756c745661726961626c6571007e00674c000d584d4c536f757263654578707271007e00674c000f786d6c536f7572636549644578707271007e00677871007e00687708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000047371007e00357708000000060000000173720026636f6d2e636973636f2e65787072657373696f6e2e696d706c2e4e616d65446f63756d656e740935d13603af21760300024c0004617267737400234c636f6d2f636973636f2f65787072657373696f6e2f696d706c2f4172674c6973743b4c0005636c617a7a71007e00447871007e004277040000000276720016636f6d2e636973636f2e646f632e446f63756d656e7400000000000000000000007870770800000001000000017371007e00487704000000017070787877040000000173720021636f6d2e636973636f2e65787072657373696f6e2e696d706c2e4172674c697374033961722b9e01bd0300034c0004636f6c737400104c6a6176612f7574696c2f4c6973743b4c0004696e666f71007e00434c00056c696e657371007e01417871007e003d7704000000017371007e004177040000000271007e00477708000000010000000571007e013f78770400000001740011584d4c446f63756d656e74537472696e6777010078787704000000027371007e003b000000017704000000057371007e007400000001787371007e003b000000017704000000057371007e0074000000057871007e013f787672001a636f6d2e636973636f2e646f632e55736572446f63756d656e7489b3528912f77a870300007872001a636f6d2e636973636f2e646f632e4e616d65446f63756d656e7402abbeb74cec51670300024c000b636f6e74656e745479706571007e00045b00076c6f63616c65737400135b4c6a6176612f7574696c2f4c6f63616c653b78720029636f6d2e636973636f2e646f632e41627374726163744c6f63616c697a61626c65446f63756d656e740c53d086a45339430300014c00066c6f63616c657400124c6a6176612f7574696c2f4c6f63616c653b787078707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740016444f435b584d4c446f63756d656e74537472696e675d787371007e0035770800000006000000017371007e004177040000000271007e013e770800000001000000017371007e00487704000000017070787877040000000174000b584d4c446f63756d656e7477010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b584d4c446f63756d656e74787371007e00357708000000060000000370707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740000787874000070787371007e000c7711000000000000000200000000000000770070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e004877040000000170707878770400000001740011584d4c446f63756d656e74537472696e6777010078707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740011584d4c446f63756d656e74537472696e67787371007e0035770800000006000000017371007e00927704000000017371007e009577040000000271007e0047770800000001000000117371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000000571007e016d787704000000017400012f7371007e004177040000000271007e00477708000000010000000771007e016d78770400000001740009446f63466f6c6465727701007878770800000001ffffffff7877040000000371007e00477874000c2f456173794343582e786d6c78770800000001ffffffff7877040000000371007e00477871007e00477078707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740020222f22202b20446f63466f6c646572202b20222f456173794343582e786d6c22787874000070787371007e000c7711000000000000000200000000000001070070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e537465705377697463684265616e496e666f7372002b636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570537769746368427ae3c8e045647f0300045b000a636f6e646974696f6e7371007e002e4c000a65787072657373696f6e71007e00675b00066c6162656c7371007e002e4c0008746f5377697463687400134c6a6176612f6c616e672f496e74656765723b7871007e00147708000000000000000271007e00097371007e001800000000000000067571007e001b0000000a7400046d656e7574000670726f6d70747400087472616e736665727400076578746469616c74000361636474000744656661756c747070707078787708000000000000000178770800000000000000057371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e004877040000000170707878770400000001740009496e7075745479706577010078707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740009496e70757454797065787571007e0033000000057371007e0035770800000006000000037400046d656e75707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740006226d656e7522787371007e00357708000000060000000374000670726f6d7074707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400082270726f6d707422787371007e0035770800000006000000037400087472616e73666572707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000a227472616e7366657222787371007e0035770800000006000000037400076578746469616c707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740009226578746469616c22787371007e003577080000000600000003740003616364707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400052261636422787571007e0033000000057371007e00357708000000060000000371007e017e707371007e003b00000000770400000000787371007e003d77040000000173720031636f6d2e636973636f2e65787072657373696f6e2e537472696e674c656e67746845787072657373696f6e5665746f6572dfc18aa97901c1600300024900036d61784900036d696e7870770c00000001000000017fffffff7878770100707877040000000171007e017e787371007e00357708000000060000000371007e017f707371007e003b00000000770400000000787371007e003d77040000000171007e01aa78770100707877040000000171007e017f787371007e00357708000000060000000371007e0180707371007e003b00000000770400000000787371007e003d77040000000171007e01aa78770100707877040000000171007e0180787371007e00357708000000060000000371007e0181707371007e003b00000000770400000000787371007e003d7704000000017371007e01a9770c00000001000000017fffffff7878770100707877040000000171007e0181787371007e00357708000000060000000371007e0182707371007e003b00000000770400000000787371007e003d7704000000017371007e01a9770c00000001000000017fffffff7878770100707877040000000171007e0182787371007e0074000000007874000070787371007e000c7711000000000000000200000000000001080070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e0047770800000001000000277371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000001971007e01c3787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e01c37877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740009275d2f70726f6d707478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740033222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f70726f6d707422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b496e70757450726f6d707477010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b496e70757450726f6d7074787874000070787371007e000c7711000000000000000200000000000001540070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e0047770800000001000000277371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000001971007e01dc787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e01dc7877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740009275d2f70726f6d707478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740033222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f70726f6d707422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b496e70757450726f6d707477010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b496e70757450726f6d7074787874000070787371007e000c7711000000000000000200000000000001550070707877080000000000000003740029636f6d2e636973636f2e77662e73746570732e6976722e4f7574707574537465704265616e496e666f73720021636f6d2e636973636f2e77662e73746570732e6976722e4f757470757453746570b7326c1c819942130300065a00076261726765496e5a0016636f6e74696e75654f6e50726f6d70744572726f72735a0010666c757368496e7075744275666665725a000d696e7465727275707469626c654c000e636f6e746163745661724e616d6571007e00044c000e70726f6d707444544d464578707271007e00677871007e00267708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a707070707070707070707878770400000001787704000000057400162d2d54726967676572696e6720436f6e746163742d2d7371007e0035770800000006000000017371007e009277040000000173720024636f6d2e636973636f2e65787072657373696f6e2e696d706c2e4e616d6550726f6d70740713154099e8e1760300024c00046172677371007e013b4c0005636c617a7a71007e00447871007e004277040000000276720019636f6d2e636973636f2e70726f6d70742e506c617961626c659a6443f9e113d83b0200007870770800000001000000017371007e0048770400000001707078787704000000017371007e01407704000000017371007e004177040000000271007e00477708000000010000000371007e01fa7877040000000174000b496e70757450726f6d707477010078787704000000027371007e003b0000000177040000000571007e0146787371007e003b000000017704000000057371007e0074000000037871007e01fa787672001b636f6d2e636973636f2e70726f6d70742e5573657250726f6d7074dcf81557824a1e050300007872001b636f6d2e636973636f2e70726f6d70742e4e616d6550726f6d70740aff5f896801d8c70300044c00046172677371007e01415b00076c6f63616c657371007e014b4c00046e616d6571007e00044c000d7472616e736372697074696f6e71007e000478720017636f6d2e636973636f2e70726f6d70742e50726f6d707460c5a443c650ed4a0300014c00066c6f63616c6571007e014d78707871007e01f97078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000e505b496e70757450726f6d70745d787704010101017874000070787371007e000c7711000000000000000200000000000001560070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e0047770800000001000000277371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000001971007e0211787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e02117877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e00477874001d275d2f6f7574707574735b6e756d6265723d2730275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740047222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2730275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c771100000000000000020000000000000157007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e022b7877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c7711000000000000000200000000000001580070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001590070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c77110000000000000002000000000000015a0070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e0047770800000001000000277371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000001971007e0256787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e02567877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740009275d2f6e756d62657278770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740033222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6e756d62657222787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b496e7075744e756d62657277010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b496e7075744e756d626572787874000070787371007e000c77110000000000000002000000000000015b007070787708000000000000000374002b636f6d2e636973636f2e77662e73746570732e6976722e5265646972656374537465704265616e496e666f73720023636f6d2e636973636f2e77662e73746570732e6976722e5265646972656374537465707a1fdebe776055f70300045a001372657365744f72696743616c6c6564416464724c000e636f6e746163745661724e616d6571007e00044c0009657874656e73696f6e71007e00674c00126f72696743616c6c6564416464724578707271007e00677871007e00267708000000000000000271007e00097371007e001800000000000000047571007e001b0000000a74000a5375636365737366756c74000442757379740007496e76616c696474000c556e7375636365737366756c7070707070707878770400000001787704000000057400162d2d54726967676572696e6720436f6e746163742d2d7371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b496e7075744e756d62657277010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b496e7075744e756d626572787701017371007e0035770800000006000000037372001e636f6d2e636973636f2e65787072657373696f6e2e53656c656374696f6e0c43b2c01162a97b0300014c000973656c656374696f6e71007e0004787077040000000374000b44657374696e6174696f6e78707371007e003b0000000177040000000174000b44657374696e6174696f6e787371007e003d7704000000007877010070787704000000017400112d2d2044657374696e6174696f6e202d2d787874000070787371007e000c77110000000000000002000000000000015c0070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740009536372697074456e647874000070787371007e000c77110000000000000002000000000000015d0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c77110000000000000002000000000000015e0070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c77110000000000000002000000000000015f0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001600070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001610070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001620070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001630070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e0047770800000001000000277371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000001971007e02e5787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e02e57877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740009275d2f70726f6d707478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740033222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f70726f6d707422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b496e70757450726f6d707477010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b496e70757450726f6d7074787874000070787371007e000c771100000000000000020000000000000164007070787708000000000000000374002d636f6d2e636973636f2e77662e73746570732e6976722e5061727365496e707574537465704265616e496e666f73720025636f6d2e636973636f2e77662e73746570732e6976722e5061727365496e707574537465708aee071d5e4d417b03000f5a00076261726765496e5a000b636c6561726275666665725a0016636f6e74696e75654f6e50726f6d70744572726f72735a0010666c757368496e7075744275666665725a000d696e7465727275707469626c654c000963616e63656c4b65797400154c6a6176612f6c616e672f4368617261637465723b4c000e636f6e746163745661724e616d6571007e00044c000666696c74657271007e00044c000f696e697454696d656f75744578707271007e00674c000f696e7075744c656e6774684578707271007e00674c000d696e7075745661726961626c6571007e00674c0015696e746572646967697454696d656f75744578707271007e00674c00116d61784e756d526574726965734578707271007e00674c000a70726f6d70744578707271007e00674c00077465726d4b657971007e02f97871007e00267708000000000000000271007e00097371007e001800000000000000037571007e001b0000000a74000a5375636365737366756c74000754696d656f757474000c556e7375636365737366756c707070707070707878770400000001787704000000097400162d2d54726967676572696e6720436f6e746163742d2d7371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000c4469616c656444696769747377010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000c4469616c6564446967697473787371007e0035770800000006000000037371007e007400000004707371007e003b00000000770400000000787371007e003d7704000000017372002c636f6d2e636973636f2e65787072657373696f6e2e496e746567657245787072657373696f6e5665746f6572b9e445acf3d719520300034900036d61784900036d696e5a00067374726963747870770d00000002000000017fffffff00787877010070787704000000017400013478737200136a6176612e6c616e672e436861726163746572348b47d96b1a267802000143000576616c7565787000237371007e030f002a7371007e0035770800000006000000037371007e007400000003707371007e003b00000000770400000000787371007e003d7704000000017371007e030c770d000000020000000000000005007878770100707877040000000174000133787371007e0035770800000006000000037371007e007400000005707371007e003b00000000770400000000787371007e003d7704000000017371007e030c770d000000020000000000000008007878770100707877040000000174000135787371007e0035770800000006000000037371007e007400000003707371007e003b00000000770400000000787371007e003d77040000000171007e031c78770100707877040000000171007e031778770500010101017371007e0035770800000006000000017371007e00927704000000017371007e01f677040000000271007e01f9770800000001000000017371007e0048770400000001707078787704000000017371007e01407704000000017371007e004177040000000271007e00477708000000010000000371007e03257877040000000174000b496e70757450726f6d707477010078787704000000027371007e003b0000000177040000000571007e0146787371007e003b0000000177040000000571007e02007871007e03257871007e02047871007e01f97078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000e505b496e70757450726f6d70745d7874000a303132333435363738397874000070787371007e000c771100000000000000020000000000000165007070787708000000000000000374002b636f6d2e636973636f2e77662e73746570732e6976722e5265646972656374537465704265616e496e666f7371007e02697708000000000000000271007e00097371007e001800000000000000047571007e001b0000000a74000a5375636365737366756c74000442757379740007496e76616c696474000c556e7375636365737366756c7070707070707878770400000001787704000000057400162d2d54726967676572696e6720436f6e746163742d2d7371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000c4469616c656444696769747377010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000c4469616c6564446967697473787701017371007e0035770800000006000000037371007e027a77040000000374000b44657374696e6174696f6e78707371007e003b0000000177040000000174000b44657374696e6174696f6e787371007e003d7704000000007877010070787704000000017400112d2d2044657374696e6174696f6e202d2d787874000070787371007e000c7711000000000000000200000000000001660070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740009536372697074456e647874000070787371007e000c7711000000000000000200000000000001670070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001680070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001690070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c77110000000000000002000000000000016a0070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c77110000000000000002000000000000016b0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c77110000000000000002000000000000016c0070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c77110000000000000002000000000000016d0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c77110000000000000002000000000000016e0070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c77110000000000000002000000000000016f0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001700070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001710070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740009536372697074456e647874000070787371007e000c7711000000000000000200000000000001730070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e0047770800000001000000277371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000001971007e03eb787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e03eb7877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740008275d2f717565756578770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740032222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f717565756522787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e004877040000000170707878770400000001740008496e70757443535177010078707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740008496e707574435351787874000070787371007e000c7711000000000000000200000000000001750070707877080000000000000003740031636f6d2e636973636f2e77662e73746570732e6961712e53656c6563745265736f75726365537465704265616e496e666f73720029636f6d2e636973636f2e77662e73746570732e6961712e53656c6563745265736f7572636553746570687c75af8e8064fc0300075a0009746f436f6e6e6563745a0007746f51756575654c000e636f6e746163745661724e616d6571007e00044c000b71756575696e674578707271007e00674c000c72696e6754696d654578707271007e00674c000e726f7574696e675479706553747271007e00044c00147273726353656c65637465645661726961626c6571007e006778720022636f6d2e636973636f2e77662e73746570732e6961712e436f726549415153746570c5cd66a31081848c0300007871007e00157708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a74000853656c6563746564740006517565756564707070707070707078787708000000000000000178770800000000000000077400162d2d54726967676572696e6720436f6e746163742d2d7371007e0035770800000006000000017371007e004177040000000276720013636f6d2e636973636f2e757365722e5573657243494af4a78474a20300024c0002696471007e00044c00047479706571007e00047870770800000001000000017371007e00487704000000017070787877040000000174000b4353515265736f7572636577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4353515265736f7572636578770201007371007e0035770800000006000000037371007e00740000000a707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400023130787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e004877040000000170707878770400000001740008496e70757443535177010078707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740008496e70757443535178740015436f6e7461637420536572766963652051756575657874000070787371007e000c7711000000000000000200000000000001770070707877080000000000000003740029636f6d2e636973636f2e77662e73746570732e6976722e4f7574707574537465704265616e496e666f7371007e01ef7708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a707070707070707070707878770400000001787704000000057400162d2d54726967676572696e6720436f6e746163742d2d7371007e0035770800000006000000017371007e00927704000000017371007e01f677040000000271007e01f9770800000001000000017371007e0048770400000001707078787704000000017371007e014077040000000174000c49434451756575652e776176787704000000027371007e003b0000000177040000000571007e0146787371007e003b0000000177040000000571007e01467871007e04267871007e02047871007e01f97078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f505b49434451756575652e7761765d787704010101017874000070787371007e000c7711000000000000000200000000000001780070707877080000000000000003740027636f6d2e636973636f2e77662e73746570732e6976722e486f6c64537465704265616e496e666f7372001f636f6d2e636973636f2e77662e73746570732e6976722e486f6c6453746570b219bba53152f92d0300014c000e636f6e746163745661724e616d6571007e00047871007e00267708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a707070707070707070707878770400000001787704000000017400162d2d54726967676572696e6720436f6e746163742d2d787070787371007e000c77110000000000000002000000000000017a0070707877080000000000000003740032636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657044656c61794265616e496e666f7372002a636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657044656c6179e343e8fab9ba0f7a0300025a000d696e7465727275707469626c654c000f64656c617945787072657373696f6e71007e00677871007e00147708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000037371007e00740000000f707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400023135787701017874000070787371007e000c77110000000000000002000000000000017b0070707877080000000000000003740029636f6d2e636973636f2e77662e73746570732e6976722e556e686f6c64537465704265616e496e666f73720021636f6d2e636973636f2e77662e73746570732e6976722e556e686f6c64537465705a5b7fee9e7381ee0300014c000e636f6e746163745661724e616d6571007e00047871007e00267708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a707070707070707070707878770400000001787704000000017400162d2d54726967676572696e6720436f6e746163742d2d787070787371007e000c77110000000000000002000000000000017e0070707877080000000000000003740032636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e537465704c6162656c4265616e496e666f7371007e005e7708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000174000951756575654c6f6f707874000070787371007e000c7711000000000000000200000000000001800070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000174000951756575654c6f6f707874000070787371007e000c771100000000000000020000000000000182007070787708000000000000000374002a636f6d2e636973636f2e77662e73746570732e6961712e436f6e6e656374537465704265616e496e666f73720022636f6d2e636973636f2e77662e73746570732e6961712e436f6e6e65637453746570506cc68a6a2c1afe0300045a000872696e67437269744c000e636f6e746163745661724e616d6571007e00044c000c72696e6754696d654578707271007e00674c00077273726356617271007e00047871007e03ff7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a740009436f6e6e65637465647400064661696c6564707070707070707078787708000000000000000178770800000000000000047400162d2d54726967676572696e6720436f6e746163742d2d74000b4353515265736f757263657701007371007e0035770800000006000000037371007e00740000000a707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400023130787874000070787371007e000c7711000000000000000200000000000001840070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740009536372697074456e647874000070787371007e000c7711000000000000000200000000000001850070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001860070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001870070707877080000000000000003740027636f6d2e636973636f2e77662e73746570732e6976722e4d656e75537465704265616e496e666f7372001f636f6d2e636973636f2e77662e73746570732e6976722e4d656e75537465709c52a4775467274303000b5a00076261726765496e5a0016636f6e74696e75654f6e50726f6d70744572726f72735a0010666c757368496e7075744275666665725a000d696e7465727275707469626c654c000d636f6e6e656374696f6e4d617071007e00015b000b636f6e6e656374696f6e7371007e002e4c000e636f6e746163745661724e616d6571007e00044c00076772616d6d61727400204c636f6d2f636973636f2f6772616d6d61722f5265636f676e697a61626c653b4c00116d61784e756d526574726965734578707271007e00674c000a70726f6d70744578707271007e00674c000b74696d656f75744578707271007e00677871007e00267708000000000000000271007e00097371007e0018000000000000000e7571007e001b00000014740001317400013274000133740001347400013574000136740001377400013874000139740006313020282a297400013074000631312028232974000754696d656f757474000c556e7375636365737366756c7070707070707878770400000001787704000000097371007e0035770800000006000000037371007e007400000003707371007e003b00000000770400000000787371007e003d7704000000017371007e030c770d000000020000000000000005007878770100707877040000000174000133787371007e0035770800000006000000037371007e007400000003707371007e003b00000000770400000000787371007e003d7704000000017371007e030c770d00000002000000007fffffff007878770100707877040000000171007e04a478770200017571007e00330000000c7371007e00357708000000060000000371007e0491707371007e003b00000000770400000000787371007e003d7704000000017371007e01a9770c00000001000000017fffffff7878770100707877040000000171007e0491787371007e00357708000000060000000371007e0492707371007e003b00000000770400000000787371007e003d77040000000171007e04ae78770100707877040000000171007e0492787371007e00357708000000060000000371007e0493707371007e003b00000000770400000000787371007e003d77040000000171007e04ae78770100707877040000000171007e0493787371007e00357708000000060000000371007e0494707371007e003b00000000770400000000787371007e003d77040000000171007e04ae78770100707877040000000171007e0494787371007e00357708000000060000000371007e0495707371007e003b00000000770400000000787371007e003d77040000000171007e04ae78770100707877040000000171007e0495787371007e00357708000000060000000371007e0496707371007e003b00000000770400000000787371007e003d77040000000171007e04ae78770100707877040000000171007e0496787371007e00357708000000060000000371007e0497707371007e003b00000000770400000000787371007e003d77040000000171007e04ae78770100707877040000000171007e0497787371007e00357708000000060000000371007e0498707371007e003b00000000770400000000787371007e003d77040000000171007e04ae78770100707877040000000171007e0498787371007e00357708000000060000000371007e0499707371007e003b00000000770400000000787371007e003d77040000000171007e04ae78770100707877040000000171007e0499787371007e00357708000000060000000371007e049a707371007e003b00000000770400000000787371007e003d7704000000017371007e01a9770c00000001000000017fffffff7878770100707877040000000171007e049a787371007e00357708000000060000000371007e049b707371007e003b00000000770400000000787371007e003d77040000000171007e04ca78770100707877040000000171007e049b787371007e00357708000000060000000371007e049c707371007e003b00000000770400000000787371007e003d77040000000171007e04ca78770100707877040000000171007e049c78737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000c71007e04937400013371007e04927400013271007e049a7400012a71007e04917400013171007e049b7400013071007e049c7400012371007e04977400013771007e04967400013671007e04957400013571007e04947400013471007e04997400013971007e0498740001387873720027636f6d2e636973636f2e6772616d6d61722e4d756c74694469676974576f72644772616d6d6172a27b1f1d61470c190300025b00066469676974737400025b5a5b0004746167737400135b4c6a6176612f6c616e672f537472696e673b78720023636f6d2e636973636f2e6772616d6d61722e4d756c746944696769744772616d6d617253907dd8ed7ed0f503000349000473697a655b000664696769747371007e04e05b00047461677371007e04e17872001e636f6d2e636973636f2e6772616d6d61722e44696769744772616d6d6172a63a4eb28ab6567103000078720019636f6d2e636973636f2e6772616d6d61722e4772616d6d6172bb35b8ad9cc031880300014c00066c6f63616c6571007e014d7870770400000001707877040000000178770400000001757200025b5a578f203914b85de202000078700000001001010101010101010101010100000000757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b4702000078700000001074000231307400013074000131740001327400013374000134740001357400013674000137740001387400013974000231317070707077040000000c78770400000001787400162d2d54726967676572696e6720436f6e746163742d2d7371007e0035770800000006000000017371007e00927704000000017371007e01f677040000000271007e01f9770800000001000000017371007e0048770400000001707078787704000000017371007e01407704000000017371007e004177040000000271007e00477708000000010000000371007e04fa7877040000000174000b496e70757450726f6d707477010078787704000000027371007e003b0000000177040000000571007e0146787371007e003b0000000177040000000571007e02007871007e04fa7871007e02047871007e01f97078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000e505b496e70757450726f6d70745d78770201017874000070787371007e000c7711000000000000000200000000000001880070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e00357708000000060000000374000131707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000131787874000070787371007e000c7711000000000000000200000000000001890070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c77110000000000000002000000000000018a0070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e0533787704000000017371007e009577040000000271007e00477708000000010000002771007e0533787704000000017371007e009577040000000271007e00477708000000010000001971007e0533787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e05337877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e0533787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c77110000000000000002000000000000018b007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e05527877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c77110000000000000002000000000000018c0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c77110000000000000002000000000000018d0070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c77110000000000000002000000000000018e0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e00357708000000060000000374000132707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000132787874000070787371007e000c77110000000000000002000000000000018f0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001900070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e05a4787704000000017371007e009577040000000271007e00477708000000010000002771007e05a4787704000000017371007e009577040000000271007e00477708000000010000001971007e05a4787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e05a47877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e05a4787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c771100000000000000020000000000000191007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e05c37877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c7711000000000000000200000000000001920070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001930070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001940070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e00357708000000060000000374000133707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000133787874000070787371007e000c7711000000000000000200000000000001950070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001960070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e0615787704000000017371007e009577040000000271007e00477708000000010000002771007e0615787704000000017371007e009577040000000271007e00477708000000010000001971007e0615787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e06157877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e0615787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c771100000000000000020000000000000197007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e06347877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c7711000000000000000200000000000001980070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001990070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c77110000000000000002000000000000019a0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e00357708000000060000000374000134707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000134787874000070787371007e000c77110000000000000002000000000000019b0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c77110000000000000002000000000000019c0070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e0686787704000000017371007e009577040000000271007e00477708000000010000002771007e0686787704000000017371007e009577040000000271007e00477708000000010000001971007e0686787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e06867877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e0686787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c77110000000000000002000000000000019d007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e06a57877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c77110000000000000002000000000000019e0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c77110000000000000002000000000000019f0070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001a00070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e00357708000000060000000374000135707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000135787874000070787371007e000c7711000000000000000200000000000001a10070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001a20070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e06f7787704000000017371007e009577040000000271007e00477708000000010000002771007e06f7787704000000017371007e009577040000000271007e00477708000000010000001971007e06f7787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e06f77877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e06f7787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001a3007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e07167877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c7711000000000000000200000000000001a40070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001a50070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001a60070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e00357708000000060000000374000136707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000136787874000070787371007e000c7711000000000000000200000000000001a70070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001a80070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e0768787704000000017371007e009577040000000271007e00477708000000010000002771007e0768787704000000017371007e009577040000000271007e00477708000000010000001971007e0768787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e07687877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e0768787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001a9007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e07877877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c7711000000000000000200000000000001aa0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001ab0070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001ac0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e00357708000000060000000374000137707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000137787874000070787371007e000c7711000000000000000200000000000001ad0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001ae0070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e07d9787704000000017371007e009577040000000271007e00477708000000010000002771007e07d9787704000000017371007e009577040000000271007e00477708000000010000001971007e07d9787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e07d97877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e07d9787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001af007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e07f87877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c7711000000000000000200000000000001b00070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001b10070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001b20070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e00357708000000060000000374000138707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000138787874000070787371007e000c7711000000000000000200000000000001b30070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001b40070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e084a787704000000017371007e009577040000000271007e00477708000000010000002771007e084a787704000000017371007e009577040000000271007e00477708000000010000001971007e084a787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e084a7877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e084a787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001b5007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e08697877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c7711000000000000000200000000000001b60070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001b70070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001b80070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e00357708000000060000000374000139707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000139787874000070787371007e000c7711000000000000000200000000000001b90070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001ba0070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e08bb787704000000017371007e009577040000000271007e00477708000000010000002771007e08bb787704000000017371007e009577040000000271007e00477708000000010000001971007e08bb787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e08bb7877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e08bb787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001bb007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e08da7877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c7711000000000000000200000000000001bc0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001bd0070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001be0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e0035770800000006000000037400023130707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400023130787874000070787371007e000c7711000000000000000200000000000001bf0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001c00070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e092c787704000000017371007e009577040000000271007e00477708000000010000002771007e092c787704000000017371007e009577040000000271007e00477708000000010000001971007e092c787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e092c7877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e092c787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001c1007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e094b7877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c7711000000000000000200000000000001c20070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001c30070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001c40070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e00357708000000060000000374000130707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000130787874000070787371007e000c7711000000000000000200000000000001c50070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001c60070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e099d787704000000017371007e009577040000000271007e00477708000000010000002771007e099d787704000000017371007e009577040000000271007e00477708000000010000001971007e099d787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e099d7877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e099d787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001c7007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e09bc7877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c7711000000000000000200000000000001c80070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001c90070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001ca0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e0048770400000001707078787704000000017400094f75747075744e756d77010078707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400094f75747075744e756d787371007e0035770800000006000000037400023131707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400023131787874000070787371007e000c7711000000000000000200000000000001cb0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c75655072657677010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c75657701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001cc0070707877080000000000000003740030636f6d2e636973636f2e77662e73746570732e696f2e476574584d4c446f6356616c7565537465704265616e496e666f7371007e00667708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a70707070707070707070787877080000000000000001787708000000000000000374000b584d4c446f63756d656e747371007e0035770800000006000000017371007e009577040000000271007e00477708000000010000004b7371007e0048770400000001707078787704000000017371007e009577040000000271007e00477708000000010000003f71007e0a0e787704000000017371007e009577040000000271007e00477708000000010000002771007e0a0e787704000000017371007e009577040000000271007e00477708000000010000001971007e0a0e787704000000017400152f656173796363782f696e7075745b6e616d653d277371007e004177040000000271007e00477708000000010000001b71007e0a0e7877040000000174000b4f757470757456616c75657701007878770800000001ffffffff7877040000000371007e004778740013275d2f6f7574707574735b6e756d6265723d2778770800000001ffffffff7877040000000371007e0047787371007e004177040000000271007e00477708000000010000004171007e0a0e787704000000017400094f75747075744e756d7701007878770800000001ffffffff7877040000000371007e004778740009275d2f6f757470757478770800000001ffffffff7877040000000371007e004778707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740057222f656173796363782f696e7075745b6e616d653d2722202b204f757470757456616c7565202b2022275d2f6f7574707574735b6e756d6265723d2722202b204f75747075744e756d202b2022275d2f6f757470757422787371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787874000070787371007e000c7711000000000000000200000000000001cd007070787708000000000000000374002f636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657049664265616e496e666f7371007e00a37708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a7400045472756574000546616c7365707070707070707078787708000000000000000178770800000000000000027371007e0035770800000006000000017371007e00aa77040000000271007e00ae7708000000010000000c7371007e0048770400000001707078787704000000017371007e004177040000000271007e00477708000000010000000171007e0a2d7877040000000174000b4f757470757456616c756577010078707877040000000171007e00477877040000000178707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400114f757470757456616c75653d3d6e756c6c787874000070787371007e000c7711000000000000000200000000000001ce0070707877080000000000000003740033636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e5374657041737369676e4265616e496e666f7371007e00867708000000000000000271007e00097371007e001800000000000000017571007e001b0000000a7070707070707070707078787708000000000000000178770800000000000000037371007e0035770800000006000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000b4f757470757456616c756577010078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000b4f757470757456616c7565787371007e0035770800000006000000017371007e00927704000000017371007e004177040000000271007e0047770800000001000000017371007e00487704000000017070787877040000000174000f4f757470757456616c7565507265767701007871007e00477078707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000f4f757470757456616c756550726576787874000070787371007e000c7711000000000000000200000000000001cf0070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001d00070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787371007e000c7711000000000000000200000000000001d10070707877080000000000000003740031636f6d2e636973636f2e77666672616d65776f726b2e73746570732e636f72652e53746570476f746f4265616e496e666f7371007e00ba7708000000000000000271007e00097371007e001800000000000000027571007e001b0000000a707070707070707070707878770800000000000000017877080000000000000001740003546f707874000070787871007e001174000b456173794343582e6165667400385c5c766d776172652d686f73745c53686172656420466f6c646572735c4465736b746f705c4465736b746f705c456173794343582e61656673720027636f6d2e636973636f2e77666672616d65776f726b2e6f626a2e574653756d6d617279496e666f0efb9719092eca3b0300064c0006417574686f7271007e00044c0007436f6d70616e7971007e00044c00074d616e6167657271007e00044c00075375626a65637471007e00044c00055469746c6571007e00044c0005636f756e7474001e4c636f6d2f636973636f2f696f2f53657269616c697a6564436f756e743b78707708000000000000000274000071007e0a6371007e0a6371007e0a6371007e0a637372001c636f6d2e636973636f2e696f2e53657269616c697a6564436f756e74f884a10addeb3ccb030001490005636f756e747870770c000000000000000100000006787877010173720035636f6d2e636973636f2e77666672616d65776f726b2e6f626a2e5746576f726b666c6f77436f6e74657874446566696e6974696f6ee4a37459706560930300054c000a6174747269627574657371007e00104c00056e616d657371007e00104c0005747970657371007e00104c000676616c75657371007e00104c00097661726961626c657371007e00107870770800000000000000047371007e001800000000000000107571007e001b0000001073720029636f6d2e636973636f2e65787072657373696f6e2e574645787072657373696f6e5661726961626c6507a9e32af2e3aa9d03000649000a617474726962757465735a00086d6f6469666965645a000772756e74696d654c0005636c617a7a71007e00444c00046578707271007e00674c00046e616d6571007e0004787077040000000274000c43616c6c65644e756d62657277040000000071007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a77040000000274000b584d4c446f63756d656e7477040000000071007e013e7371007e0035770800000006000000017371007e013a77040000000271007e013e770800000001000000017371007e0048770400000001707078787704000000017371007e0140770400000001740020222f22202b20446f63466f6c646572202b20222f456173794343582e61656622787704000000027371007e003b0000000177040000000571007e0146787371007e003b0000000177040000000571007e01467871007e0a767871007e014e78707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740025444f435b222f22202b20446f63466f6c646572202b20222f456173794343582e616566225d7877020001787371007e0a6a77040000000274000a496e707574436f756e7477040000000071007e00767371007e0035770800000006000000037371007e007400000000707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740001307877020001787371007e0a6a77040000000274000c496e707574436f756e74657277040000000071007e00767371007e0035770800000006000000037371007e007400000000707371007e003b00000000770400000000787371007e003d770400000000787701007078770400000001740001307877020001787371007e0a6a77040000000274000a496e70757456616c756577040000000071007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a77040000000274000b4f757470757456616c756577040000000071007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a770400000002740009496e7075745479706577040000000071007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a77040000000274000b496e70757450726f6d707477040000000071007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a77040000000274000b496e7075744e756d62657277040000000071007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a7704000000027400094f75747075744e756d77040000000071007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a770400000002740009446f63466f6c64657277040000000371007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a770400000002740011584d4c446f63756d656e74537472696e6777040000000071007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a77040000000274000c4469616c656444696769747377040000000071007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a77040000000274000f4f757470757456616c75655072657677040000000071007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a770400000002740008496e70757443535177040000000071007e00477371007e003577080000000600000003740000707371007e003b00000000770400000000787371007e003d77040000000078770100707877040000000174000222227877020001787371007e0a6a77040000000274000b4353515265736f7572636577040000000071007e04097371007e00357708000000060000000370707371007e003b00000000770400000000787371007e003d7704000000007877010070787704000000017400046e756c6c787702000178787371007e001800000000000000107571007e001b0000001471007e0a6c71007e0a7371007e0a7f71007e0a8671007e0a8d71007e0a9471007e0a9b71007e0aa271007e0aa971007e0ab071007e0ab771007e0abe71007e0ac571007e0acc71007e0ad371007e0ada70707070787371007e001800000000000000107571007e001b000000147400106a6176612e6c616e672e537472696e67740016636f6d2e636973636f2e646f632e446f63756d656e747400116a6176612e6c616e672e496e746567657271007e0ae571007e0ae371007e0ae371007e0ae371007e0ae371007e0ae371007e0ae371007e0ae371007e0ae371007e0ae371007e0ae371007e0ae3740013636f6d2e636973636f2e757365722e5573657270707070787371007e001800000000000000107571007e001b0000001471007e0a6d71007e0a7471007e0a8071007e0a8771007e0a8e71007e0a9571007e0a9c71007e0aa371007e0aaa71007e0ab171007e0ab871007e0abf71007e0ac671007e0acd71007e0ad471007e0adb70707070787371007e001800000000000000107571007e001b000000147371007e00740000000071007e0aeb71007e0aeb71007e0aeb71007e0aeb71007e0aeb71007e0aeb71007e0aeb71007e0aeb71007e0aeb71007e020071007e0aeb71007e0aeb71007e0aeb71007e0aeb71007e0aeb70707070787873720035636f6d2e636973636f2e77666672616d65776f726b2e6f626a2e5746576f726b666c6f774d6f6469666961626c65436f6e746578743f75dbd2d49039f603000249000473697a654c000752454d4f56454471007e00377871007e0a66770800000000000000047371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707878770800000000000000027372003d636f6d2e636973636f2e77666672616d65776f726b2e6f626a2e5746576f726b666c6f774d6f6469666961626c65436f6e746578742452656d6f76656492db941f2fba67e4020000787077040000000078770800000000000001d1737200136a6176612e7574696c2e486173687461626c6513bb0f25214ae4b803000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000277080000000300000001740028636f6d2e636973636f2e77666672616d65776f726b2e6f626a2e574654726565576f726b666c6f7773720028636f6d2e636973636f2e77666672616d65776f726b2e6f626a2e574654726565576f726b666c6f7753ce380871d8a2cd0300024c0008726f6f744e6f646574002e4c636f6d2f636973636f2f77666672616d65776f726b2f6f626a2f574654726565576f726b666c6f774e6f64653b4c0008776f726b666c6f777400264c636f6d2f636973636f2f77666672616d65776f726b2f6f626a2f5746576f726b666c6f773b78707708000000000000000171007e00097372002c636f6d2e636973636f2e77666672616d65776f726b2e6f626a2e574654726565576f726b666c6f774e6f64652e6f512f39f500b60300045b000a6368696c6450617468737400135b4c6a6176612f7574696c2f566563746f723b4c0006706172656e7471007e0afe4c00047374657071007e00064c000c74726565576f726b666c6f7774002a4c636f6d2f636973636f2f77666672616d65776f726b2f6f626a2f574654726565576f726b666c6f773b7870770a00000000000000020100707371007e0018000000000000008b7571007e001b000000a071007e0b047371007e0b01770a0000000000000002000071007e001171007e0b04707371007e0afd7708000000000000000171007e000971007e0b0478787371007e0b01770a0000000000000002000071007e002371007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e015e71007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e013371007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e002b71007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e006471007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e007d71007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e008471007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e00c771007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e011a71007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e00a171007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e005c71007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e010171007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e017771007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e00c071007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e001d71007e0b047071007e0b08787371007e0b01770a0000000000000002000071007e00da71007e0b107071007e0b08787371007e0b01770a0000000000000002000071007e00e171007e0b127071007e0b08787371007e0b01770a0000000000000002000071007e00fa71007e0b127071007e0b08787371007e0b01770a0000000000000002000071007e00b871007e0b127071007e0b08787371007e0b01770a0000000000000002000071007e01bb71007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e048a71007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e01d471007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e01ed71007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e020971007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e022271007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e024771007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e024e71007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e026771007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e02dd71007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e02f671007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e03e371007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e044971007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e03fc71007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e03dc71007e0b157071007e0b08787371007e0b01770a0000000000000002000071007e050471007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e051671007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e052b71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e054971007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e056e71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e057571007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e058771007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e059c71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e05ba71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e05df71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e05e671007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e05f871007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e060d71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e062b71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e065071007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e065771007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e066971007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e067e71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e069c71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e06c171007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e06c871007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e06da71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e06ef71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e070d71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e073271007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e073971007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e074b71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e076071007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e077e71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e07a371007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e07aa71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e07bc71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e07d171007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e07ef71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e081471007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e081b71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e082d71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e084271007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e086071007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e088571007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e088c71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e089e71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e08b371007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e08d171007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e08f671007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e08fd71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e090f71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e092471007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e094271007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e096771007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e096e71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e098071007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e099571007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e09b371007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e09d871007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e09df71007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e09f171007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e0a0671007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e0a2471007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e0a4971007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e0a5071007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e0a5771007e0b1d7071007e0b08787371007e0b01770a0000000000000002000071007e023271007e0b217071007e0b08787371007e0b01770a0000000000000002000071007e028271007e0b247071007e0b08787371007e0b01770a0000000000000002000071007e028971007e0b247071007e0b08787371007e0b01770a0000000000000002000071007e029e71007e0b247071007e0b08787371007e0b01770a0000000000000002000071007e02a571007e0b247071007e0b08787371007e0b01770a0000000000000002000071007e02ba71007e0b247071007e0b08787371007e0b01770a0000000000000002000071007e02c171007e0b247071007e0b08787371007e0b01770a0000000000000002000071007e02d671007e0b247071007e0b08787371007e0b01770a0000000000000002000071007e033071007e0b267071007e0b08787371007e0b01770a0000000000000002000071007e03a471007e0b267071007e0b08787371007e0b01770a0000000000000002000071007e03b971007e0b267071007e0b08787371007e0b01770a0000000000000002000071007e03c071007e0b267071007e0b08787371007e0b01770a0000000000000002000071007e03d571007e0b267071007e0b08787371007e0b01770a0000000000000002000071007e045771007e0b297071007e0b08787371007e0b01770a0000000000000002000071007e041d71007e0b297071007e0b08787371007e0b01770a0000000000000002000071007e042f71007e0b297071007e0b08787371007e0b01770a0000000000000002000071007e043671007e0b297071007e0b08787371007e0b01770a0000000000000002000071007e044271007e0b297071007e0b08787371007e0b01770a0000000000000002000071007e045071007e0b297071007e0b08787371007e0b01770a0000000000000002000071007e055971007e0b2e7071007e0b08787371007e0b01770a0000000000000002000071007e05ca71007e0b337071007e0b08787371007e0b01770a0000000000000002000071007e063b71007e0b387071007e0b08787371007e0b01770a0000000000000002000071007e06ac71007e0b3d7071007e0b08787371007e0b01770a0000000000000002000071007e071d71007e0b427071007e0b08787371007e0b01770a0000000000000002000071007e078e71007e0b477071007e0b08787371007e0b01770a0000000000000002000071007e07ff71007e0b4c7071007e0b08787371007e0b01770a0000000000000002000071007e087071007e0b517071007e0b08787371007e0b01770a0000000000000002000071007e08e171007e0b567071007e0b08787371007e0b01770a0000000000000002000071007e095271007e0b5b7071007e0b08787371007e0b01770a0000000000000002000071007e09c371007e0b607071007e0b08787371007e0b01770a0000000000000002000071007e0a3471007e0b657071007e0b08787371007e0b01770a0000000000000002000071007e034971007e0b717071007e0b08787371007e0b01770a0000000000000002000071007e035071007e0b717071007e0b08787371007e0b01770a0000000000000002000071007e036571007e0b717071007e0b08787371007e0b01770a0000000000000002000071007e036c71007e0b717071007e0b08787371007e0b01770a0000000000000002000071007e038171007e0b717071007e0b08787371007e0b01770a0000000000000002000071007e038871007e0b717071007e0b08787371007e0b01770a0000000000000002000071007e039d71007e0b717071007e0b08787371007e0b01770a0000000000000002000071007e046771007e0b767071007e0b08787371007e0b01770a0000000000000002000071007e046e71007e0b767071007e0b08787371007e0b01770a0000000000000002000071007e048371007e0b767071007e0b0878707070707070707070707070707070707070707070787371007e0afa3f4000000000008f7708000000bf0000008b71007e0b29757200135b4c6a6176612e7574696c2e566563746f723bc02030cb681af96f0200007870000000027371007e001800000000000000017571007e001b0000000a71007e0b76707070707070707070787371007e001800000000000000057571007e001b0000000a71007e0b7771007e0b7871007e0b7971007e0b7a71007e0b7b70707070707871007e0b0c7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b4a7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b787571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b1b7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b8d7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b8f7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b837571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b0b7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b727571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b517571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b83707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b6b7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b817571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b2d7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b407571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b7d7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b757571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b397571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b4c7571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b82707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b1c7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b047571007e0b93000000017371007e001800000000000000107571007e001b0000001471007e0b0771007e0b0971007e0b0a71007e0b0b71007e0b0c71007e0b0d71007e0b0e71007e0b0f71007e0b1071007e0b1171007e0b1271007e0b1371007e0b1471007e0b1571007e0b1671007e0b17707070707871007e0b917571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b217571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b69707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b577571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b3f7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b507571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b497571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b257571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b317571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b617571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b677571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b5f7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b687571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b3c7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b0a7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b2c7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b437571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b697571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b847571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b6e7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b3e7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b597571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b107571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b18707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b667571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b187571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b557571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b637571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b0e7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b367571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b117571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b447571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b417571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b747571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b707571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b267571007e0b93000000037371007e001800000000000000017571007e001b0000000a71007e0b71707070707070707070787371007e001800000000000000027571007e001b0000000a71007e0b7271007e0b737070707070707070787371007e001800000000000000027571007e001b0000000a71007e0b7471007e0b7570707070707070707871007e0b3a7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b237571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b6d7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b857571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b6f7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b1a7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b2b7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b4d7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b7e7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b607571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b86707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b907571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b7a7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b097571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b157571007e0b93000000067371007e001800000000000000027571007e001b0000000a71007e0b1c71007e0b1d7070707070707070787371007e001800000000000000057571007e001b0000000a71007e0b1e71007e0b1f71007e0b2071007e0b2171007e0b227070707070787371007e001800000000000000027571007e001b0000000a71007e0b2371007e0b247070707070707070787371007e001800000000000000027571007e001b0000000a71007e0b2571007e0b267070707070707070787371007e001800000000000000037571007e001b0000000a71007e0b2771007e0b2871007e0b2970707070707070787371007e001800000000000000017571007e001b0000000a71007e0b2a7070707070707070707871007e0b537571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b717571007e0b93000000047371007e001800000000000000017571007e001b0000000a71007e0b88707070707070707070787371007e001800000000000000027571007e001b0000000a71007e0b8971007e0b8a7070707070707070787371007e001800000000000000027571007e001b0000000a71007e0b8b71007e0b8c7070707070707070787371007e001800000000000000027571007e001b0000000a71007e0b8d71007e0b8e70707070707070707871007e0b4b7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b627571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b7f7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b177571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b147571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b337571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b7d707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b2e7571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b7c707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b387571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b7e707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b877571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b197571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b377571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b077571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b6a7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b567571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b84707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b7b7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b897571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b827571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b227571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b4f7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b867571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b427571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b80707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b477571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b81707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b357571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b5e7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b767571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b8f707070707070707070787371007e001800000000000000027571007e001b0000000a71007e0b9071007e0b9170707070707070707871007e0b6c7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b3b7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b547571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b327571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b207571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b0d7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b167571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b587571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b887571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b247571007e0b93000000047371007e001800000000000000017571007e001b0000000a71007e0b6a707070707070707070787371007e001800000000000000027571007e001b0000000a71007e0b6b71007e0b6c7070707070707070787371007e001800000000000000027571007e001b0000000a71007e0b6d71007e0b6e7070707070707070787371007e001800000000000000027571007e001b0000000a71007e0b6f71007e0b7070707070707070707871007e0b2a7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b287571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b737571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b5d7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b657571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b87707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b347571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b277571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b467571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b8e7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b8c7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b2f7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b8b7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b8a7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b487571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b0f7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b307571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b7c7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b457571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b137571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b1d7571007e0b930000000e7371007e001800000000000000057571007e001b0000000a71007e0b2b71007e0b2c71007e0b2d71007e0b2e71007e0b2f7070707070787371007e001800000000000000057571007e001b0000000a71007e0b3071007e0b3171007e0b3271007e0b3371007e0b347070707070787371007e001800000000000000057571007e001b0000000a71007e0b3571007e0b3671007e0b3771007e0b3871007e0b397070707070787371007e001800000000000000057571007e001b0000000a71007e0b3a71007e0b3b71007e0b3c71007e0b3d71007e0b3e7070707070787371007e001800000000000000057571007e001b0000000a71007e0b3f71007e0b4071007e0b4171007e0b4271007e0b437070707070787371007e001800000000000000057571007e001b0000000a71007e0b4471007e0b4571007e0b4671007e0b4771007e0b487070707070787371007e001800000000000000057571007e001b0000000a71007e0b4971007e0b4a71007e0b4b71007e0b4c71007e0b4d7070707070787371007e001800000000000000057571007e001b0000000a71007e0b4e71007e0b4f71007e0b5071007e0b5171007e0b527070707070787371007e001800000000000000057571007e001b0000000a71007e0b5371007e0b5471007e0b5571007e0b5671007e0b577070707070787371007e001800000000000000057571007e001b0000000a71007e0b5871007e0b5971007e0b5a71007e0b5b71007e0b5c7070707070787371007e001800000000000000057571007e001b0000000a71007e0b5d71007e0b5e71007e0b5f71007e0b6071007e0b617070707070787371007e001800000000000000057571007e001b0000000a71007e0b6271007e0b6371007e0b6471007e0b6571007e0b667070707070787371007e001800000000000000017571007e001b0000000a71007e0b67707070707070707070787371007e001800000000000000017571007e001b0000000a71007e0b687070707070707070707871007e0b5b7571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b85707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b807571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b5a7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b127571007e0b93000000027371007e001800000000000000027571007e001b0000000a71007e0b1971007e0b1a7070707070707070787371007e001800000000000000017571007e001b0000000a71007e0b1b7070707070707070707871007e0b527571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b4e7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b1f7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b5c7571007e0b93000000027371007e001800000000000000007571007e001b0000000a70707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b1e7571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b647571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b797571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b3d7571007e0b93000000027371007e001800000000000000017571007e001b0000000a71007e0b7f707070707070707070787371007e001800000000000000007571007e001b0000000a707070707070707070707871007e0b777571007e0b93000000017371007e001800000000000000007571007e001b0000000a707070707070707070707878707071007e0b087878787371007e0afa3f4000000000008f7708000000bf0000008a71007e03307371007e001800000000000000047571007e001b0000000a73720026636f6d2e636973636f2e77666672616d65776f726b2e6f626a2e5746436f6e6e656374696f6ec5fe5a67bfda60bb0300024c00087374657046726f6d71007e00064c000673746570546f71007e000678707708000000000000000171007e033071007e0349787371007e0dce7708000000000000000171007e033071007e0350787371007e0dce7708000000000000000171007e033071007e036c787371007e0dce7708000000000000000171007e033071007e0388787070707070707871007e02f67371007e001800000000000000037571007e001b0000000a7371007e0dce7708000000000000000171007e02f671007e0330787371007e0dce7708000000000000000171007e02f671007e03a4787371007e0dce7708000000000000000171007e02f671007e03c078707070707070707871007e09df7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e09df71007e09f1787070707070707070707871007e069c7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e069c71007e06ac787371007e0dce7708000000000000000171007e069c71007e06c17870707070707070707871007e05f87371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e05f871007e060d787070707070707070707871007e056e7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e056e71007e005c787371007e0dce7708000000000000000171007e056e71007e00c07870707070707070707871007e00b87371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e00b871007e007d787371007e0dce7708000000000000000171007e00b871007e005c7870707070707070707871007e062b7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e062b71007e063b787371007e0dce7708000000000000000171007e062b71007e06507870707070707070707871007e024e7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e024e71007e0267787070707070707070707871007e09427371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e094271007e0952787371007e0dce7708000000000000000171007e094271007e09677870707070707070707871007e05597371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e055971007e056e787070707070707070707871007e06c87371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e06c871007e06da787070707070707070707871007e077e7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e077e71007e078e787371007e0dce7708000000000000000171007e077e71007e07a37870707070707070707871007e08fd7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e08fd71007e090f787070707070707070707871007e048a7371007e0018000000000000000e7571007e001b000000147371007e0dce7708000000000000000171007e048a71007e0504787371007e0dce7708000000000000000171007e048a71007e0575787371007e0dce7708000000000000000171007e048a71007e05e6787371007e0dce7708000000000000000171007e048a71007e0657787371007e0dce7708000000000000000171007e048a71007e06c8787371007e0dce7708000000000000000171007e048a71007e0739787371007e0dce7708000000000000000171007e048a71007e07aa787371007e0dce7708000000000000000171007e048a71007e081b787371007e0dce7708000000000000000171007e048a71007e088c787371007e0dce7708000000000000000171007e048a71007e08fd787371007e0dce7708000000000000000171007e048a71007e096e787371007e0dce7708000000000000000171007e048a71007e09df787371007e0dce7708000000000000000171007e048a71007e0a50787371007e0dce7708000000000000000171007e048a71007e0a57787070707070707871007e07397371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e073971007e074b787070707070707070707871007e08d17371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e08d171007e08e1787371007e0dce7708000000000000000171007e08d171007e08f67870707070707070707871007e03817371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e038171007e005c787371007e0dce7708000000000000000171007e038171007e00c07870707070707070707871007e08707371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e087071007e0885787070707070707070707871007e0a577371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e0a5771007e005c787371007e0dce7708000000000000000171007e0a5771007e00c07870707070707070707871007e001d7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e001d70787070707070707070707871007e00a17371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e00a171007e00e1787371007e0dce7708000000000000000171007e00a171007e00b87870707070707070707871007e01777371007e001800000000000000067571007e001b0000000a7371007e0dce7708000000000000000171007e017771007e01bb787371007e0dce7708000000000000000171007e017771007e01d4787371007e0dce7708000000000000000171007e017771007e024e787371007e0dce7708000000000000000171007e017771007e02dd787371007e0dce7708000000000000000171007e017771007e03e3787371007e0dce7708000000000000000171007e017771007e03dc78707070707871007e01337371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e013371007e002b787070707070707070707871007e00e17371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e00e171007e00fa787070707070707070707871007e05877371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e058771007e059c787070707070707070707871007e07d17371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e07d171007e07ef787070707070707070707871007e03b97371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e03b971007e005c787371007e0dce7708000000000000000171007e03b971007e00c07870707070707070707871007e06577371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e065771007e0669787070707070707070707871007e07ef7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e07ef71007e07ff787371007e0dce7708000000000000000171007e07ef71007e08147870707070707070707871007e07ff7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e07ff71007e0814787070707070707070707871007e03e37371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e03e371007e0449787070707070707070707871007e00117371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e001171007e0023787070707070707070707871007e041d7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e041d71007e042f787070707070707070707871007e060d7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e060d71007e062b787070707070707070707871007e00237371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e002371007e015e787070707070707070707871007e02097371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e020971007e0222787070707070707070707871007e06ef7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e06ef71007e070d787070707070707070707871007e078e7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e078e71007e07a3787070707070707070707871007e08857371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e088571007e005c787371007e0dce7708000000000000000171007e088571007e00c07870707070707070707871007e09807371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e098071007e0995787070707070707070707871007e0a247371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e0a2471007e0a34787371007e0dce7708000000000000000171007e0a2471007e0a497870707070707070707871007e036c7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e036c71007e0381787070707070707070707871007e063b7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e063b71007e0650787070707070707070707871007e07aa7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e07aa71007e07bc787070707070707070707871007e08e17371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e08e171007e08f6787070707070707070707871007e09c37371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e09c371007e09d8787070707070707070707871007e02dd7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e02dd71007e02f6787070707070707070707871007e09957371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e099571007e09b3787070707070707070707871007e007d7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e007d71007e0084787070707070707070707871007e03507371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e035071007e0365787070707070707070707871007e088c7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e088c71007e089e787070707070707070707871007e08f67371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e08f671007e005c787371007e0dce7708000000000000000171007e08f671007e00c07870707070707070707871007e08b37371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e08b371007e08d1787070707070707070707871007e05ba7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e05ba71007e05ca787371007e0dce7708000000000000000171007e05ba71007e05df7870707070707070707871007e01ed7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e01ed71007e0209787070707070707070707871007e05e67371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e05e671007e05f8787070707070707070707871007e00847371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e008471007e00c7787070707070707070707871007e09b37371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e09b371007e09c3787371007e0dce7708000000000000000171007e09b371007e09d87870707070707070707871007e011a7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e011a71007e00a1787070707070707070707871007e067e7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e067e71007e069c787070707070707070707871007e02ba7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e02ba71007e005c787371007e0dce7708000000000000000171007e02ba71007e00c07870707070707070707871007e002b7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e002b71007e0064787070707070707070707871007e05757371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e057571007e0587787070707070707070707871007e089e7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e089e71007e08b3787070707070707070707871007e01d47371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e01d471007e01ed787070707070707070707871007e00c77371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e00c771007e00da787371007e0dce7708000000000000000171007e00c771007e011a7870707070707070707871007e04837371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e048371007e005c787371007e0dce7708000000000000000171007e048371007e00c07870707070707070707871007e0a067371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e0a0671007e0a24787070707070707070707871007e046e7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e046e71007e0483787070707070707070707871007e04367371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e043671007e0442787070707070707070707871007e07607371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e076071007e077e787070707070707070707871007e005c7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e005c71007e0101787070707070707070707871007e029e7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e029e71007e005c787371007e0dce7708000000000000000171007e029e71007e00c07870707070707070707871007e039d7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e039d71007e005c787371007e0dce7708000000000000000171007e039d71007e00c07870707070707070707871007e04497371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e044971007e03fc787070707070707070707871007e096e7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e096e71007e0980787070707070707070707871007e02c17371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e02c171007e02d6787070707070707070707871007e05167371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e051671007e052b787070707070707070707871007e02327371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e023271007e0247787070707070707070707871007e052b7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e052b71007e0549787070707070707070707871007e074b7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e074b71007e0760787070707070707070707871007e08607371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e086071007e0870787371007e0dce7708000000000000000171007e086071007e08857870707070707070707871007e06da7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e06da71007e06ef787070707070707070707871007e06507371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e065071007e005c787371007e0dce7708000000000000000171007e065071007e00c07870707070707070707871007e09677371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e096771007e005c787371007e0dce7708000000000000000171007e096771007e00c07870707070707070707871007e02d67371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e02d671007e005c787371007e0dce7708000000000000000171007e02d671007e00c07870707070707070707871007e05df7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e05df71007e005c787371007e0dce7708000000000000000171007e05df71007e00c07870707070707070707871007e06697371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e066971007e067e787070707070707070707871007e071d7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e071d71007e0732787070707070707070707871007e02677371007e001800000000000000047571007e001b0000000a7371007e0dce7708000000000000000171007e026771007e0282787371007e0dce7708000000000000000171007e026771007e0289787371007e0dce7708000000000000000171007e026771007e02a5787371007e0dce7708000000000000000171007e026771007e02c1787070707070707871007e03497371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e034971007e00c0787371007e0dce7708000000000000000171007e034971007e00c07870707070707070707871007e059c7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e059c71007e05ba787070707070707070707871007e08147371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e081471007e005c787371007e0dce7708000000000000000171007e081471007e00c07870707070707070707871007e03657371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e036571007e005c787371007e0dce7708000000000000000171007e036571007e00c07870707070707070707871007e08427371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e084271007e0860787070707070707070707871007e02227371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e022271007e0232787371007e0dce7708000000000000000171007e022271007e02477870707070707070707871007e03c07371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e03c071007e03d5787070707070707070707871007e01bb7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e01bb71007e048a787070707070707070707871007e09247371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e092471007e0942787070707070707070707871007e01017371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e010171007e0177787070707070707070707871007e04577371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e045771007e0467787371007e0dce7708000000000000000171007e045771007e046e7870707070707070707871007e04427371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e044271007e0450787070707070707070707871007e00fa7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e00fa71007e005c787371007e0dce7708000000000000000171007e00fa71007e005c7870707070707070707871007e07a37371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e07a371007e005c787371007e0dce7708000000000000000171007e07a371007e00c07870707070707070707871007e04677371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e046771007e00c0787371007e0dce7708000000000000000171007e046771007e00c07870707070707070707871007e09527371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e095271007e0967787070707070707070707871007e02897371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e028971007e029e787070707070707070707871007e082d7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e082d71007e0842787070707070707070707871007e03fc7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e03fc71007e0457787371007e0dce7708000000000000000171007e03fc71007e041d7870707070707070707871007e03a47371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e03a471007e03b9787070707070707070707871007e03dc7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e03dc71007e00c0787371007e0dce7708000000000000000171007e03dc71007e00c07870707070707070707871007e070d7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e070d71007e071d787371007e0dce7708000000000000000171007e070d71007e07327870707070707070707871007e042f7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e042f71007e0436787070707070707070707871007e03d57371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e03d571007e005c787371007e0dce7708000000000000000171007e03d571007e00c07870707070707070707871007e09d87371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e09d871007e005c787371007e0dce7708000000000000000171007e09d871007e00c07870707070707070707871007e02827371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e028271007e00c0787371007e0dce7708000000000000000171007e028271007e00c07870707070707070707871007e07327371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e073271007e005c787371007e0dce7708000000000000000171007e073271007e00c07870707070707070707871007e04507371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e045071007e0449787371007e0dce7708000000000000000171007e045071007e00c07870707070707070707871007e00da7371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e00da71007e00c0787371007e0dce7708000000000000000171007e00da71007e011a7870707070707070707871007e015e7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e015e71007e0133787070707070707070707871007e06ac7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e06ac71007e06c1787070707070707070707871007e02a57371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e02a571007e02ba787070707070707070707871007e081b7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e081b71007e082d787070707070707070707871007e05047371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e050471007e0516787070707070707070707871007e09f17371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e09f171007e0a06787070707070707070707871007e0a497371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e0a4971007e005c787371007e0dce7708000000000000000171007e0a4971007e00c07870707070707070707871007e05ca7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e05ca71007e05df787070707070707070707871007e0a347371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e0a3471007e0a49787070707070707070707871007e0a507371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e0a5071007e005c787371007e0dce7708000000000000000171007e0a5071007e00c07870707070707070707871007e02477371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e024771007e005c787371007e0dce7708000000000000000171007e024771007e00c07870707070707070707871007e05497371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e054971007e0559787371007e0dce7708000000000000000171007e054971007e056e7870707070707070707871007e00c07371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e00c071007e001d787070707070707070707871007e07bc7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e07bc71007e07d1787070707070707070707871007e00647371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e006471007e007d787070707070707070707871007e06c17371007e001800000000000000027571007e001b0000000a7371007e0dce7708000000000000000171007e06c171007e005c787371007e0dce7708000000000000000171007e06c171007e00c07870707070707070707871007e03887371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e038871007e039d787070707070707070707871007e090f7371007e001800000000000000017571007e001b0000000a7371007e0dce7708000000000000000171007e090f71007e092478707070707070707070787878, 'EasyCCX.aef');

--
-- Triggers `appblob`
--
DELIMITER $$
CREATE TRIGGER `t_appblob` BEFORE INSERT ON `appblob`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `appdata`
--

CREATE TABLE IF NOT EXISTS `appdata` (
  `pkid` varchar(40) NOT NULL,
  `fkapp` varchar(40) NOT NULL,
  `fktenant` varchar(40) NOT NULL,
  `fkxref` varchar(40) NOT NULL,
  `vc1` varchar(100) NOT NULL,
  `vc2` varchar(100) NOT NULL,
  `vc3` varchar(100) NOT NULL,
  `vc4` varchar(100) NOT NULL,
  `vc5` varchar(100) NOT NULL,
  `i1` int(11) NOT NULL,
  `i2` int(11) NOT NULL,
  `i3` int(11) NOT NULL,
  `i4` int(11) NOT NULL,
  `i5` int(11) NOT NULL,
  `dtcreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `appdata`
--
DELIMITER $$
CREATE TRIGGER `t_appdata` BEFORE INSERT ON `appdata`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `apptext`
--

CREATE TABLE IF NOT EXISTS `apptext` (
  `pkid` varchar(40) NOT NULL,
  `fkapp` varchar(40) NOT NULL,
  `fktenant` varchar(40) NOT NULL,
  `fkxref` varchar(40) NOT NULL,
  `t1` text NOT NULL,
  `vc1` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `apptext`
--
DELIMITER $$
CREATE TRIGGER `t_apptext` BEFORE INSERT ON `apptext`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_token`
--

CREATE TABLE IF NOT EXISTS `auth_token` (
  `pkid` varchar(40) NOT NULL,
  `selector` char(12) NOT NULL,
  `token` char(64) NOT NULL,
  `userid` varchar(40) NOT NULL,
  `dtlogin` datetime NOT NULL,
  `expires` datetime NOT NULL,
  `ipaddr` varchar(15) NOT NULL,
  `loc` varchar(128) NOT NULL,
  `useragent` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_token`
--


--
-- Triggers `auth_token`
--
DELIMITER $$
CREATE TRIGGER `t_auth_token` BEFORE INSERT ON `auth_token`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `collector`
--

CREATE TABLE IF NOT EXISTS `collector` (
  `pkid` varchar(40) NOT NULL,
  `realcollector` int(11) NOT NULL DEFAULT '0',
  `fktenant` varchar(40) NOT NULL,
  `fkcustomer` varchar(40) NOT NULL,
  `description` varchar(200) NOT NULL,
  `colid` varchar(80) NOT NULL,
  `colauth` int(11) NOT NULL DEFAULT '0',
  `colauthuid` varchar(40) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastupdateip` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collector`
--


--
-- Triggers `collector`
--
DELIMITER $$
CREATE TRIGGER `t_collector` BEFORE INSERT ON `collector`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `collectorelementmap`
--

CREATE TABLE IF NOT EXISTS `collectorelementmap` (
  `id` int(11) NOT NULL,
  `fkcollector` varchar(40) NOT NULL,
  `fkelement` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collectorelementmap`
--


-- --------------------------------------------------------

--
-- Table structure for table `controller`
--

CREATE TABLE IF NOT EXISTS `controller` (
  `pkid` varchar(40) NOT NULL,
  `fkTenant` varchar(40) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lanip` varchar(15) NOT NULL,
  `refDeviceModel` int(11) NOT NULL,
  `lastupdate` int(11) NOT NULL,
  `needsupdate` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `controller`
--


--
-- Triggers `controller`
--
DELIMITER $$
CREATE TRIGGER `t_controllers` BEFORE INSERT ON `controller`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `pkid` varchar(40) NOT NULL,
  `description` varchar(100) NOT NULL,
  `custnum` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--


--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `t_customer` BEFORE INSERT ON `customer`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dbaction`
--

CREATE TABLE IF NOT EXISTS `dbaction` (
  `pkid` varchar(40) NOT NULL,
  `query` varchar(1024) NOT NULL,
  `description` varchar(100) NOT NULL,
  `unk2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbaction`
--

INSERT INTO `dbaction` (`pkid`, `query`, `description`, `unk2`) VALUES
('6b3cfeb3-d84a-11e5-8dec-02549f4e45a9', 'SELECT elements.pkid FROM elements WHERE pkid NOT IN (SELECT fkelement FROM taskqueue) AND pkid IN (SELECT fkelement FROM collectorelementmap INNER JOIN collector ON (collectorelementmap.fkcollector = collector.pkid) WHERE collector.realcollector = 1) AND (ser2net = 0)', 'Take relevant elements not already in taskqueue and add them', 0),
('c02e0208-d84a-11e5-8dec-02549f4e45a9', 'SELECT elements.pkid FROM elements INNER JOIN taskqueue ON (taskqueue.fkelement = elements.pkid) WHERE elements.pkid IN (SELECT fkelement FROM taskqueue) AND elements.pkid IN (SELECT fkelement FROM collectorelementmap INNER JOIN collector ON (collectorelementmap.fkcollector = collector.pkid) WHERE collector.realcollector = 1) AND CURRENT_TIMESTAMP > DATE_ADD(taskqueue.endtime, INTERVAL +1 DAY)', 'Update elements in taskqueue that have aged > 1 day', 0);

--
-- Triggers `dbaction`
--
DELIMITER $$
CREATE TRIGGER `t_trigger` BEFORE INSERT ON `dbaction`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `devicetags`
--

CREATE TABLE IF NOT EXISTS `devicetags` (
  `pkid` varchar(40) NOT NULL,
  `fkTenant` varchar(40) NOT NULL,
  `fkelement` varchar(40) NOT NULL,
  `devtype` int(11) NOT NULL,
  `tag` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devicetags`
--


--
-- Triggers `devicetags`
--
DELIMITER $$
CREATE TRIGGER `t_devicetags` BEFORE INSERT ON `devicetags`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `elementports`
--

CREATE TABLE IF NOT EXISTS `elementports` (
  `pkid` varchar(40) NOT NULL,
  `fkTenant` varchar(40) NOT NULL,
  `fkelement` varchar(40) NOT NULL,
  `num` int(11) NOT NULL,
  `description` varchar(30) NOT NULL,
  `inttype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elementports`
--


--
-- Triggers `elementports`
--
DELIMITER $$
CREATE TRIGGER `t_elementports` BEFORE INSERT ON `elementports`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE IF NOT EXISTS `elements` (
  `pkid` varchar(40) NOT NULL,
  `fkTenant` varchar(40) NOT NULL,
  `refDeviceModel` int(11) NOT NULL DEFAULT '0',
  `NameOrIP` varchar(200) NOT NULL,
  `macaddress` varchar(17) NOT NULL,
  `serialnum` varchar(40) NOT NULL,
  `lanip` varchar(15) NOT NULL,
  `mgmttype` varchar(20) NOT NULL,
  `ser2net` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `lantype` int(11) NOT NULL DEFAULT '0',
  `dg` varchar(15) NOT NULL,
  `subnetmask` varchar(15) NOT NULL,
  `fkdgport` varchar(40) NOT NULL,
  `dgvlan` int(11) NOT NULL DEFAULT '0',
  `dns` varchar(15) NOT NULL,
  `dns2` varchar(15) NOT NULL,
  `wanip` varchar(15) NOT NULL,
  `wanfqdn` varchar(100) NOT NULL,
  `firmware` varchar(50) NOT NULL,
  `fkcontroller` varchar(40) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastupdateip` varchar(15) NOT NULL,
  `remconsole` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elements`
--


--
-- Triggers `elements`
--
DELIMITER $$
CREATE TRIGGER `t_elements` BEFORE INSERT ON `elements`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `familyfeaturemap`
--

CREATE TABLE IF NOT EXISTS `familyfeaturemap` (
  `id` int(11) NOT NULL,
  `fkdevicefamily` int(11) NOT NULL,
  `fkfeature` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `familyfeaturemap`
--

INSERT INTO `familyfeaturemap` (`id`, `fkdevicefamily`, `fkfeature`) VALUES
(1, 30, 12),
(2, 1, 8),
(3, 2, 8),
(4, 3, 8),
(5, 4, 8),
(6, 5, 8),
(7, 6, 8),
(8, 7, 8),
(9, 8, 8),
(10, 9, 9),
(11, 10, 9),
(12, 11, 9),
(13, 12, 9),
(14, 13, 9),
(15, 14, 9),
(16, 15, 9),
(17, 16, 10),
(18, 17, 10),
(19, 18, 10),
(20, 19, 10),
(21, 20, 10),
(22, 21, 11),
(23, 22, 11),
(24, 23, 11),
(25, 24, 12),
(26, 25, 12),
(27, 26, 12),
(28, 27, 12),
(29, 28, 12),
(30, 29, 12),
(31, 33, 14),
(32, 30, 12),
(33, 31, 12);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `pkid` varchar(40) NOT NULL,
  `fkTenant` varchar(40) NOT NULL,
  `fkelement` varchar(40) NOT NULL,
  `refdevicemodelslot` int(11) NOT NULL,
  `refDeviceModel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--


--
-- Triggers `modules`
--
DELIMITER $$
CREATE TRIGGER `t_modules` BEFORE INSERT ON `modules`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `taskqueue`
--

CREATE TABLE IF NOT EXISTS `taskqueue` (
  `pkid` varchar(40) NOT NULL,
  `description` varchar(80) NOT NULL,
  `fkapitask` varchar(40) NOT NULL,
  `qval1` varchar(200) NOT NULL,
  `qval2` varchar(200) NOT NULL,
  `qval3` varchar(200) NOT NULL,
  `fkelement` varchar(40) NOT NULL,
  `singleuse` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `result` text NOT NULL,
  `dtcreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taskqueue`
--


--
-- Triggers `taskqueue`
--
DELIMITER $$
CREATE TRIGGER `t_taskqueue` BEFORE INSERT ON `taskqueue`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE IF NOT EXISTS `tenant` (
  `pkid` varchar(40) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenant`
--


--
-- Triggers `tenant`
--
DELIMITER $$
CREATE TRIGGER `t_tenant` BEFORE INSERT ON `tenant`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tenantmap`
--

CREATE TABLE IF NOT EXISTS `tenantmap` (
  `id` int(11) NOT NULL,
  `fktenant` varchar(40) NOT NULL,
  `fkuser` varchar(40) NOT NULL,
  `fkcustomer` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenantmap`
--


-- --------------------------------------------------------

--
-- Table structure for table `typedevicecategory`
--

CREATE TABLE IF NOT EXISTS `typedevicecategory` (
  `id` int(11) NOT NULL,
  `morder` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `dtcreateduid` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typedevicecategory`
--

INSERT INTO `typedevicecategory` (`id`, `morder`, `name`, `dtcreated`, `dtcreateduid`) VALUES
(1, 2, 'Switches', '0000-00-00 00:00:00', ''),
(2, 3, 'Routers', '0000-00-00 00:00:00', ''),
(3, 4, 'Wireless', '0000-00-00 00:00:00', ''),
(4, 5, 'Security', '0000-00-00 00:00:00', ''),
(5, 6, 'Collaboration', '0000-00-00 00:00:00', ''),
(6, 7, 'Data Center / Virtualization', '0000-00-00 00:00:00', ''),
(7, 1, 'Enterprise Networking (General)', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `typedevicefamily`
--

CREATE TABLE IF NOT EXISTS `typedevicefamily` (
  `id` int(11) NOT NULL,
  `fkcategory` int(11) NOT NULL,
  `fkfunction` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `dtcreateduid` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typedevicefamily`
--

INSERT INTO `typedevicefamily` (`id`, `fkcategory`, `fkfunction`, `name`, `dtcreated`, `dtcreateduid`) VALUES
(1, 1, 1, 'Cisco Catalyst Switches', '0000-00-00 00:00:00', ''),
(2, 1, 1, 'Cisco Nexus Switches', '0000-00-00 00:00:00', ''),
(3, 1, 1, 'Cisco Meraki MS Switches', '0000-00-00 00:00:00', ''),
(4, 1, 1, 'Cisco Small Business Switches', '0000-00-00 00:00:00', ''),
(5, 1, 1, 'Cisco Industrial Ethernet Switches', '0000-00-00 00:00:00', ''),
(6, 1, 1, 'Cisco InfiniBand Switches\n', '0000-00-00 00:00:00', ''),
(7, 1, 1, 'Cisco Service Provider ME Switches', '0000-00-00 00:00:00', ''),
(8, 1, 1, 'Cisco ATM Switches (IGX/MGX)', '0000-00-00 00:00:00', ''),
(9, 2, 2, 'Cisco Integrated Services Routers', '0000-00-00 00:00:00', ''),
(10, 2, 2, 'Cisco Data Center Routers', '0000-00-00 00:00:00', ''),
(11, 2, 2, 'Cisco Industrial Routers', '0000-00-00 00:00:00', ''),
(12, 2, 2, 'Cisco SP Core Routers', '0000-00-00 00:00:00', ''),
(13, 2, 2, 'Cisco SP Edge Routers', '0000-00-00 00:00:00', ''),
(14, 2, 2, 'Cisco Small Business Routers', '0000-00-00 00:00:00', ''),
(15, 2, 2, 'Cisco Virtual Routers', '0000-00-00 00:00:00', ''),
(16, 4, 4, 'Cisco ASA Firewalls', '0000-00-00 00:00:00', ''),
(17, 4, 4, 'Cisco Meraki MX Firewalls', '0000-00-00 00:00:00', ''),
(18, 4, 4, 'Cisco Intrusion Prevention (SourceFIRE)', '0000-00-00 00:00:00', ''),
(19, 4, 4, 'Cisco Email Security', '0000-00-00 00:00:00', ''),
(20, 4, 4, 'Cisco Web Security', '0000-00-00 00:00:00', ''),
(21, 3, 3, 'Cisco Wireless Access Points', '0000-00-00 00:00:00', ''),
(22, 3, 3, 'Cisco Meraki MR Access Points', '0000-00-00 00:00:00', ''),
(23, 3, 3, 'Cisco Small Business Access Points', '0000-00-00 00:00:00', ''),
(24, 5, 5, 'Cisco Voice Gateways', '0000-00-00 00:00:00', ''),
(25, 5, 5, 'Cisco IP Phones', '0000-00-00 00:00:00', ''),
(26, 5, 5, 'Cisco Small Business IP Phones (SPA)', '0000-00-00 00:00:00', ''),
(27, 5, 5, 'Cisco TelePresence Video', '0000-00-00 00:00:00', ''),
(28, 5, 5, 'Cisco MultiParty Conferencing', '0000-00-00 00:00:00', ''),
(29, 5, 5, 'Cisco Digital Media Players', '0000-00-00 00:00:00', ''),
(30, 5, 8, 'Cisco Collaboration Applications ', '0000-00-00 00:00:00', ''),
(31, 5, 8, 'Cisco Collaboration Management', '0000-00-00 00:00:00', ''),
(32, 7, 8, 'Cisco Enterprise Networks Management', '0000-00-00 00:00:00', ''),
(33, 6, 6, 'Cisco Unified Computing System', '0000-00-00 00:00:00', ''),
(34, 6, 8, 'Cisco Application Centric Infrastructure (ACI)', '0000-00-00 00:00:00', ''),
(35, 6, 8, 'Cisco Data Center Management', '0000-00-00 00:00:00', ''),
(36, 6, 8, 'Hypervisor', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `typedevicemodel`
--

CREATE TABLE IF NOT EXISTS `typedevicemodel` (
  `id` int(11) NOT NULL,
  `fkseries` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `imagename` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typedevicemodel`
--

INSERT INTO `typedevicemodel` (`id`, `fkseries`, `description`, `imagename`) VALUES
(1, 10, 'WS-C3650-48PD', 'WS-C3650-48PD.gif'),
(2, 69, 'CISCO2921/K9', 'CISCO2921.jpg'),
(3, 155, 'APIC M1 Cluster', ''),
(4, 159, 'VMware vSphere', ''),
(5, 161, 'CUCM', ''),
(6, 162, 'UCS-E160D-M2/K9', 'ucs-e160d-m2.jpg'),
(7, 68, 'CISCO3825/K9', 'CISCO3825.jpg'),
(8, 68, 'CISCO3845/K9', 'CISCO3845.jpg'),
(11, 163, 'UCSC-C220-M3S', ''),
(12, 155, 'APIC', ''),
(13, 28, 'N9K-C9396PX', ''),
(14, 159, 'VMware vCenter', ''),
(15, 9, 'WS-C3750X-48P', ''),
(16, 12, 'WS-C3560X-48P', ''),
(17, 167, 'UCCX', 'Contact Center Express.png');

-- --------------------------------------------------------

--
-- Table structure for table `typedevicemodelsearch`
--

CREATE TABLE IF NOT EXISTS `typedevicemodelsearch` (
  `pkid` varchar(40) NOT NULL,
  `searchstring` varchar(100) NOT NULL,
  `refdevicemodel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typedevicemodelsearch`
--

INSERT INTO `typedevicemodelsearch` (`pkid`, `searchstring`, `refdevicemodel`) VALUES
('0f23a5c4-b98e-11e5-9d09-02549f4e45a9', '2921', 2),
('280d612c-c5e4-11e5-9d09-02549f4e45a9', 'vcenter', 14),
('59443c9e-b990-11e5-9d09-02549f4e45a9', '3825', 7),
('68835493-c535-11e5-9d09-02549f4e45a9', 'APIC', 12),
('6907961d-c3f0-11e5-9d09-02549f4e45a9', 'CUCM', 5),
('98571ea0-b990-11e5-9d09-02549f4e45a9', '3845', 8),
('d56a42e2-c4a0-11e5-9d09-02549f4e45a9', 'C220', 11),
('ee000354-c547-11e5-9d09-02549f4e45a9', 'C9396PX', 13);

--
-- Triggers `typedevicemodelsearch`
--
DELIMITER $$
CREATE TRIGGER `t_typedevicemodelsearch` BEFORE INSERT ON `typedevicemodelsearch`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `typedevicemodelslot`
--

CREATE TABLE IF NOT EXISTS `typedevicemodelslot` (
  `ID` int(11) NOT NULL,
  `refDeviceModel` int(11) NOT NULL,
  `toppx` int(11) NOT NULL,
  `leftpx` int(11) NOT NULL,
  `description` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typedevicemodelslot`
--

INSERT INTO `typedevicemodelslot` (`ID`, `refDeviceModel`, `toppx`, `leftpx`, `description`) VALUES
(1, 2, 70, 3, 'Service Module Slot');

-- --------------------------------------------------------

--
-- Table structure for table `typedeviceseries`
--

CREATE TABLE IF NOT EXISTS `typedeviceseries` (
  `id` int(11) NOT NULL,
  `fkfamily` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `dtcreateduid` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typedeviceseries`
--

INSERT INTO `typedeviceseries` (`id`, `fkfamily`, `name`, `dtcreated`, `dtcreateduid`) VALUES
(1, 1, 'Cisco Catalyst Blade Switch for Dell', '0000-00-00 00:00:00', ''),
(2, 1, 'Cisco Catalyst Blade Switch for FSC', '0000-00-00 00:00:00', ''),
(3, 1, 'Cisco Catalyst Blade Switch for HP', '0000-00-00 00:00:00', ''),
(4, 2, 'Cisco Nexus 4000 Series Switch', '0000-00-00 00:00:00', ''),
(5, 1, 'Cisco Catalyst Switch Module for IBM', '0000-00-00 00:00:00', ''),
(6, 1, 'Cisco Catalyst 4500 Series', '0000-00-00 00:00:00', ''),
(7, 1, 'Cisco Catalyst 3850 Series', '0000-00-00 00:00:00', ''),
(8, 1, 'Cisco Catalyst 3750 Series', '0000-00-00 00:00:00', ''),
(9, 1, 'Cisco Catalyst 3750-X Series', '0000-00-00 00:00:00', ''),
(10, 1, 'Cisco Catalyst 3650 Series', '0000-00-00 00:00:00', ''),
(11, 1, 'Cisco Catalyst 3560 Series', '0000-00-00 00:00:00', ''),
(12, 1, 'Cisco Catalyst 3560-X Series', '0000-00-00 00:00:00', ''),
(13, 1, 'Cisco Catalyst 2960-Plus Series', '0000-00-00 00:00:00', ''),
(14, 1, 'Cisco Catalyst 2960-S Series', '0000-00-00 00:00:00', ''),
(15, 1, 'Cisco Catalyst 2960-SF Series', '0000-00-00 00:00:00', ''),
(16, 1, 'Cisco Catalyst 2960-X Series', '0000-00-00 00:00:00', ''),
(17, 29, 'Cisco Edge Series', '0000-00-00 00:00:00', ''),
(18, 3, 'Cisco Meraki MS Series', '0000-00-00 00:00:00', ''),
(19, 1, 'Cisco Catalyst 3560-C Series', '0000-00-00 00:00:00', ''),
(20, 1, 'Cisco Catalyst 3560-CX Series', '0000-00-00 00:00:00', ''),
(21, 1, 'Cisco Catalyst 2960-C Series', '0000-00-00 00:00:00', ''),
(22, 1, 'Cisco Catalyst 2960-CX Series', '0000-00-00 00:00:00', ''),
(23, 1, 'Cisco Catalyst 6800 Series', '0000-00-00 00:00:00', ''),
(24, 1, 'Cisco Catalyst 6500 Series', '0000-00-00 00:00:00', ''),
(25, 1, 'Cisco Catalyst 4900 Series', '0000-00-00 00:00:00', ''),
(26, 1, 'Cisco Catalyst 4500-X Series', '0000-00-00 00:00:00', ''),
(27, 2, 'Cisco Nexus 7000 Series', '0000-00-00 00:00:00', ''),
(28, 2, 'Cisco Nexus 9000 Series', '0000-00-00 00:00:00', ''),
(29, 2, 'Cisco Nexus 6000 Series', '0000-00-00 00:00:00', ''),
(30, 2, 'Cisco Nexus 5000 Series', '0000-00-00 00:00:00', ''),
(31, 2, 'Cisco Nexus 3000 Series', '0000-00-00 00:00:00', ''),
(32, 2, 'Cisco Nexus 2000 Series', '0000-00-00 00:00:00', ''),
(33, 5, 'Cisco Connected Grid 2500 Series', '0000-00-00 00:00:00', ''),
(34, 5, 'Cisco Embedded Service 2020 Series', '0000-00-00 00:00:00', ''),
(35, 5, 'Cisco Industrial Ethernet 5000 Series', '0000-00-00 00:00:00', ''),
(36, 5, 'Cisco Industrial Ethernet 4000 Series', '0000-00-00 00:00:00', ''),
(37, 5, 'Cisco Industrial Ethernet 3010 Series', '0000-00-00 00:00:00', ''),
(38, 5, 'Cisco Industrial Ethernet 3000 Series', '0000-00-00 00:00:00', ''),
(39, 5, 'Cisco Industrial Ethernet 2000 Series', '0000-00-00 00:00:00', ''),
(40, 5, 'Cisco Industrial Ethernet 2000U Series', '0000-00-00 00:00:00', ''),
(41, 6, 'Cisco SFS 7000 Series', '0000-00-00 00:00:00', ''),
(42, 6, 'Cisco SFS 3500 Series', '0000-00-00 00:00:00', ''),
(43, 6, 'Cisco SFS 3000 Series', '0000-00-00 00:00:00', ''),
(44, 4, 'Cisco Small Business ESW2 Series', '0000-00-00 00:00:00', ''),
(45, 4, 'Cisco Small Business 500 Series', '0000-00-00 00:00:00', ''),
(46, 4, 'Cisco Small Business 300 Series', '0000-00-00 00:00:00', ''),
(47, 4, 'Cisco Small Business 220 Series', '0000-00-00 00:00:00', ''),
(48, 4, 'Cisco Small Business 200 Series', '0000-00-00 00:00:00', ''),
(49, 7, 'Cisco ME 4900 Series', '0000-00-00 00:00:00', ''),
(50, 7, 'Cisco ME 3800X Series', '0000-00-00 00:00:00', ''),
(51, 7, 'Cisco ME 3750 Series', '0000-00-00 00:00:00', ''),
(52, 7, 'Cisco ME 4600 Series', '0000-00-00 00:00:00', ''),
(53, 7, 'Cisco ME 3600X Series', '0000-00-00 00:00:00', ''),
(54, 7, 'Cisco ME 3400 Series', '0000-00-00 00:00:00', ''),
(55, 7, 'Cisco ME 3400E Series', '0000-00-00 00:00:00', ''),
(56, 7, 'Cisco ME 1200 Series', '0000-00-00 00:00:00', ''),
(57, 4, 'Cisco Small Business SPS Series', '0000-00-00 00:00:00', ''),
(58, 8, 'Cisco IGX 8400 Series', '0000-00-00 00:00:00', ''),
(59, 8, 'Cisco MGX 8900 Series', '0000-00-00 00:00:00', ''),
(60, 8, 'Cisco MGX 8850 Series', '0000-00-00 00:00:00', ''),
(61, 8, 'Cisco MGX 8800 Series', '0000-00-00 00:00:00', ''),
(62, 8, 'Cisco MGX 8250 Series', '0000-00-00 00:00:00', ''),
(63, 8, 'Cisco MGX 8230 Series', '0000-00-00 00:00:00', ''),
(64, 8, 'Cisco MGX 8200 Series', '0000-00-00 00:00:00', ''),
(65, 6, 'Cisco SFS for Dell', '0000-00-00 00:00:00', ''),
(66, 9, 'Cisco 4300 Series ISR', '0000-00-00 00:00:00', ''),
(67, 9, 'Cisco 3900 Series ISR', '0000-00-00 00:00:00', ''),
(68, 9, 'Cisco 3800 Series ISR', '0000-00-00 00:00:00', ''),
(69, 9, 'Cisco 2900 Series ISR', '0000-00-00 00:00:00', ''),
(70, 9, 'Cisco 2800 Series ISR', '0000-00-00 00:00:00', ''),
(71, 9, 'Cisco 1900 Series ISR', '0000-00-00 00:00:00', ''),
(72, 9, 'Cisco 1800 Series ISR', '0000-00-00 00:00:00', ''),
(73, 9, 'Cisco 800 Series', '0000-00-00 00:00:00', ''),
(74, 10, 'Cisco 7600 Series', '0000-00-00 00:00:00', ''),
(75, 10, 'Cisco 7200 Series', '0000-00-00 00:00:00', ''),
(76, 10, 'Cisco ASR 1000 Series', '0000-00-00 00:00:00', ''),
(77, 11, 'Cisco CGR 2000 Series', '0000-00-00 00:00:00', ''),
(78, 11, 'Cisco 1000 Series CGR', '0000-00-00 00:00:00', ''),
(79, 11, 'Cisco 900 Series IR', '0000-00-00 00:00:00', ''),
(80, 11, 'Cisco 800 Series IISR', '0000-00-00 00:00:00', ''),
(81, 11, 'Cisco 500 Series WPANIR', '0000-00-00 00:00:00', ''),
(82, 12, 'Cisco 5900 Series ESR', '0000-00-00 00:00:00', ''),
(83, 12, 'Cisco MWR 2900 Series', '0000-00-00 00:00:00', ''),
(84, 12, 'Cisco MWR 1900 Series', '0000-00-00 00:00:00', ''),
(85, 13, 'Cisco 12000 Series', '0000-00-00 00:00:00', ''),
(86, 13, 'Cisco 7500 Series', '0000-00-00 00:00:00', ''),
(87, 13, 'Cisco 7300 Series', '0000-00-00 00:00:00', ''),
(88, 13, 'Cisco ASR 9000 Series', '0000-00-00 00:00:00', ''),
(89, 13, 'Cisco ASR 920 Series', '0000-00-00 00:00:00', ''),
(90, 13, 'Cisco ASR 901 Series', '0000-00-00 00:00:00', ''),
(91, 13, 'Cisco ASR 901S Series', '0000-00-00 00:00:00', ''),
(92, 13, 'Cisco ASR 900 Series', '0000-00-00 00:00:00', ''),
(93, 13, 'Cisco XR 12000 Series', '0000-00-00 00:00:00', ''),
(94, 14, 'Cisco Small Business RV Series', '0000-00-00 00:00:00', ''),
(95, 15, 'Cisco CSR 1000V Series', '0000-00-00 00:00:00', ''),
(96, 17, 'Cisco Meraki MX Series', '0000-00-00 00:00:00', ''),
(97, 16, 'Cisco ASA 5500 Series', '0000-00-00 00:00:00', ''),
(98, 16, 'Cisco ASA 5500-X Series', '0000-00-00 00:00:00', ''),
(99, 16, 'Cisco ASAv Series', '0000-00-00 00:00:00', ''),
(100, 18, 'Cisco FirePOWER 8000 Series', '0000-00-00 00:00:00', ''),
(101, 18, 'Cisco FirePOWER 7000 Series', '0000-00-00 00:00:00', ''),
(102, 19, 'Cisco ESA', '0000-00-00 00:00:00', ''),
(103, 20, 'Cisco WSA', '0000-00-00 00:00:00', ''),
(104, 21, 'Cisco Aironet 3700 Series', '0000-00-00 00:00:00', ''),
(105, 21, 'Cisco Aironet 3600 Series', '0000-00-00 00:00:00', ''),
(106, 21, 'Cisco Aironet 3500 Series', '0000-00-00 00:00:00', ''),
(107, 21, 'Cisco Aironet 2700 Series', '0000-00-00 00:00:00', ''),
(108, 21, 'Cisco Aironet 2600 Series', '0000-00-00 00:00:00', ''),
(109, 21, 'Cisco Aironet 1850 Series', '0000-00-00 00:00:00', ''),
(110, 21, 'Cisco Aironet 1830 Series', '0000-00-00 00:00:00', ''),
(111, 21, 'Cisco Aironet 1700 Series', '0000-00-00 00:00:00', ''),
(112, 21, 'Cisco Aironet 1600 Series', '0000-00-00 00:00:00', ''),
(113, 21, 'Cisco Aironet 1200 Series', '0000-00-00 00:00:00', ''),
(114, 21, 'Cisco Aironet 1140 Series', '0000-00-00 00:00:00', ''),
(115, 21, 'Cisco Aironet 1130 AG Series', '0000-00-00 00:00:00', ''),
(116, 21, 'Cisco Aironet 1040 Series', '0000-00-00 00:00:00', ''),
(117, 21, 'Cisco Aironet 700 Series', '0000-00-00 00:00:00', ''),
(118, 21, 'Cisco 700W Series', '0000-00-00 00:00:00', ''),
(119, 21, 'Cisco 600 Series OEAP', '0000-00-00 00:00:00', ''),
(120, 22, 'Cisco Meraki MR Series', '0000-00-00 00:00:00', ''),
(121, 23, 'Cisco Small Business 500 Series', '0000-00-00 00:00:00', ''),
(122, 23, 'Cisco Small Business 300 Series', '0000-00-00 00:00:00', ''),
(123, 23, 'Cisco Small Business 100 Series', '0000-00-00 00:00:00', ''),
(124, 23, 'Cisco Small Business AP500 Series', '0000-00-00 00:00:00', ''),
(125, 21, 'Cisco Aironet 1570 Series', '0000-00-00 00:00:00', ''),
(126, 21, 'Cisco Aironet 1550 Series', '0000-00-00 00:00:00', ''),
(127, 21, 'Cisco Aironet 1530 Series', '0000-00-00 00:00:00', ''),
(128, 21, 'Cisco Industrial Wireless 3700 Series', '0000-00-00 00:00:00', ''),
(129, 24, 'Cisco AS5400 Series', '0000-00-00 00:00:00', ''),
(130, 24, 'Cisco AS5300 Series', '0000-00-00 00:00:00', ''),
(131, 24, 'Cisco ATA 190 Series', '0000-00-00 00:00:00', ''),
(132, 24, 'Cisco ATA 180 Series', '0000-00-00 00:00:00', ''),
(133, 24, 'Cisco IAD2400 Series', '0000-00-00 00:00:00', ''),
(134, 25, 'Cisco IP Phone 8800 Series', '0000-00-00 00:00:00', ''),
(135, 25, 'Cisco IP Phone 7800 Series', '0000-00-00 00:00:00', ''),
(136, 26, 'Cisco Small Business SPA500 Series', '0000-00-00 00:00:00', ''),
(137, 26, 'Cisco Small Business SPA300 Series', '0000-00-00 00:00:00', ''),
(138, 25, 'Cisco IP Phone 8900 Series', '0000-00-00 00:00:00', ''),
(139, 25, 'Cisco IP Phone 7900 Series', '0000-00-00 00:00:00', ''),
(140, 25, 'Cisco IP Phone 6900 Series', '0000-00-00 00:00:00', ''),
(141, 25, 'Cisco IP Phone 9900 Series', '0000-00-00 00:00:00', ''),
(142, 25, 'Cisco IP Phone 3900 Series', '0000-00-00 00:00:00', ''),
(143, 27, 'Cisco TelePresence IX5000 Series', '0000-00-00 00:00:00', ''),
(144, 27, 'Cisco TelePresence TX9000 Series', '0000-00-00 00:00:00', ''),
(145, 27, 'Cisco TelePresence TX1300 Series', '0000-00-00 00:00:00', ''),
(146, 27, 'Cisco TelePresence SX Series', '0000-00-00 00:00:00', ''),
(147, 27, 'Cisco TelePresence C Series', '0000-00-00 00:00:00', ''),
(148, 27, 'Cisco DX Series', '0000-00-00 00:00:00', ''),
(149, 27, 'Cisco TelePresence System 500 Series', '0000-00-00 00:00:00', ''),
(150, 27, 'Cisco TelePresence System EX Series', '0000-00-00 00:00:00', ''),
(151, 28, 'Cisco TelePresence MCU 5300 Series', '0000-00-00 00:00:00', ''),
(152, 28, 'Cisco TelePresence MCU 4501 Series', '0000-00-00 00:00:00', ''),
(153, 28, 'Cisco TelePresence MCU 4500 Series', '0000-00-00 00:00:00', ''),
(154, 28, 'Cisco TelePresence MSE 8000 Series', '0000-00-00 00:00:00', ''),
(155, 34, 'Cisco APIC', '0000-00-00 00:00:00', ''),
(156, 32, 'Prime Infrastructure', '0000-00-00 00:00:00', ''),
(157, 32, 'APIC-EM', '0000-00-00 00:00:00', ''),
(158, 31, 'Prime Collaboration', '0000-00-00 00:00:00', ''),
(159, 36, 'vSphere', '0000-00-00 00:00:00', ''),
(160, 35, 'Prime DCNM', '0000-00-00 00:00:00', ''),
(161, 30, 'Communications Manager (CUCM)', '0000-00-00 00:00:00', ''),
(162, 33, 'UCS E-Series', '0000-00-00 00:00:00', ''),
(163, 33, 'UCS C-Series', '0000-00-00 00:00:00', ''),
(164, 9, 'Cisco 4400 Series ISR', '0000-00-00 00:00:00', ''),
(165, 33, 'UCS B-Series', '0000-00-00 00:00:00', ''),
(167, 30, 'Unified Contact Center Express (UCCX)', '2016-03-18 22:53:40', '2b67b036-b693-11e5-8b39-296fb12cc761');

-- --------------------------------------------------------

--
-- Table structure for table `typefeature`
--

CREATE TABLE IF NOT EXISTS `typefeature` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typefeature`
--

INSERT INTO `typefeature` (`ID`, `Name`, `Description`) VALUES
(8, 'SUPPORTS_SWITCHING', 'Device has switching features.'),
(9, 'SUPPORTS_ROUTING', 'Device has routing features.'),
(10, 'SUPPORTS_SECURITY', 'Device has security features.'),
(11, 'SUPPORTS_WIRELESS', 'Device has wireless features.'),
(12, 'SUPPORTS_VOICE', 'Device has voice features.'),
(13, 'SUPPORTS_STORAGE', 'Device has storage features.'),
(14, 'SUPPORTS_SERVER', 'Device has server features.');

-- --------------------------------------------------------

--
-- Table structure for table `typefunction`
--

CREATE TABLE IF NOT EXISTS `typefunction` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `LabelSingular` varchar(32) NOT NULL,
  `LabelPlural` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typefunction`
--

INSERT INTO `typefunction` (`ID`, `Name`, `Description`, `LabelSingular`, `LabelPlural`) VALUES
(1, 'FUNC_SWITCH', 'Device is primarily a switch.', 'Switch', 'Switches'),
(2, 'FUNC_ROUTER', 'Device is primarily a router.', 'Router', 'Routers'),
(3, 'FUNC_WIRELESS', 'Device is primarily a wireless AP.', 'Wireless Device', 'Wireless Devices'),
(4, 'FUNC_SECURITY', 'Device is primarily a security device.', 'Security Device', 'Security Devices'),
(5, 'FUNC_COLLAB', 'Device is primarily a collaboration device.', 'Collab Device', 'Collab Devices'),
(6, 'FUNC_SERVER', 'Device is primarily a server.', 'Server', 'Servers'),
(7, 'FUNC_STORAGE', 'Device is primarily a storage system.', 'Storage System', 'Storage Systems'),
(8, 'FUNC_CONTROLLER', 'Device is primarily a controller', 'Controller / Manager', 'Controllers / Managers');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `pkid` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pwhash` varchar(254) NOT NULL,
  `currenttenant` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--


--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `t_user` BEFORE INSERT ON `user`
 FOR EACH ROW SET new.pkid = uuid()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `usercustomermap`
--

CREATE TABLE IF NOT EXISTS `usercustomermap` (
  `id` int(11) NOT NULL,
  `fkuser` varchar(40) NOT NULL,
  `fkcustomer` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usercustomermap`
--


-- --------------------------------------------------------

--
-- Table structure for table `userlogon`
--

CREATE TABLE IF NOT EXISTS `userlogon` (
  `id` int(11) NOT NULL,
  `fkuserid` varchar(40) NOT NULL,
  `ipaddr` varchar(15) NOT NULL,
  `loc` varchar(128) NOT NULL,
  `dtlogin` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlogon`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `apicallstaskgroupsmap`
--
ALTER TABLE `apicallstaskgroupsmap`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `apicallstasksmap`
--
ALTER TABLE `apicallstasksmap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apifamilydeviceseriesmap`
--
ALTER TABLE `apifamilydeviceseriesmap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_calls`
--
ALTER TABLE `api_calls`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `api_family`
--
ALTER TABLE `api_family`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `api_taskgroups`
--
ALTER TABLE `api_taskgroups`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `api_tasks`
--
ALTER TABLE `api_tasks`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `appblob`
--
ALTER TABLE `appblob`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `appdata`
--
ALTER TABLE `appdata`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `apptext`
--
ALTER TABLE `apptext`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `auth_token`
--
ALTER TABLE `auth_token`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `collector`
--
ALTER TABLE `collector`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `collectorelementmap`
--
ALTER TABLE `collectorelementmap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `controller`
--
ALTER TABLE `controller`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `dbaction`
--
ALTER TABLE `dbaction`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `devicetags`
--
ALTER TABLE `devicetags`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `elementports`
--
ALTER TABLE `elementports`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `familyfeaturemap`
--
ALTER TABLE `familyfeaturemap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `taskqueue`
--
ALTER TABLE `taskqueue`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `tenantmap`
--
ALTER TABLE `tenantmap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typedevicecategory`
--
ALTER TABLE `typedevicecategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typedevicefamily`
--
ALTER TABLE `typedevicefamily`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typedevicemodel`
--
ALTER TABLE `typedevicemodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typedevicemodelsearch`
--
ALTER TABLE `typedevicemodelsearch`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `typedevicemodelslot`
--
ALTER TABLE `typedevicemodelslot`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `typedeviceseries`
--
ALTER TABLE `typedeviceseries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typefeature`
--
ALTER TABLE `typefeature`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `typefunction`
--
ALTER TABLE `typefunction`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`pkid`);

--
-- Indexes for table `usercustomermap`
--
ALTER TABLE `usercustomermap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlogon`
--
ALTER TABLE `userlogon`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apicallstasksmap`
--
ALTER TABLE `apicallstasksmap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `apifamilydeviceseriesmap`
--
ALTER TABLE `apifamilydeviceseriesmap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `collectorelementmap`
--
ALTER TABLE `collectorelementmap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `familyfeaturemap`
--
ALTER TABLE `familyfeaturemap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `tenantmap`
--
ALTER TABLE `tenantmap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `typedevicecategory`
--
ALTER TABLE `typedevicecategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `typedevicefamily`
--
ALTER TABLE `typedevicefamily`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `typedevicemodel`
--
ALTER TABLE `typedevicemodel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `typedevicemodelslot`
--
ALTER TABLE `typedevicemodelslot`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `typedeviceseries`
--
ALTER TABLE `typedeviceseries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=168;
--
-- AUTO_INCREMENT for table `typefeature`
--
ALTER TABLE `typefeature`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `typefunction`
--
ALTER TABLE `typefunction`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `usercustomermap`
--
ALTER TABLE `usercustomermap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `userlogon`
--
ALTER TABLE `userlogon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
