Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98E23F0AA9
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471849; cv=fail; b=BKfgdn4PRq4EXtHhrabhDe8FRZd77Gpnvl5Pd/+QQEoX7+/aHzEC91ds4scIeebo/e2pQl75FmVviCOfWxlW3Xp+elruGoHC0JYalKgwn+GKL6B+rkZ9JssJghUsF2iJhl51gAT87Z+18a3iyCKfns1cffv+VtHryDc3fBp/lOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471849; c=relaxed/simple;
	bh=h6FmKYysfxdn5Zl39efh3DRm5uwQPDZ6FI4zfvDw2xE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VI9QVxdCPSo2xIyoTchOHlfqRjPEje+vv/+93nSp893DR96FGMNRdrDc5a321htju7xYz2TiKL3SBeBw11CxcP+6+GGGR8UIYLGFZcB5NwH5OY5Z5Gzj3ZS/1SRuXwKcOzgFOngYwQOzYrlphVRakrSJyNUvWQFHCSEc6alIa/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NpN0Qvh0; arc=fail smtp.client-ip=52.101.43.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NpN0Qvh0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8l5o7a/Rk//KUS83i2D444ZPUL10vyGc91h7685RgjQSptqkgYpzMqltz32iVRKJmEGlfUMyR30CxWRfrX/3YoLeV+ha17ICykJQ4EWUd1bsaB/7gIdTaPHkhhqzuO/jPO2QCfdi5zZBDy52k+kLxNNQ6gYaE853G4FSgXLFV+kNRN9an1Rs9xcnDy3o2DCzdfLHlhZKRv7+vbTazvzqlSZPU3ERJZ7xC3PA0v3XxAdSiOsxtvQ4J5k36nrFBrPzdcOrQoAsI2JDzp/MB+eWQ9ly3Iw6p7AbjOpx9nQj4WujgD1ZbcZ/5j4C2dj6JDkXF7UfQsZ9AY/qF9TXiWTQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8TsK5jxYu6yrgawgaiTuTDkHdd3K+5Oo5xdvf5xLbk=;
 b=xpKnRtjg/JJ3ZbRalBze7HIkmdY72KmWKGktCItKmACfkmEhQkueLJnbsl2XZulF4AH8KDOjhC29FTmQ5FAEE+3kMOatcqR5Aie3kykKz0gK25oX54XaZoBSMAR/1fxpLuftdjoP9XkcBSXAmUxkZkXy26+C5J5jl1k2HywuqGEWQgQeDtiKjCqb5vY5UBPuwRjr+kEpVgI2jwegvpOedHqZCpezq1Ziky8g0rGFBp4yRku+IgsRDWpP63b4wFh/NGiXldm2M2v0u2EaqdcSlpQsYtd22025dOq9L52+eZGF8jVm7c6G3Xt4R014eADkydLV7o1ffThRz94kCwHcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8TsK5jxYu6yrgawgaiTuTDkHdd3K+5Oo5xdvf5xLbk=;
 b=NpN0Qvh0B0Uebm5IgbD5goUThGecrRVJibg5PfZl6AbCdrQhHQmAghZ9tJuLBcSuIU9vrqhbe24lWNjUq4u+NTCYvF5R/emOACtPBgHuCEkmp0SWZSimmZziKcGuZkGd1k0qEl9jZV06Rt26cQBMrDYCpFlFQQEbaAQWK2g/nkvaMdQuNJxyDMiIxvFJjV31Hhq1hubCcYQ3zgypNiSXTKqHm8G4EZchWLPglk1rjR+UJ51Rn7ZzpSLwjTTmQRmaPnKm2DGCC4p8kvYeX3cNBoRzhBpLAgl6WM7v/FeGpVpyHqLrJrfUkZofiM2BBTraIEISh0aGu/vWB78vnVyagw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6667.namprd12.prod.outlook.com (2603:10b6:510:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:30:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:30:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 03 Jun 2026 16:30:19 +0900
Subject: [PATCH v13 2/9] gpu: nova-core: Hopper/Blackwell: add FSP message
 infrastructure
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-blackwell-v13-2-d9f3a06939e0@nvidia.com>
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, 
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 9096603c-211c-4c11-58e6-08dec142027d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	tY07p7psE423X3S6FYqHiycjMHdRRcf2mJEZfZf9j47Jptbr7kzcYANhGuhpEQiFqatksz2Ql8N/r3hhYWwVpxpNtY7m740TFvr2PfIewMDn3zPB3QIK3HV/yOyPbBlkRuxocqo9/K+Ccwjs5ud/EABlCw+DAFNjvbptJR9C0w/wkoa4MkOhCAPs1KBqz3eVwrS9GjDK4Pe2vzESQA771ShG6GDssiOQSkqQuHWu5V2ELeANCZmXTWzhsMgWPhKfBP6xwOAFJrigczqbLFYmoKkDg8uWtFa4Za8M6gYdyTpBJtLiY6es+MQEUIaDIZ+6Gh57+vuJ93A4dJVe1AHLnEn7IcozZpr8cRD3wKpcJjMlD+PnN/Jet53jjHCbN57MzMj+3Kv+LJF9j++r3i+JOU3EVgmH74TFDKsY63gFgdhLVVJziDNMS9m4ftw3izHOf7MNryqdruCP1xXDRcAL8SGHC1rqzhiazQRxOlAkjHBCc4TCWxKwiXgOD3iFK1v1Lmkw62fLeUvBygEeNH3iJUbnxNGiF/Jkv91kFcBgD/bCzPGwuYVqapB0VAby1hr0V642pIp32PaH3+vED+EyCSWB1LjC8PhF9cSBiN2BZdLCfIHXWXpeuivv3oLpI9kNVQC42h/Wv4DdFHRY+2tEegglDBuqewNcmxssw0fMOUs470nDgwRYRat8pn5hPmjt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkZiUkd4cVpkZEtGWlVUUTJvc2lvM0t0akdneFRtaVRwejdFbmJrNHlyZUhm?=
 =?utf-8?B?VjJlQ2I4K0FoTytsUExxMlJDTWRZVEJDZ0JkOSsrbm5MQmdyTkV4cWJZMVRo?=
 =?utf-8?B?RnhGaWt1RVMxbG9hcVNuZFRoTFpScnFWbi9wNkRKSDl3MGJ6VmlZSFB4b1Rv?=
 =?utf-8?B?Z1hVRzJGWEZUOUVjc09keGRsNE82KzZFOWJTdVltc2lhS3VkT2tOL1U4NVpQ?=
 =?utf-8?B?TTd5TGZUQXZsc3FSV3FTOHFJOWd5NkY4TFQzem1Ta3hUZlVQSFhDTDFaMVhu?=
 =?utf-8?B?dUtEaHQ0dTlackY4QmlRTUoreFNLUkRseVBRVzVHSHVFdzJiOGU3bWNKcHND?=
 =?utf-8?B?bXkvcXBqSEFIeFZ6dVI2Q2NRS3doZVMrNlJjamp1VnRtNVdvZ1UrTHdpcDdF?=
 =?utf-8?B?S3hBZFNLUnBydmZjY2dWREd2MVhTZmZmYkYrOEFRcGdMbkpXYWZma1E1U1p3?=
 =?utf-8?B?cWV6M1JFbm1CNWJ3NWpON0dwK0haNWhhNFRsSVhOMTE1b0RvTHZSd1lCdkZz?=
 =?utf-8?B?TGNXb2lyYmJnTndRZ2kwSzBEOE5YNHh6KzAzWjUvNDdFNlIxaWFkRlFhdnRu?=
 =?utf-8?B?NVNmd0xodWN5QXM5dSsyb3pyNDVtRTg5bWthdU5CMHBrVEZwTG1UUi8yU0VG?=
 =?utf-8?B?TzZBbWNyMkljbC9HemhwU1l2ZVZTcHdmQmcxUDYvSVdQZmllRWJNelVBUFRU?=
 =?utf-8?B?ZE84dmZrelUvNGFjOCs0aTRiS2E5VndrakJBenVORWNrNEIvUEdlcko4Nmlu?=
 =?utf-8?B?V0p5eThPQnpUOU9yRVF0eXMyWFduWGViekp3eTQ2WVd2eHdwUGRpalpBeEVJ?=
 =?utf-8?B?c3I1YXpBQjVHYnFGTzVWaGxZekV3VCtKRUl5TUVxdnZya1g2N3lNY0g2NVlK?=
 =?utf-8?B?UmEyNjlkMUhPUEk0REJIRzhwNEtEQzA5djJTZ2dQbktMN2pJS1VnN1dmSzNF?=
 =?utf-8?B?VnhZTG00Vm4vVEdFaHcwaGs5M3JueVhEbUFKUy9kRG1kcWpMcXk2R0hyTWtI?=
 =?utf-8?B?cUlRNkJTcndPakRCaFFCSG5ZUWRxUEwvRUlMMHB1T1VzRzNrd2ZXVVh1VEI5?=
 =?utf-8?B?dXlzSXlZbE1kMk9rd0lqZjN3cTJ6OGhiQlluZzR2cisxRnh1eWp1czluQkJZ?=
 =?utf-8?B?NzVpcmtBalcySE1kUTlqRS95bVpXQzNhOWVKNDZqaU1DL2lqN0txNTJBRG4v?=
 =?utf-8?B?TGFrcDB2ejVwT2g0UTErMmN4TUFjMTdZY0FrL1hxNmIrcnl3NktzNGt1Nmwz?=
 =?utf-8?B?YVlxU1lWd3Mya0x3WmlDTjBUU3Vwa2FZUjJJMERVTkNGQnE0WXRZKzcyTHlp?=
 =?utf-8?B?NFplRjVIQ0dQK2JQVnNoclNubnVhRGRkQUFGZy9HSzcwSGZjRHRSUW1YZ2lH?=
 =?utf-8?B?RUxZa08rSDIza0NCN3Ywbkg3OTczbllON0dpd2RnbnVRcjdUempBQXR2Y2Ry?=
 =?utf-8?B?ZTFFRjV2QjJzRjNsWGxxVk4rSlp2RFczYXRNSDR2N2drMTRvNXN6LzF3NmVE?=
 =?utf-8?B?amhVVlNLdFdZeG5JLzF2UXYzK0k0OStobWdTdXovZnp0V0N4WjBnOGVEakVm?=
 =?utf-8?B?RGhtWHZYV2NnMnR0bFRqdHlRTkpNL21pVEljc3I1ZmdKL1Z4b1BBZnp3Vmx3?=
 =?utf-8?B?WDh3WGIyeTZhSkN1eE1YTldJc0FmVUVqaXdqR1NGTFJ1YTFvd0ZrUkNOd2xP?=
 =?utf-8?B?QXN4dlI0dU5FMi92TWR1bnMzcUxkWlVjeHFqZ1V5ZXl4ZUQ1bWdCR1lxTGxN?=
 =?utf-8?B?dUsyb1VKWG5ROVBVR3RLWTB4SzU2bVdLR3FIN3pLMGpzYUlBbG5mSm9DQlY2?=
 =?utf-8?B?MHhpUTZJU3lPcW56bC84WXRBZWtrTUFXemg3WmoxZ1c1MW1aMHlvcnpyTThD?=
 =?utf-8?B?NStnVUYyOE9YejYwd3JHb2Z2dk9iMWVkUkRwTkJnODB4VGllRDZkZmh0U0hk?=
 =?utf-8?B?SGNvU2dHNG03d2tCRk51WWM5REgvc0hZTk82WFhUYUp4aGI4WVBCeTdXQlFo?=
 =?utf-8?B?VDFjN210cS9WQUR1Vm02SjcyQmJFbzNoLzdmdXY4amVaOEhHRzlIYytjRnBG?=
 =?utf-8?B?RWQ0VzNvVUZDODdnelg5eDAyS2s2ZnlXZjNrOERrcTFLWGk2czhBSVBXZXZj?=
 =?utf-8?B?SGhhbUFRSmI4OU83aHUxcWl1UGxkMHVsOFZOZzJLMTREcFgzd3g0S2ZEa0Fv?=
 =?utf-8?B?NnlNTHFuOXRCNHcwVHdQc01zdHhRcTk3UVZHWlhMOFZCMXdNT1ZKRVB0VE1T?=
 =?utf-8?B?ZEltajJZK3NUU2lMYytlZ2F5ZUxNSnF0RlhkU3cxUGVuWU5wRTJlaG40WFlC?=
 =?utf-8?B?WUtFQWRleDBxMHZFcWdXUjNCTTVLcGFoQ2N3b2xNbUFsSDRrY1Z3d0NiMlcy?=
 =?utf-8?Q?Pcgfro+71if5Kl+knjYx3ebVRUtR7+Or0Q1abgV4jhEuY?=
X-MS-Exchange-AntiSpam-MessageData-1: l9LOuzaefCMCOg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9096603c-211c-4c11-58e6-08dec142027d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:30:39.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vdx3ZFRrvgg4XcCZ6Mr9w0Fsj4yIKMPh/i4gl/liVtiqA4v1Vv4xf6GJp/M78rXdz2JmQabZpWob9rD5jLMB1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6667

From: John Hubbard <jhubbard@nvidia.com>

FSP communication uses a pair of non-circular queues in the FSP
falcon's EMEM, one for messages from the driver to FSP and one for
replies, with the driver polling for response data. Add the queue
registers and the low-level helpers used by the higher-level FSP
message layer.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 74 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/regs.rs       | 21 +++++++++++
 2 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 0956a75ef7aa..a178fc4db1ea 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -8,6 +8,7 @@
 
 use kernel::{
     io::{
+        poll::read_poll_timeout,
         register::{
             RegisterBase,
             WithBase, //
@@ -15,6 +16,7 @@
         Io, //
     },
     prelude::*,
+    time::Delta,
 };
 
 use crate::{
@@ -25,9 +27,13 @@
         PFalcon2Base,
         PFalconBase, //
     },
-    regs,
+    num,
+    regs, //
 };
 
+/// FSP message timeout in milliseconds.
+const FSP_MSG_TIMEOUT_MS: i64 = 2000;
+
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
 pub(crate) struct Fsp(());
 
@@ -46,7 +52,6 @@ impl Falcon<Fsp> {
     ///
     /// `data` is interpreted as little-endian 32-bit words. Returns `EINVAL`
     /// if the `data` length is not 4-byte aligned.
-    #[expect(dead_code)]
     fn write_emem(&mut self, bar: &Bar0, data: &[u8]) -> Result {
         if data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -75,7 +80,6 @@ fn write_emem(&mut self, bar: &Bar0, data: &[u8]) -> Result {
     ///
     /// `data` is stored as little-endian 32-bit words. Returns `EINVAL` if
     /// the `data` length is not 4-byte aligned.
-    #[expect(dead_code)]
     fn read_emem(&mut self, bar: &Bar0, data: &mut [u8]) -> Result {
         if data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -95,4 +99,68 @@ fn read_emem(&mut self, bar: &Bar0, data: &mut [u8]) -> Result {
 
         Ok(())
     }
+
+    /// Poll FSP for incoming data.
+    ///
+    /// Returns the size of available data in bytes, or 0 if no data is available.
+    ///
+    /// The FSP message queue is not circular. Pointers are reset to 0 after each
+    /// message exchange, so `tail >= head` is always true when data is present.
+    fn poll_msgq(&self, bar: &Bar0) -> u32 {
+        let head = bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
+        let tail = bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
+
+        if head == tail {
+            return 0;
+        }
+
+        // TAIL points at last DWORD written, so add 4 to get total size.
+        tail.saturating_sub(head).saturating_add(4)
+    }
+
+    /// Writes `packet` to FSP EMEM and updates the queue pointers to notify FSP.
+    ///
+    /// Returns `EINVAL` if `packet` is empty or its length is not 4-byte aligned.
+    #[expect(dead_code)]
+    pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Result {
+        if packet.is_empty() {
+            return Err(EINVAL);
+        }
+
+        self.write_emem(bar, packet)?;
+
+        // Update queue pointers. TAIL points at the last DWORD written.
+        let tail_offset = u32::try_from(packet.len() - 4).map_err(|_| EINVAL)?;
+        bar.write_reg(regs::NV_PFSP_QUEUE_TAIL::zeroed().with_address(tail_offset));
+        bar.write_reg(regs::NV_PFSP_QUEUE_HEAD::zeroed().with_address(0));
+
+        Ok(())
+    }
+
+    /// Reads the next message from FSP EMEM into a newly-allocated buffer and resets the queue
+    /// pointers.
+    ///
+    /// Returns `ETIMEDOUT` if no message was available until timeout, or a regular error code if a
+    /// memory allocation error occurred.
+    #[expect(dead_code)]
+    pub(crate) fn recv_msg(&mut self, bar: &Bar0) -> Result<KVec<u8>> {
+        let msg_size = read_poll_timeout(
+            || Ok(self.poll_msgq(bar)),
+            |&size| size > 0,
+            Delta::from_millis(10),
+            Delta::from_millis(FSP_MSG_TIMEOUT_MS),
+        )
+        .map(num::u32_as_usize)?;
+
+        let mut buffer = KVec::<u8>::new();
+        buffer.resize(msg_size, 0, GFP_KERNEL)?;
+
+        self.read_emem(bar, &mut buffer)?;
+
+        // Reset message queue pointers after reading.
+        bar.write_reg(regs::NV_PFSP_MSGQ_TAIL::zeroed().with_address(0));
+        bar.write_reg(regs::NV_PFSP_MSGQ_HEAD::zeroed().with_address(0));
+
+        Ok(buffer)
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index e602c7860459..c3c50b8d8f10 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -579,6 +579,27 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
+// FSP (Foundation Security Processor) queue registers for Hopper/Blackwell Chain of Trust.
+// These registers manage falcon EMEM communication queues.
+
+register! {
+    pub(crate) NV_PFSP_QUEUE_HEAD(u32) @ 0x008f2c00 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_QUEUE_TAIL(u32) @ 0x008f2c04 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_MSGQ_HEAD(u32) @ 0x008f2c80 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_MSGQ_TAIL(u32) @ 0x008f2c84 {
+        31:0    address => u32;
+    }
+}
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 

-- 
2.54.0

