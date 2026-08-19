Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535623BBFAA
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111592; cv=fail; b=JTXVvzfOnt5wkYBOqYuD3RlNX4iDWRbTvGQGeCMl3jT9zSTNaYZFnn1Mxj2PgIOh9u9fC10qNlakmKmZd4xdQa03QI2oXqRytAWg6wYLF3iQdrQ0VEyxYb+EfrDei0qV/9wlzRBhqDvP65RVe1IxX4scBtHn+ODJGezqO9NAl/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111592; c=relaxed/simple;
	bh=HTfLAZ7VgXPtsDk3EBUu+LK80trt76I0mtOeuZyxqNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UkQjssH8cTmViH89OUb3dm/pLydPHe/XpAwa7b26Nx7rNR4wONTZ6mPscOh/57KFzv654+7DIOEO61Ru+9BtNZPJ1rXeAvN5lJY1/MckCw0A2rqDynn8Pq27O7wixKNUMjO4lcLWZ64b2b8qz2Q1x60oNB+HJ5VVa2dxaR2NHUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GeYNurTc; arc=fail smtp.client-ip=52.101.56.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GeYNurTc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/+7uI6b8Asounq8IjJS5rO69CAVwntyIVyGv7D0gvDt3vITbS+kUL+jKKgGZOdFOTtWqGmhgpvvIj3pwvpV5uv6fPeEfBKb6bJVonpDNpQtBBONbUyn2DIW5kSAU17l87EtLed7KKrcfJkleqVv8Ow8uch9wgrHtLcLOkYD/FevZ00/+J35FRzy8GbWSqynuafuKfSPjHEMVn6QrVFOH2NOTU/nu5/zHjPE9Tfa6I6K8ndOCBP/m4Ma76cH4qc6UGQcmBSlCqu7supuwJEZGAPBKXQfwIV+kOZOJaqm2s+vdeZ1vM/1151FTBm3nqPE4cGacIhoq111O5PJlI2oFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TYxABKwEn9cf8sgv8m5wcLO9Wzm/xafLvQwCW3J+qg=;
 b=eMAaLxDd5Nw7ruNi6smhsTmtFrEKA64kd8FdyiLiZOweEVpictL7hFnZ99X0db4RocUY4uyDccHLFPxEO74QLUlaMRb71xeCBtcAO27l1YOtrO4vJnMtJ/Bw4+szIV83dKI9szyZUXXo+SQQ7g41bOeg13nPE3ktg79GWL75OlDy75eWVCSvvhMjTxH0SFfEmk/EIB4aIrbr1furl9p8oBap5+QggsrmqeEBtL3qG8Qh37G+9lyfQ+3ebhiKQuhC6SKNy+xU4qEuO0r38/bAltPGmy0jIwcExnR5ExTT/iKBvpW9qZodq/owXZNLZ+uk+t8Zgpz9go6MYp3TNdKzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TYxABKwEn9cf8sgv8m5wcLO9Wzm/xafLvQwCW3J+qg=;
 b=GeYNurTcldXDDz6HxI7AXEDjDA5lCLZbsoIs/trU0dVl3j2h4UbvsXmo2Cd5i3mopJRL08ffvZK8um5jSfCH0k5Wkn9nl2Dx5B9b+kflSECyZ699IW7VbdOGoabd6F+NxyCOCCXh2SJMQAfubOC4+XkihkevN/fgdyLfORDp3gwS3PtC+2X/nLr9DmmoJHxLy/PsWxNLY1kTh0xZA89zE6YKSEXAC4v5RSgafeTW3X5gWc6rEECBaOlhL4W+wtZySqse+gFcv3LQ8jWcmv6En5tS8caLTk0zktPA6kfhy1Rp3F9G2Iki6b0WI9XSM2mON3WwhajfjwJWzmyCkL+uAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 03:52:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:53 +0000
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
Subject: [PATCH 26/27] gpu: nova-core: gsp: remove the retired system-info and static-info RPCs
Date: Tue, 18 Aug 2026 20:52:19 -0700
Message-ID: <20260819035221.336390-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: f91ba336-cff5-4d01-28a6-08defda558ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|3023799007|18002099003|22082099003|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ojYERwpuZ93HhEgqYJHaCINk8B82wSY1AJhi/N9+j6SqSUysLDSQis26LKhDybToobFLO7E7TyMnNAuWN2v0VlAr4Hj1gcAPFTR9MNtX11IkK6aAyXAfUU8DR3aBhipM3Q5LKE4A6IY9dN1aYNY0NowK7EAA73EmRoV0ur6uF3QF+eoT36VC5qQZ231qrfKR5GX+pLazuAvLlWVAm3OFR/Bw6ha5M1GeQTL47jl4Sj0Bfaf2alVmrgsvY/iSm4vWPU4EPffgjcbCLAdgcQWtK/RM04K7s21p3OpqxTVHsRwn3doqIS+xzPjBu11t2BeM1Z1jbng+cDgj0DGN4BKOaru7+t0jf42DBBsuw1sgXJZ2IUDoupaIVTdy8z6a0QbE21RTYE9AHmnGu1v1D2eiyM38ychuT8VOPecKypAzQkHsnv/8OXH/yydFxngFvKmEJeugjB/sgik6fdi7E5555DoWPIRRDfUkR9Wl/Y8uuYRM2vubAqCMRDwosbhQWzsiWUwSZ7rzRJtHuM1won4KdmlfYfsZ5E0uPLFBuhzox2MC2oMUQHtlm/7fF/Xk8grSZp8XqG/aVMBtXRDM8wMlq5g9AWA/I2jFVfspcVQfwypqcj1aA7aLvv6PHDbG26EQDLyfx8AdJTyQLS7eEJ2uvIoA54Q7g+KUiADmBATOLuI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wBtfMoB0yhy/qHNTRDh8sXmoKDT+R2fE4c+SyfwNm+c+3Ob+q9TX+9b0u9tV?=
 =?us-ascii?Q?ScoKne4rQjnKw8+r/n64T5Dwc0CohuJ9/iN9w104SMc5AoxLX1YWJ/Dm/qGh?=
 =?us-ascii?Q?9JQAjw2lk28GGWCrZTg0RxA6bflKVwlfJNm51OWxGMr/W0RTGPpoU40ZbYi/?=
 =?us-ascii?Q?NajruDjU1JOqBef5lJu8cv4G2NNJ6pQODDDJui/fSsm0Db+o3Wi+tWlE5Yyf?=
 =?us-ascii?Q?HaY/VaBTODbjQD5KhcCQ6X1A5z+9XyA4AQR9yA4FP4YHDbIjssphNtDSZRIJ?=
 =?us-ascii?Q?WE3OS57qEQHeaX9xwoqw/g57aGvdwprAIWRcC8KnfMsJXoWPLhspwzXqRZ5b?=
 =?us-ascii?Q?9kOykdhkqUmRc7hcv2HHKMDmuwKJ1CHylxwSmaA1Pnh23Sbi0OrO6K/PQ4If?=
 =?us-ascii?Q?/3C1vUcvn/Pe38lyjzAf7eCa6sHVJaomqQ33O7ZegzhwrYvqGYK8JvxLYcb3?=
 =?us-ascii?Q?73HOPvfqA2CblVQGFntGlTbB6zmH2ystHKSm9Q1pyFBfiJSbJL4v3jkEYz1Q?=
 =?us-ascii?Q?rzfmplC7Nf/BlbNoXa8uYIR3RCx6THzffCk9NDS3Pf8s281++W0jRl3Z5PxM?=
 =?us-ascii?Q?14DdUTVRLucmSdYBMpePIs5YbeSj+MImWcKvJxB6h7S0erXlAzgejMdLkzDe?=
 =?us-ascii?Q?2UR+OulxWuibXzuBLqjQaOtfTFzaJAefjPIm7hALJkn+6eEybLhXjQKi7gYW?=
 =?us-ascii?Q?IyFFhaLylzVF7Q2tTpjRPOuOedAfmaFu2U1gy325pixDCNPzmneWQKxPLotE?=
 =?us-ascii?Q?3sLd2/Vs6OhT4Ym4nzguaEAjheZM+jrr+Jwl8S84rWGSqdJC5iG9NsFPqR2Z?=
 =?us-ascii?Q?27sEXuEDASolNM83Wih2pHjns+094ld06TyDld6x1AiMMMSM8AJv/9KBEr/m?=
 =?us-ascii?Q?GsaEsAn/lhFHZz//UX+gimS0nYtRB7NuMRLyCNTGheUnWcCNeUDdEWE0FEP4?=
 =?us-ascii?Q?MGLAYRDXPtzOwqzjAb1u/90eAXtKU/yR8I+B59B6YMRbEhKeRz2shEHO7EEL?=
 =?us-ascii?Q?pR0/lDCKu+qqm2BJCEN/iSqJz5YVw3S2geLbfHS+/12zA7GKGo6z139ePPLT?=
 =?us-ascii?Q?NvdTkOq9PUe9nielDDs/fPDlSxHzrcvPKqDPfGzC0YfwSswLXc34zCFddsng?=
 =?us-ascii?Q?10/1p7XztIbKNAIeNUBOlm9JZyI383xCdfYZOc5Gd9S73Asl4NKudwODl7wB?=
 =?us-ascii?Q?4c7a1lH2CLsE5zqQZn1SGIoz2hamMH5eUmVBbUI0wL2lg1z030mU1X9wl77l?=
 =?us-ascii?Q?CKItLmgGDGF1UfiLXt4KadxeFioczavNDPHfs3IKUc2ZxwdEpjRMXETnSN8n?=
 =?us-ascii?Q?GEmKAS/GxDEZfmwk0qnPoWHiAW4cy2TQ+NhiclR+lBSN+WyVhYO0oPwSZY/K?=
 =?us-ascii?Q?6yxUmnJgFupncYQbs1iNHO+K6pxsfiYZNTQOnSv2UHnlh4a99UkKtgTBkAT0?=
 =?us-ascii?Q?+vtq4WMKznjryrcASXf7XKbapw7u3F5a4oGjbe6kGFIQb9gWiRhkMJfkThvt?=
 =?us-ascii?Q?uojtpM5cdG1YFkgb526SLADkUG9K49aawgw4VOeiY/ZqNuI5sr7mKkMJdmCQ?=
 =?us-ascii?Q?Z9O5HC7cPznFDyxzuyBHvrAQWPHcUR+l21WSBILz+Tgrx2MBXExW3/YJmyse?=
 =?us-ascii?Q?veS+4O+wT0OlII5/jWMmeP+JiXVEoZnCG7M37jvyGw8PTAFPrPDZO0dwfEEH?=
 =?us-ascii?Q?Z3TRM6F/z+i2E8YZsUErAhTzThoV1rasNlgaFd3nbCU5i1mDVUxp4fOn9GC+?=
 =?us-ascii?Q?3xIMxSSDOw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91ba336-cff5-4d01-28a6-08defda558ec
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:53.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeEHLShIZ6VEazuwscuVVP8YIv9bT4RQWYErvmKwjH+L6lRdBfL+jkW00V/DzOHxvzORRfdua08dWYkJvzMm+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5990

The r000 boot path folds the system information and the static GPU
configuration into the GSP_INIT request, whose reply carries that
configuration back to the driver.

The set-system-info and get-static-info commands stayed behind after the
switch, unreachable and marked dead, along with the two payload
structures that encoded them.

Remove both commands and their payloads, and keep the decoded static
configuration that the GSP_INIT reply fills in. The two message-function
entries stay, because that table catalogs the wire protocol rather than
what the driver implements, and already names many functions nova-core
never sends.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs             |   8 --
 drivers/gpu/nova-core/gsp/commands.rs    |  65 +------------
 drivers/gpu/nova-core/gsp/fw/commands.rs | 115 +----------------------
 3 files changed, 3 insertions(+), 185 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 8e912eaf8e2e..b128153fda86 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -407,14 +407,6 @@ pub(crate) fn new(
         })
     }
 
-    /// Query the GSP for the static GPU information.
-    ///
-    /// The r000 boot path gets the same information from the `GSP_INIT` reply instead.
-    #[expect(dead_code)]
-    pub(crate) fn get_static_info(&self, bar: Bar0<'_>) -> Result<commands::GetGspStaticInfoReply> {
-        self.cmdq.send_command(bar, commands::GetGspStaticInfo)
-    }
-
     /// Returns a shared handle to the GSP command queue.
     pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
         self.cmdq.clone()
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 26ea07dc4a28..9079393da0b3 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -49,34 +49,6 @@
     vgpu::VgpuState, //
 };
 
-/// The `GspSetSystemInfo` command.
-///
-/// The r000 boot path folds this into the `GSP_INIT` payload instead.
-pub(crate) struct SetSystemInfo<'a> {
-    pdev: &'a pci::Device<device::Bound>,
-    chipset: Chipset,
-}
-
-#[expect(dead_code)]
-impl<'a> SetSystemInfo<'a> {
-    /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
-        Self { pdev, chipset }
-    }
-}
-
-impl<'a> CommandToGsp for SetSystemInfo<'a> {
-    const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
-    const IS_ASYNC: bool = true;
-    type Command = fw::commands::GspSetSystemInfo;
-    type Reply = NoReply;
-    type InitError = Error;
-
-    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(self.pdev, self.chipset)
-    }
-}
-
 struct RegistryEntry {
     key: &'static str,
     value: u32,
@@ -186,48 +158,13 @@ fn init_variable_payload(
     }
 }
 
-/// The `GetGspStaticInfo` command.
-pub(crate) struct GetGspStaticInfo;
-
-impl CommandToGsp for GetGspStaticInfo {
-    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
-    type Command = fw::commands::GspStaticConfigInfo;
-    type Reply = GetGspStaticInfoReply;
-    type InitError = Infallible;
-
-    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init_zeroed()
-    }
-}
-
-/// The reply from the GSP to the [`GetGspStaticInfo`] command.
+/// The static GPU configuration, as decoded from the `GSP_INIT` reply.
 pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
     /// Usable FB (VRAM) regions for driver memory allocation.
     pub(crate) usable_fb_regions: KVec<Range<u64>>,
 }
 
-impl MessageFromGsp for GetGspStaticInfoReply {
-    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
-    type Message = fw::commands::GspStaticConfigInfo;
-    type InitError = Error;
-
-    fn read(
-        msg: &Self::Message,
-        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
-    ) -> Result<Self, Self::InitError> {
-        let mut usable_fb_regions = KVec::new();
-        for region in msg.usable_fb_regions() {
-            usable_fb_regions.push(region, GFP_KERNEL)?;
-        }
-
-        Ok(GetGspStaticInfoReply {
-            gpu_name: msg.gpu_name_str(),
-            usable_fb_regions,
-        })
-    }
-}
-
 /// Error type for [`GetGspStaticInfoReply::gpu_name`].
 #[derive(Debug)]
 pub(crate) enum GpuNameError {
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 00e40a435053..e49234f35d0f 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -14,11 +14,7 @@
     }, //
 };
 
-use crate::{
-    gpu::Chipset,
-    gsp::GSP_PAGE_SIZE,
-    num::IntoSafeCast, //
-};
+use crate::gpu::Chipset;
 
 use crate::gsp::nvkv::{
     nvkv_decode,
@@ -37,56 +33,6 @@
 
 use super::bindings;
 
-/// Payload of the `GspSetSystemInfo` command.
-#[repr(transparent)]
-pub(crate) struct GspSetSystemInfo {
-    inner: bindings::GspSystemInfo,
-}
-static_assert!(size_of::<GspSetSystemInfo>() < GSP_PAGE_SIZE);
-
-impl GspSetSystemInfo {
-    /// Returns an in-place initializer for the `GspSetSystemInfo` command.
-    pub(crate) fn init<'a>(
-        dev: &'a pci::Device<device::Bound>,
-        chipset: Chipset,
-    ) -> impl Init<Self, Error> + 'a {
-        type InnerGspSystemInfo = bindings::GspSystemInfo;
-        let pci_config_mirror_range = chipset.pci_config_mirror_range();
-        let init_inner = try_init!(InnerGspSystemInfo {
-            gpuPhysAddr: dev.resource_start(0)?,
-            gpuPhysFbAddr: dev.resource_start(1)?,
-            gpuPhysInstAddr: dev.resource_start(3)?,
-            nvDomainBusDeviceFunc: u64::from(dev.dev_id()),
-
-            // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
-            // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
-            maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: pci_config_mirror_range.start,
-            pciConfigMirrorSize: pci_config_mirror_range.end - pci_config_mirror_range.start,
-
-            PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
-            PCISubDeviceID: (u32::from(dev.subsystem_device_id()) << 16)
-                | u32::from(dev.subsystem_vendor_id()),
-            PCIRevisionID: u32::from(dev.revision_id()),
-            bIsPrimary: 0,
-            bPreserveVideoMemoryAllocations: 0,
-            ..Zeroable::init_zeroed()
-        });
-
-        try_init!(GspSetSystemInfo {
-            inner <- init_inner,
-        })
-    }
-}
-
-// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
-//         that is not a problem because they are not used outside the kernel.
-unsafe impl AsBytes for GspSetSystemInfo {}
-
-// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
-//         that is not a problem because they are not used outside the kernel.
-unsafe impl FromBytes for GspSetSystemInfo {}
-
 #[repr(transparent)]
 pub(crate) struct PackedRegistryEntry(bindings::PACKED_REGISTRY_ENTRY);
 
@@ -136,60 +82,6 @@ unsafe impl AsBytes for PackedRegistryTable {}
 // are valid.
 unsafe impl FromBytes for PackedRegistryTable {}
 
-/// Payload of the `GetGspStaticInfo` command and message.
-#[repr(transparent)]
-#[derive(Zeroable)]
-pub(crate) struct GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
-
-impl GspStaticConfigInfo {
-    /// Returns a bytes array containing the (hopefully) zero-terminated name of this GPU.
-    pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
-        self.0.gpuNameString
-    }
-
-    /// Returns an iterator over valid FB regions from GSP firmware data.
-    fn fb_regions(
-        &self,
-    ) -> impl Iterator<Item = &bindings::NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO> {
-        let fb_info = &self.0.fbRegionInfoParams;
-        fb_info
-            .fbRegion
-            .iter()
-            .take(fb_info.numFBRegions.into_safe_cast())
-            .filter(|reg| reg.limit >= reg.base)
-    }
-
-    /// Iterates over usable FB regions from GSP firmware data.
-    ///
-    /// Each yielded region is a [`Range<u64>`] suitable for driver memory allocation.
-    /// Usable regions are those that satisfy all the following properties:
-    /// - Are not reserved for firmware internal use.
-    /// - Are not protected (hardware-enforced access restrictions).
-    /// - Support compression (can use GPU memory compression for bandwidth).
-    /// - Support ISO (isochronous memory for display requiring guaranteed bandwidth).
-    pub(crate) fn usable_fb_regions(&self) -> impl Iterator<Item = Range<u64>> + '_ {
-        self.fb_regions().filter_map(|reg| {
-            // Filter: not reserved, not protected, supports compression and ISO.
-            if reg.reserved == 0
-                && reg.bProtected == 0
-                && reg.supportCompressed != 0
-                && reg.supportISO != 0
-            {
-                reg.limit.checked_add(1).map(|end| reg.base..end)
-            } else {
-                None
-            }
-        })
-    }
-}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for GspStaticConfigInfo {}
-
-// SAFETY: This struct only contains integer types for which all bit patterns
-// are valid.
-unsafe impl FromBytes for GspStaticConfigInfo {}
-
 /// Power level requested to the [`UnloadingGuestDriver`] command.
 #[derive(Clone, Copy, Debug, PartialEq, Eq)]
 #[repr(u32)]
@@ -369,8 +261,6 @@ impl GspInitRequest {
     const NV_DOMAIN_BUS_DEVICE_FUNC_KEY: KeyId = 0x1020;
 
     /// Describes `dev` to GSP-RM and asks it to apply `regkeys`.
-    ///
-    /// The same identifiers reach GSP-RM through [`GspSetSystemInfo::init`] on the RPC path.
     pub(crate) fn new(
         dev: &pci::Device<device::Bound>,
         chipset: Chipset,
@@ -442,8 +332,7 @@ pub(crate) fn gpu_name(&self) -> &[u8] {
     /// Iterates over the FB regions the driver may allocate from.
     ///
     /// A region qualifies when it is untagged, unprotected, and supports both compression and
-    /// isochronous access, which is the same set the RPC path selects from
-    /// [`GspStaticConfigInfo::usable_fb_regions`].
+    /// isochronous access.
     pub(crate) fn usable_fb_regions(&self) -> impl Iterator<Item = Range<u64>> + '_ {
         self.fb_regions.iter().filter_map(|region| {
             if region.limit >= region.base
-- 
2.55.0

