Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010013.outbound.protection.outlook.com [52.101.201.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE234E4C39
	for <nova-gpu@lists.linux.dev>; Fri,  9 Oct 2026 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546895; cv=fail; b=dx5N22A+NrGtHEFa+gMmGsJ1NSBN/dBLYuERBvv2bx5TEaRcVwoKusB5muSHP1UJh+VRU0HsIFhwJ/CuEiHrnwFF9JCqf41/KbGa2trpqGQpfgk6Xgb0lmskgzS2564rJIvshee8kOvfO2L2zt3DAxB40FWpFLCOBC1fvyGBXQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546895; c=relaxed/simple;
	bh=j+Ve+rBaVJ1B9ZhgMgl5zQT2w4rgf7y+dsbUodPqc80=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ha0zt06VNCDRJu0ntgp03RUvGSsyIz5TENIEYsgpr+XiGt6r7j1qLWTBVo2vvzXRVGevnGEmKCBFANLEfExYwomL8sGPBNf2W6w9BpLI2lcr/B8iJS0rN6OwXBElj8SAjBPH1ffUUgLsvbRqjWO44O8jhtY3UsC+cGUa4RLR0GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WVTHPTQi; arc=fail smtp.client-ip=52.101.201.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WVTHPTQi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKUmB2L/HsEOZrT1/wJwSNLrd1kimCudaRB5lG08dzSPKNaf6dOyfQFC+qOOlSdV8nY/m7eoAj6Ur165hpPjf/ZUtIZzN6IQFqLE62ibUYnlUA0QuFpRqKZUC/crrgnafmDtyaOpI2wdIeS65lv0R1fXJuiMRYGLPZLJrPkOt6nH2fWGPmMrvU4L7AbMaTtimrGc4eRBCJcRQ57kssq8+UA7jQL8QSWRiXuTTQKt5S7H+yxgA3LQG/TI2RI+MCVUanE5dC/g0iGqWwdYwOSpp6KmYk/iMEasAywtcNLiaJSmaipGUSQVxCSDrydnoenHHY+vgo/8qVLk1HRFaJeCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhOCx/ES0ZW6ecSR1mbqXfdU7MLE3FgPF6MhomcbD58=;
 b=mElIoBYwK0LJub/GynO11J2GL8AJUfee9HdvAgQMJj8CaPsLO9HfbRKmcqhIA3kDgvnPAM1MRNO3wNldymsL68mKGkgfCaqN0OtOkZD15Zcp4GcVuCXJMMtT+NTu1P2ruZSy3W+PR2aXP5Jt0+YWgEQdiysEsjtRNz1freKmauhQDJl6qkqsKTt58AKDDYY1DzbWmEDR7UjksalIW6sUcgA7dJ5raRjjdasnjyzZFexk37uRGYUWi88Pb1OzrwFAwi2OfEpQhs8VVI9AAThQMbJ3NA30UBDoQpITUwRQjoduiGCx1JIJwxidl/fgSPmp5n93/gcACaMlulsyXn7D0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhOCx/ES0ZW6ecSR1mbqXfdU7MLE3FgPF6MhomcbD58=;
 b=WVTHPTQijVy4B04cime4mW5HZbq7Z7G7KhQ/nW5oafCIS/Gor29Hlk5/m58+VJr9f2hbSvSSsHj4IUBIon+ZAt/0Nw16icfIpPuNCmGDuCAjxYDDPgCckj4KsQ6g1YCOfmB0n87+Mm2Tir9RajacCyDIM0mqCVq+aOCPNZJsse3wtxDx9nl1NayKP7mGjUhwCjCxOtn9yPEgkvAejMUB4EDhPy0E+cgUVCNdgleA0NUstNMvrOiu1mwsy1z8JsKq6rvyeS5mdqx7O+pekOgfXeofyWsCpJvXp/1Ytso5iXh59G9aZF/5gKrjVTChpwhLQbV9/r8VDs7zOp632JagBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS2PR12MB473522.namprd12.prod.outlook.com (2603:10b6:8:400::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 11:54:28 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 11:54:27 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 09 Oct 2026 20:53:59 +0900
Subject: [PATCH v4 03/10] gpu: nova-core: gsp: cmdq: group the RPC-specific
 part of send_single_command
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-cmdq-rpc-v4-3-c9ab8de1d3f2@nvidia.com>
References: <20261009-cmdq-rpc-v4-0-c9ab8de1d3f2@nvidia.com>
In-Reply-To: <20261009-cmdq-rpc-v4-0-c9ab8de1d3f2@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7PR01CA0113.jpnprd01.prod.outlook.com
 (2603:1096:604:258::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS2PR12MB473522:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb1ee52-71ef-4aec-d7c1-08df25fc1237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	zR2x6PnU/+oa971X8L9ZQdlzHJ/urv3Uy/r9tAVuMJL0/E+Voik7SEdEZTlYKKrReUzBCNEUHhIHYgzSlZwuIJUhHE/D4yHb3H2eyftIMKLCsF8M0JPveoiqOrVVDW1IpF6ftQZQIQU+yX9w7ctjQKcGgITI3H3wMxjg1mqT4Uv1U5qVEPFwOZwFOYOUgoVOD8fdOgwlCLRNM1MbwXn9cZGki2EjZR48LpE9jp1W02DDZsqADGYsigppMM7icx41GbHAuk2l79Z0UwTAB4PeHG2gSdS5bcwgxvG4/9nhM2Tt26azlxRh9Ny41StPjHiHpNQShxiR9rwuZ8oJdPrF6itYn6ImITkjiixqs6iDtorNo95dfMkf9Z16ljdLD7sWMO1An3MfcTZG16UhnmhzmNhfLL3DnQIXe264tfC0AQdtNrbk5K2c3itdT8GEqHen64bm58uK0YjqdkaSTkYNZqxxdJOuVOQ3Hpx7Dm2zZ8tfRRTsNAt3cMHfvDAorZ3Dcw/jNRheNTRdxNUZuyozPDYST7LFZiXlGV86F+o55xCaNdh0RPALkCSc9MmphUUhjF6eED5VlE0X+owjDtMGllbuh8/oPIn/SEmsEfDnonJEUMi8QjSyQsCKMH1ca5mhLHeovBQlLxd8dv6vO8YnWyKm330qT7BNEnDgdQXuerM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THprcmc4RG5yOU1ZRy9xVUZGTE9tV3BQVkNlUlZNZHVEVXJ0WVJvNDkyakNK?=
 =?utf-8?B?MmYwTWxRcjVld0RjK0Q3dzRvWjVPZCtEaWZHQUpMRXdybWduK2JOKzdXWEVy?=
 =?utf-8?B?OUlrTVJ4RXBsNVhndGNReWRtM2tHMkVsaVZFSExpWEtJTVQzUWJjZVJ5OXZu?=
 =?utf-8?B?ZnlueklOKzJBMWhnTGgrZU9yVlZzdHVIYU5CNWRIZHlHZllGZ3dEWVZYeG01?=
 =?utf-8?B?NEExVGVFZjE2dDZNaFlOYng3M1RSTkgyemo1bVUrckowaGNkbjVvM2ozM3BX?=
 =?utf-8?B?WVF0UWFqY0xGSm52QW8zdnEzdXU0RnplTERucUtDcWlSQnlma2FncEZDeG1V?=
 =?utf-8?B?YmxVVnkvWHFHNlBVMEIwZi9XcFZHLzdqUm9mUW53bFpIWFJFaGlPNHRXN0pV?=
 =?utf-8?B?cEVjRzdYOHFORmJQNkNjbVY4RnhHaHdjNGVRakNRdzc3ejA2Qk9uSEpJMktJ?=
 =?utf-8?B?ZlZROVVlV1ZDV2RvNFp1K0dsTUpzVFNNejZGRTZIR3VadnA2MjdWOUJLWjV6?=
 =?utf-8?B?ajhkNUYvb1RBMVhLaVJtVEJmUXFNS2ZNTXRIM0NIYjZudTRwSUVQWCtOdzQ3?=
 =?utf-8?B?Z1JaZlBQRXBmQ2Njb0VweTcvM0lOQ3AwUXl6eXM2c3RTSHhveWZIK3dCZmhN?=
 =?utf-8?B?elFhZk9vUUFwMWNZd2VoVUxtMk5oa095cE9KSnNmYVlwQ3dsa29BTThXNGpG?=
 =?utf-8?B?cmg5Y0M5Y1NmcGFDWjVYQjZyOUlUWnFKbjlvRkJhSzRsWnFMNTRDeW4wZVd0?=
 =?utf-8?B?aEdjMUU3c0tubElLbHJaUzQyc2FMVEVJaXErQmlJallWWTdDS0hHSGowbGhR?=
 =?utf-8?B?MWZBbVZGUmdYbWpxaFY4WDAweXFQU0hxbzFYa2NlNUdPdWNCeGYzSy9xWk9U?=
 =?utf-8?B?MWtHeG1yTTlGRkE3czR2MG11anZZNk9BWmx0TC8za2xyUWN5akhkaDdUOVUv?=
 =?utf-8?B?R1lrb0VXcyt5RlgraWtVNjhaZGdyR3E2NUM0TSsyMkR2cEhOVDMyRmhuUzNJ?=
 =?utf-8?B?TksyME9nR2d4RC9zQm9HNDhjaWJnU3BEZVAxdENMSFQyc3ZsTjVwN3ZidjhI?=
 =?utf-8?B?S0RsV1Vsb3VPN0xjM2xrV1dYTkxGR0lwM0NvK090ZEJWR3plRVRGRXh3U2xQ?=
 =?utf-8?B?QmxGeExFVzVudk8yVWtTbVRBV1c0UTJrc1JIVXNoSmwzcGx4VFdNWERtcFBP?=
 =?utf-8?B?bnZKVmx2ZnVPQVJiaUpYK0NHNGd0YzgraUNOY1hMVkVjYUxuMlcxOGVDZjVy?=
 =?utf-8?B?bG01R3JiNk1YVEtxZlJCRW9FalMrbkFIMlliR3cyV04rb2MyeTRzWjNLUTl5?=
 =?utf-8?B?K0NTQ1had2h4ZDVUcndESVBFdEM4OFdTSmc3VXJndVJUYVhNNk5zMlVWV1hO?=
 =?utf-8?B?NEpnMWFPcmQxNFluZTNmMUNiTURMZDlZZjd2ZU51YjVSZHJBZkdGM1JYTG1M?=
 =?utf-8?B?WkJXWGphRFk1L3c5ays1YTlQNjEwdWpMZm45Vm9MSy9uT2ZUS0tmRmtzRnlM?=
 =?utf-8?B?NEFZN1MyWkVrTzNUS0pUUW9CWUlNYnJuQjlxaWpnOVpZSnd5a2dZblpkc0xN?=
 =?utf-8?B?YmtpVTQ0L25NMzcrc1lPeGdwaDZIWTRXd3VDRGVsd1YvU2MwT0Jrc1JDYndW?=
 =?utf-8?B?bGpZN0swWWZFWHpna3RKU1VxRytNSW44R29DQVVmTHo2bm1MY252aWVYZnht?=
 =?utf-8?B?c3N0WFNjNVY4U1QzOXgyYWcyYW1XdUliNkZZcE5nemxKK1drM3B6NlVrY1pI?=
 =?utf-8?B?MHh1RkRxa3l3cUtFMFhCVm5wRDFyMDhzTTRWa3oxdDhiVk8zSWdLK2xtTm8z?=
 =?utf-8?B?NDZIMmd2a2lscjJkVFVVWCtXdXZPQUw0Ukwvd0s4UFNmdG1MeUgyUCtqQ1dy?=
 =?utf-8?B?ZVNsOG1BT2xQOVppMDJ6KzdRZW15eXBKMmsvTDBOdEYrWmpiS0JacTAxb0x0?=
 =?utf-8?B?M2FLTkRaMFpseU8vTW41czV2end0V1JJUVpxUE1jdDZhWEhBQ3dGRnpVN1NS?=
 =?utf-8?B?K2srbWFsQjZrRFFjWFhER0o5ZTAreG43ai9YZnFWM0ZhWXRwdEhsUzE1U2gx?=
 =?utf-8?B?a2wzZzkwblNBUkxmNEROY3Z6TXpOV05OTUJZamFhNW5WQlIyZ05HVWVGQ3F4?=
 =?utf-8?B?dGZVZ05aOWR3SkZPdUxldHJEQTk4aVpLMVNYYWRydDhpL2NuR0xPWnI0Y2w2?=
 =?utf-8?B?dzJXWEtJeTFXZXM4UkUzaGk5eng5Yjg4d204dzZWVzNmWDNDbGl5amFhb1VV?=
 =?utf-8?B?Q2E1d0E3MldydlpNZHRzc0RISDJsNWNSd0tUYlE0NmNrNnBDK2RtVFlwMWlq?=
 =?utf-8?B?ZFNYVDFlcFFYNWwvZGl5VVVDTEFXeGJvTDlwQnFuTXZqU3MzVmtOM3pBdVg1?=
 =?utf-8?Q?8kE1BSkiyws+NO+RE0pH5vVTTMP1Aez6LR7GgVbYQTJRb?=
X-MS-Exchange-AntiSpam-MessageData-1: SqhuU1CAdptjNQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb1ee52-71ef-4aec-d7c1-08df25fc1237
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 11:54:27.8597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXa8/fKlnU/jqww421fttYOmw7ecizH8Vk2S87QRT1LZHvBPsIuksRKYb+vT54Bmmu9qvr7sMAo3DKi5IQJe1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB473522

`send_single_command` handles both the transport and message layers of
the command, intertwining the logic of the two.

Reorder the code so the message layer logic is within the same
contiguous block of code, so it can easily be moved.

No functional change intended.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index d89f09d3f126..a27b0b41b593 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -683,18 +683,18 @@ fn send_single_command<M>(&mut self, command: M) -> Result
             .gsp_mem
             .allocate_command(size_in_bytes, Self::ALLOCATE_TIMEOUT)?;
 
-        // Extract area for the command itself. The GSP message header and the command header
-        // together are guaranteed to fit entirely into a single page, so it's ok to only look
-        // at `dst.contents.0` here.
-        let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
-
-        // Fill the header and command in-place.
+        // Fill the header.
         let msg_element_init = GspMsgElement::init(self.seq, size_in_bytes);
-        let rpc_header_init = RpcMessageHeader::init(size_in_bytes, M::FUNCTION);
         // SAFETY: `dst.header` is a valid reference, and is not touched if the initializer fails.
         unsafe {
             pin_init::raw_try_init(core::ptr::from_mut(dst.header), msg_element_init)?;
         }
+
+        // Extract area for the command itself. The GSP message header and the command header
+        // together are guaranteed to fit entirely into a single page, so it's ok to only look
+        // at `dst.contents.0` here.
+        let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
+        let rpc_header_init = RpcMessageHeader::init(size_in_bytes, M::FUNCTION);
         // SAFETY: `dst.header.rpc_header_mut()` is a valid reference, and is not touched if the
         // initializer fails.
         unsafe {
@@ -717,14 +717,6 @@ fn send_single_command<M>(&mut self, command: M) -> Result
         }
         drop(sbuffer);
 
-        // Compute checksum now that the whole message is ready.
-        dst.header
-            .set_checksum(Cmdq::calculate_checksum(SBufferIter::new_reader([
-                dst.header.as_bytes(),
-                dst.contents.0,
-                dst.contents.1,
-            ])));
-
         dev_dbg!(
             &self.dev,
             "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
@@ -733,6 +725,14 @@ fn send_single_command<M>(&mut self, command: M) -> Result
             size_in_bytes,
         );
 
+        // Compute checksum now that the whole message is ready.
+        dst.header
+            .set_checksum(Cmdq::calculate_checksum(SBufferIter::new_reader([
+                dst.header.as_bytes(),
+                dst.contents.0,
+                dst.contents.1,
+            ])));
+
         // All set - update the write pointer and inform the GSP of the new command.
         let elem_count = dst.header.element_count();
         self.seq += 1;

-- 
2.56.0

