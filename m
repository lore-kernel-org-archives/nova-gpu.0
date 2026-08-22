Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F3230F803
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363749; cv=fail; b=IezuKsVibDrX4uqdIIa7dUFW2F4aNZP9rlvPan3/20askDqZsf2rWMKO20frvC+NWjPUSeeLL/vR/drdUqvlz2n9Zw/ZoAFJuyDph7RHMGY64itHD3cN6DnWs3eIoQ6yEezhGHuBEamcwEuLoreLfWoU1jQqZYwZXtB5eTXjepc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363749; c=relaxed/simple;
	bh=v91OLsxVwGnx5m1evNjGD8E1BUMB6KYK8zZ90+Oyheo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=svvLXCKD6eLANZ7v4TVaWfSu9hNjmcJPrgrR7KckgGY778kc63CsllEA+xQgQdiBy4QKMtuP7d27Pq9N5FPikOxXnujzTcKDp/KIYY/+vvy+9c8AXEsWQTawuMWheh+OBJbLCvrSCQGQnKK4zhzplBgJ6qtsT7zmzbM0HuP+kK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E7dyw0sf; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E7dyw0sf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbbQaajOPD3S9K08P9VoRNvDhFxVyYXYseYZX56I7tUSnzyW386o/WkiZCMUcuInd11Cv18CfLw5ojzvN4wWQlMEJipF4N9gyzGpNAvuCSDk2WipbYa1+lmepiyL80PSMoGNFfxghtER8TSTqm84n4xopcrSvacg8V3vNvZQdnG25PwXFXIQsJuLU/qU+aLGdA1ztHG/u8Ut3w2m/A0c7UZuaZ7qz+saruXUuOOBcB3NAW87hK5KazgXxPc6a5BtubMrACRA39PIPaq8Ohzdnw4yVdVxTnf7YRmcCxs3vtouZw1Iz9LQQoZ4U6G+VpXFd/v56VtYuXhryihenqPtMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPrIPS7IAFS8D/jZcXG1+YJAbzoVLJlYfcA+BHwQtbQ=;
 b=VhhCbahzBkd/TF2XDyxg5qJHx28HW+YRUlPpIJRQbd92xAnZYS96dCnGSH3LgLa+kPRJLi1f553ukD+gg7GqMUgZyCszLn36rN8dDztbgGjHYbmlMTMlJCNVfIo+Omt8ihuoeEJw4THAVIqBaOkwzu8cC21jVodn+0nQYoHLFDHjbIYu//NBoqggUjiVvKUm4Ly8teuQQVstmS7OsVGBFGwn7Cq90k5DazGyyCSurZNxfPq5m/abtI5EJ5HKGuRcmIrVG43wvZFWjlZHWakh8MoKhGARnVXTYW5YPeQXayXwrJRqe2P7CVfe4EVhNZBqjvlF4Fo+GX428a9iI+alBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPrIPS7IAFS8D/jZcXG1+YJAbzoVLJlYfcA+BHwQtbQ=;
 b=E7dyw0sfBFmWM9d6N8p372S4+aPbHBrs+Zbnq7Dvfip84wpDs+Lhbs/t97p7s3bu8b1VaDTRW2gdWKbAXyjASNBC2QN/abNsv8jbzc9swpUvZABB1BY9gUqcOU6izADd/SCI5QPqRkcQmTPXYaF9ZngpccKYhckoadFTi8+E9ZZV2QF0qIUXRoFhi22FhRfJDc/4YYZSuPfxCG7WCIwH0c/A9FszHEDd3tAjf7bm3EESgVm4C/D6Pskc7J9vBk3UNDJ96z1s1ZS3rQ7Y/RNocfVWfpi9dZ88gylzNg4avZx3ka/U3sxVXE4evV8MUAtBZLfHQHN7kbHaKKwf17dmUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:42 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 15/31] gpu: nova-core: add GMC API message types
Date: Fri, 21 Aug 2026 18:54:32 -0700
Message-ID: <20260822015448.238214-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0367.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e66e29-6d00-44f4-700b-08defff078d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	r4JMyr+diXqhAH47TBTIgW40kr86YFnG25cMt4Pa32Laq5t74LwYU1Ae89777oLEJB0ZHe36EjuMUwLV9nSPGXZtLL9tgvz3WtD5fRjN7Js5Lc0CwToV2Sm/IIUm3xRSeJOrfuJqxHk2F9S8QzR6+fyq9CVL5dOeZmyVtFxCnnlI/wbLwZlSMKegeNJyxguOl/8CucOx77yT/dTVVsXkKL9GAa59zi7I43c7jsq3x5A57tPtBLpzLRdtWT6cuBRny6qyg3+XmQq+U9TMNIgjoMPkf0MOxpJdo6l/Zql38ITxiwnM+FvzbTqz2egMQe4zewQ0JfS8hQeAulnIMPK7HgwXnb+MU29IiI6rDhhFHjLFqFXaAeVVBZAfPWvExf3EBhddcl48zqX00fYqKkUIKER8tTzoqV8+Gn/ZGrwOYJ+ICUu0LAsAOCRaTSh/FiU7yPt7WmBPvOsai01lKvGEOPjIZWnaDzoPrylo8fWgTE5UTh2yD5Y6hcYMU0mnHGNGfTNXWkzTuyPTNhsGAAARJ7/jAizOgBB512YI3j6/4euY7SQf1ry4Wr/XEufPhqpqRV55gD+5EDh6NSw3wkQuVRdhfom5S5hl9iLvqTOQsZwiiJbn6ms5qwDmqQdYjpZudnplOEGeKfgcaAgBjSX4xlC9s3iHOoHg055EteYJ10I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gVpsCS1mhEYZQWjpDD3Y8tlRvRmMOJaJBr/eLoEVaCqEfkolau1tywgW/UcJ?=
 =?us-ascii?Q?9HMLJuKCQC1KcMudx/yRLDkrSoUi2wS+BRgXe/Ug1mEyYMSkm2xjxLX5drm3?=
 =?us-ascii?Q?BR3MQ+hAE5nU/2SHURNyuN/o5F19pqDIVbdzZ3Kw6IM530Nc1ecbLn/VSonf?=
 =?us-ascii?Q?s54ji2k+HrAj+Uh5XGbHYV7vel4E5pco+g06uHySfdZS2r5CEjl+ZE8AsAFf?=
 =?us-ascii?Q?1HP6OgnzAj6WEuahRjCuLLqBnBcGQKMexj8GxhJR4XAQgHWnd9h7pbs5ObJP?=
 =?us-ascii?Q?D6iIjDr86aliF82PdHhDyxm+2HbyTMkrhQVLGyGne3usckD/AhKui79bbE9v?=
 =?us-ascii?Q?O8uakBgyvSIwlFqvpeyyxVn2kmgj7Exsq14Xm4VmZ+LWZ0yhywoCkhPJtTwr?=
 =?us-ascii?Q?cC38Vmj5mtyApi7ILYGymIkdBXn8FdWtatg2EROeP/+uMaSi8E97ffbFCMPl?=
 =?us-ascii?Q?qNaNY3G+kQFF9PzSk1IZWGNt8fmv6+1TZy5EnSwO2uz69FZHI4LK5F/DqMkP?=
 =?us-ascii?Q?BgsJsDkf+iU4gWFqDq5ISpOLS2vo3lp0Ddgh6uANeZ6SJpViayWqAhIWn9eR?=
 =?us-ascii?Q?IXgUaaqD8dcAxmDT1QNjYdc7ilWNJVY2HJEYwb1Gq2wcTz5Qw00626wdQpxI?=
 =?us-ascii?Q?z3precGEms2rMXbjJESOyYUuHweahEEv2cMIg0K5z2rX+AI19mtg7fZZjgw9?=
 =?us-ascii?Q?Uv/qqyda3/8qEDswE8izDPW0pPvECVComDGV5rb4yT1chtucs40imImPwqh9?=
 =?us-ascii?Q?extACD9MCvKatgzywnV+MFDn/8FtkHrDrfqwnfpr8bh69zxOu1dJ/Zo91yIa?=
 =?us-ascii?Q?oC/VMncdN51BWQ6BJokACP1vSLzC5mcozB5oq9NKD1lx4+OaCJ07dtzSJEL5?=
 =?us-ascii?Q?J+rrUuQ6BdSLnsMpFw2La1D15SCLtqvooiOoRx3Oe+5YaYEeckKK2SF0aQVC?=
 =?us-ascii?Q?KnUlcOyfmqhD2aTCWPS0ZGvx2Z3DeEzeV+/pqYAOoHw74SGVzlntBP8wiaUi?=
 =?us-ascii?Q?HQ5TIuhTwKrmVjJCHAt39M8ovvd6//Oin+Qs8BrkIXinsGO8+EndIs7jqq2a?=
 =?us-ascii?Q?RtQspQ882eRsFb7X8dITI5GRXNzKPa790qTmv2prjtK8dYOzX37eiGgy+1Dw?=
 =?us-ascii?Q?GwcGrLNHemi5iFgzb1IgKFyK/DasXkE+eYS3gv/ufXH015eG7i8C8wIXvsBt?=
 =?us-ascii?Q?VMhv4dbj7o1+W8HKVZfl6BMDPYoQhGPTFgdMwWoj9oxDutsROaPLNW0FUYVr?=
 =?us-ascii?Q?yOadgZMMNXsxm8FILdFqcu+BzTV74TMJT1i9ckKjwXRcHGR8zLQwnjRD43at?=
 =?us-ascii?Q?AJGHtuDaKmGlUhjCw5Om61EFaTuD3JRLhuvnhCo++a0kjEihtpG3zGc29KbI?=
 =?us-ascii?Q?aJnZBGSw7TZYSlIp/WeFCl3rII2QFnEhtf2u0M1B4H1jQwDwtFbxdWTw+Ba0?=
 =?us-ascii?Q?GeTY5UvLlE3phgV8SC2daagF4Jjmn5K5T4jlsnxJVkYpSK6Wft1gZybsly5G?=
 =?us-ascii?Q?4wftfGeqZspfAPDQX5VajWVBQ6k0Z5xaZZE7mV9ZCjA7AsUiNGXC6Mrb0NP7?=
 =?us-ascii?Q?s8fkibyOWe987iOqW/zGIUtA2k+EZgYoD469QyJXSLz1KEoHa26ttVgvlE53?=
 =?us-ascii?Q?ZpvalRyfcUeXu+gx3502VgmjtGynNctle6+7iDtvtuL9MRfSZ9U2OSYYq23r?=
 =?us-ascii?Q?6rlydxTpMiThv5CrOU1EElf9oC99tgBuYMy/jLl5XJ+sdNJnU7jQHwcQbdkv?=
 =?us-ascii?Q?i6pxou+d6Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e66e29-6d00-44f4-700b-08defff078d7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:42.1649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNwAPJKLt/LY/Xze+YQcV+fjucRha+UqBHwW3cAg7L/xaOes9P/+KDdlli564X5LuCxKVQdtCUC6aDFjV8i/Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

The new firmware carries GMC commands over the same MCTP/NVDM transport
as the RPC path, under NVDM type 0x26 and with its own fixed header in
place of rpc_message_header_v. Add that header as GmcApiHeader, matching
Open RM's GMCAPI_HEADER, and the queue element that wraps it.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 147 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/mctp.rs   |   2 +
 2 files changed, 149 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 79a7820ce99f..2b938802495c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -50,6 +50,11 @@
         cmdq::Cmdq, //
         GSP_PAGE_SIZE,
     },
+    mctp::{
+        MctpHeader,
+        NvdmHeader,
+        NvdmType, //
+    },
     num::{
         self,
         FromSafeCast, //
@@ -947,6 +952,148 @@ unsafe impl AsBytes for GspMsgElement {}
 // are valid.
 unsafe impl FromBytes for GspMsgElement {}
 
+/// Magic value that opens every MCTP-framed queue element: `"MCTP"` in ASCII.
+const MCTP_MAGIC: u32 = 0x4D43_5450;
+
+/// GMC API message header.
+///
+/// Matches the `GMCAPI_HEADER` struct from Open RM. The `command` field carries
+/// flags in the high byte and a 24-bit command ID in the low bits. `size` is the
+/// payload size for both requests and responses, while the union at offset 16
+/// carries the maximum response size for requests and the status for responses.
+#[repr(C)]
+#[derive(Zeroable)]
+pub(crate) struct GmcApiHeader {
+    /// GMC command identifier with flags in the high byte.
+    pub(crate) command: u32,
+    /// Payload size in bytes.
+    pub(crate) size: u32,
+    /// Sequence number for matching requests to responses.
+    pub(crate) sequence: u64,
+    /// Request: maximum response size. Response: `NV_STATUS` code.
+    pub(crate) max_resp_or_status: u32,
+    reserved: [u32; 5],
+}
+
+static_assert!(size_of::<GmcApiHeader>() == size_of::<r000_00::GMCAPI_HEADER>());
+static_assert!(
+    core::mem::offset_of!(GmcApiHeader, command)
+        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, command)
+);
+static_assert!(
+    core::mem::offset_of!(GmcApiHeader, size)
+        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, size)
+);
+static_assert!(
+    core::mem::offset_of!(GmcApiHeader, sequence)
+        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, sequence)
+);
+static_assert!(
+    core::mem::offset_of!(GmcApiHeader, max_resp_or_status)
+        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, __bindgen_anon_1)
+);
+static_assert!(
+    core::mem::offset_of!(GmcApiHeader, reserved)
+        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, reserved)
+);
+
+// SAFETY: All fields are integer types with no uninitialized padding bytes.
+unsafe impl AsBytes for GmcApiHeader {}
+
+// SAFETY: All fields are integer types for which all bit patterns are valid.
+unsafe impl FromBytes for GmcApiHeader {}
+
+/// Header for an unencrypted GMC API message in the GSP command queue.
+///
+/// The fields before `gmc` match `GSP_MSG_QUEUE_ELEMENT` through its
+/// `noEncryption` union member. `gmc` occupies the start of that member's
+/// flexible payload array, and the GMC command payload follows this structure.
+#[repr(C)]
+pub(crate) struct GspGmcMsgElement {
+    mctp_magic: u32,
+    mctp_payload_size: u32,
+    mctp_header: MctpHeader,
+    nvdm_header: NvdmHeader,
+    nvdm_payload_size: u32,
+    reserved: u32,
+    pub(crate) gmc: GmcApiHeader,
+}
+
+static_assert!(
+    core::mem::offset_of!(GspGmcMsgElement, mctp_magic)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpMagic)
+);
+static_assert!(
+    core::mem::offset_of!(GspGmcMsgElement, mctp_payload_size)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpPayloadSize)
+);
+static_assert!(
+    core::mem::offset_of!(GspGmcMsgElement, mctp_header)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpHeader)
+);
+static_assert!(
+    core::mem::offset_of!(GspGmcMsgElement, nvdm_header)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
+);
+
+#[expect(dead_code)]
+impl GspGmcMsgElement {
+    /// Creates a new GMC message element.
+    ///
+    /// `payload_size` is the size of the command payload following this header.
+    /// `command_id` is the GMC command identifier.
+    /// `sequence` is the sequence number for request/response matching.
+    /// `max_response_size` is the maximum expected response payload size.
+    pub(crate) fn init(
+        command_id: u32,
+        sequence: u64,
+        payload_size: usize,
+        max_response_size: u32,
+    ) -> impl Init<Self, Error> {
+        try_init!(GspGmcMsgElement {
+            mctp_magic: MCTP_MAGIC,
+            // Despite the name, this counts the element header as well as the payload.
+            mctp_payload_size: size_of::<Self>()
+                .checked_add(payload_size)
+                .ok_or(EOVERFLOW)?
+                .try_into()
+                .map_err(|_| EOVERFLOW)?,
+            mctp_header: MctpHeader::single_packet(),
+            nvdm_header: NvdmHeader::new(NvdmType::GmcApi),
+            nvdm_payload_size: size_of::<GmcApiHeader>()
+                .checked_add(payload_size)
+                .ok_or(EOVERFLOW)?
+                .try_into()
+                .map_err(|_| EOVERFLOW)?,
+            reserved: 0u32,
+            gmc: GmcApiHeader {
+                command: command_id,
+                size: payload_size.try_into().map_err(|_| EOVERFLOW)?,
+                sequence,
+                max_resp_or_status: max_response_size,
+                reserved: [0; 5],
+            },
+        })
+    }
+
+    /// Returns the total length of the message, transport and GMC headers included.
+    pub(crate) fn length(&self) -> usize {
+        num::u32_as_usize(self.mctp_payload_size)
+    }
+
+    /// Returns the number of elements (i.e. memory pages) used by this message.
+    pub(crate) fn element_count(&self) -> u32 {
+        self.mctp_payload_size
+            .div_ceil(num::usize_into_u32::<GSP_PAGE_SIZE>())
+    }
+}
+
+// SAFETY: All fields are integer types with no uninitialized padding bytes.
+unsafe impl AsBytes for GspGmcMsgElement {}
+
+// SAFETY: All fields are integer types for which all bit patterns are valid.
+unsafe impl FromBytes for GspGmcMsgElement {}
+
 /// Arguments for GSP startup.
 #[repr(transparent)]
 #[derive(Zeroable)]
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 03546213da28..0ae88bef2a05 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -28,6 +28,8 @@ pub(crate) enum NvdmType with TryFrom<Bounded<u32, 8>> {
         Cot = 0x14,
         /// FSP command response.
         FspResponse = 0x15,
+        /// GMC API message (GSP command queue).
+        GmcApi = 0x26,
     }
 }
 
-- 
2.55.0

