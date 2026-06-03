Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919E03A75B1
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471849; cv=fail; b=nRdnyutXCwL4mqdp0soYZG1/vIuWfddCk4v+PRQXQwqyZ9AO7pJNOXND5Cywh/KxFyrp5arEQEUPyXuSk3TYX3etOjbw6a7cLX9l/JCLTiGRKVTlKz8n3VbUrAg+CH5bEO7I8xtpuSqaxFfrHZfezJUuLRoIsO6PuvOQRhxu+gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471849; c=relaxed/simple;
	bh=mxLJo+UeCeEE8s7ET7e1bu/5a8r9exqAf/3pajEW1Q0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KVjxrVOSWN/x2sa6hSVInVVcls63gOmpwOSOLvpJZSlEjiPmM0JBEyUsEK6Ihe4/R5yWfYAwCRAZw6lXf9ohhcrh9Oqlia1PG5Zb0AZZrumBlHbU9zZ2FGon7MWCU4xZMnYQb34B4uoA/yRJ+R2lqWLgkz+6+DLDMUBpixcBzLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ciJdjhM8; arc=fail smtp.client-ip=40.107.209.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ciJdjhM8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sc/okNDT8NApxSu6d5HeVKXzH1bqVlE+E6rNVtwzDywLkJZqTQxgmzzX/z2i7mkHZIvluYDzQvelx4xsbp9ac74lajHAf+rC1xw1Tp77nh0MP8tYWbBfEwoX1D+VlBFbV1cFCqmxGI52U1DMZ6TTXdUXh7V8mCdaFp4JkfiTZU5JQuYhxrWmALYXFr1nmBOZMn3P7NJBr1bFSylQ18jG92YqVcpF2IHUALFsPpsRIA/2tT96KBy2i0oVbkbU1OEfxEHP0A3ijDA280K7UwFB3/1GLf2L5AXeC+Pp2cgSH64+M6v1qgtFGeou31DE82p8ZGVmxs8zCY/JtgEA2R6FWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eHMLElE1RlhGVlNDlhMTw5Y7yNTl1UFC94xfggQLZI=;
 b=CHfSVoNWyZYOo/vPnfdrMuGeC1jEwK2jNximx30Gu6Kx0JloZkvLcmSurHryriY8EFa+2HZkvDvUpJJ6w7+949bP5jXWiJrR2mRYepC24fKggpDLYY4audjknGeE5qLTP0GKKNt3DIXUiPFzmNVyVGX2CqSNavZU3N/nnlanMS762PF3d/KoQy+opWjjWT2LF3XfA6fqVZ1W2LhKBUo+W2iBtc5PlTGXJz5fdSt67IcHnwQ0xY0CdaRq30MvxdkjUGPFahNE/UN4GavkDb1OdwBw0NNeH2iMztCpnyWgfZp13W8d3Ag1mkB2PGCsQTVpDz8y/+obglQNW/NCmLTLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eHMLElE1RlhGVlNDlhMTw5Y7yNTl1UFC94xfggQLZI=;
 b=ciJdjhM8V6Bopsaq7xhKw/R0v37/Rfe9UeLf7IE70XYk3BKgveKRnujr6HpVB0/zeKM7j/aqD2W0dYEkNtnaXef6SBbjZOzmHbe0LEIyU4+e8y6tSaevk6CCb41cmwHtVj1OMnElcSBR1aH3VoX0LVAgaY6lyAlHPgl7XimzOHj5ZDG02IfJxosna3SRxUQ9+Zq1f5AN2Rc6sfWp+N+hu3vE2ggk2cwWXYIugBAMHix2CnmaemflPyrd/zI1CDbM3L4UP6F3FfH5gYpLFR1Me6cA6f6WA0gD8/1BUwL/vTYa11v0mavMIftrdobdg8OKpmbTx+cPv/esQc68lRljcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:30:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:30:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 03 Jun 2026 16:30:20 +0900
Subject: [PATCH v13 3/9] gpu: nova-core: add MCTP/NVDM protocol types for
 firmware communication
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-blackwell-v13-3-d9f3a06939e0@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:378::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 820ecca8-93c6-45e6-d1c2-08dec14204f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	W8unpGrXprLXoTpEHIZgsdtSj24WfTMT/154jlNQB6YLCeGgELBj20sC28e1YdJSGkN+F90S7CmlMEk4MwNUR71TTooniE59ilKenJ6cm2Jbvx8Q5AVICubUAC3cuH9NkoF/rIpKn9zlR2jHaibv3OOPnr3wCTfLD40PbplwewWDL1dxb19UoY3980bsL1VtSe8LpjzThLilLSaC3R6YgCwzLEutYeFwMHVoiaOalb71Sate+A8lWIzTC/iey/u6r/Y1Nb96S3rDqrerXggBErbDcAoLmY+MuOs4O/8BZs6180NUmBKk7q0jdr0jAkx4DU9NUCiwVG+YVQu6nvCLDeLdmOfy/tHslmNg9k5UGBLcra3CyFiwKSiWD6JUXhR6FhwWwd3u4GMhJAegtEPl2Aaz4pGvKH1KCdazH9QsX6BFjZoxmCGrj0Tb5SoJmmmcglIAt5vJFmiKMHYL6uoRgiiXQWbUjibRoZ7KwZqCHBH+pI5C4vZjMev1d6u6oeiKY8aoiQ/lIe0ah8O0J3ZxPzyeAkpfUpBVydQUEaMYUpNJynCgWqQkAC0NiEwiBSDbBB6B+HgPvodGYnocKAFh5C3LdT5QgFehjhuDGm7V+tl51RHc1ZGltq2pkKKkKYC/3crw3/1ocJYfz8l/axcXdI8PpNtNi79SOdk0wFrKPClPIrMnoV4HZpD8gi0y12dK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWlVY2NjN3U4bFRaaGJkT0tZWDFBbjRqcWp3a3NhL0xXaGJkY0RrNEFVbzJ4?=
 =?utf-8?B?UWN0RTVYUkZva0V2Zjg1V2M0MytaT3RtY2RvNUhyQ1FRT3FoOThvOHBzSTNI?=
 =?utf-8?B?VDdDbEJ1ejFDaW45aVFQRjZ3R1g1ZnVLUTBUeDYyYXJQZWRWL1IwcWlHaHBZ?=
 =?utf-8?B?dmQySHVOQktxZjk1QWlidUc1aE5PMnV0TUVQNnNZZFI5dWJ6cXM4d3l0eXpU?=
 =?utf-8?B?SlFsNEM1Ny9nc2VpUm1pYnUybTMzL1lNOGVFTmpZd1h0aUo1MFllMEdRWWlH?=
 =?utf-8?B?alhob2RrSGl3bEloZXB6Q1RxNm5rU1JZb0lIUXdNVzYvOW5nYUV6dnlwUUZM?=
 =?utf-8?B?VC9kNlBwOGZrUFdYaHkvd0daZ2hRaGNYN0ZtTjlBMzJ6a1FnMkxjVHdXRlk5?=
 =?utf-8?B?VlhxVzdKd21teUVFaExVcnord0NIODQ1U3NzektFWWJGbDlVTWNjUjRZU2Nk?=
 =?utf-8?B?b1g5Zmo5WEJmdkZvblJjRXZ4QjNBVWJ0TGVnOHY0UEpOMi8vMmxZWlN4ZUdS?=
 =?utf-8?B?QlUzVFJxNVlNbEpXOStGOThDTkZURUM4cGZiazEzOG11RmVyb0ZVa1hLSzZH?=
 =?utf-8?B?anRxY0RqT2RJMVNGbG9wcDRUK1QxVlp0ODNmL2FkbkMyS2hDbEJRYVlUQlln?=
 =?utf-8?B?SStGMVNOMmQwdmY1aFJHTkI5ai9TVVRiM2NOOVNqV3A3YlY2Z25CTk83YW1I?=
 =?utf-8?B?b1BpbklvNURFTTgzLytSMnZ2OTJnSTFtSjhSaUxIOXVVRG9pb2l6NUpuenNz?=
 =?utf-8?B?cGcxbEQ0SFJ4dDRkakt5WHZ1cEFWd01JOTNEQ0I4TmxydHVnYm5kU1hEUW5U?=
 =?utf-8?B?OUFjV0k1M2ZzSFR4TUMvNGpORzExaUlIT0Rrd0Znd09LZG1xSnNWM3BKRjBm?=
 =?utf-8?B?ZE1sNDV2VFFjMyt6cXVBUHlVSStpMG1ENXI1enYvc2tFWWdLSlRFTjR2NlhC?=
 =?utf-8?B?dTNrOWlla2E0U2oyL2tINnlyUkRvL3ZDZEYzZmErNW9FSjhVNjcraVdya2I1?=
 =?utf-8?B?S3dzOGxYMHRhTjR3ejNjaWU2a1VlUkZFZUFaSXhZb1VJWVg2Ujg2TUJUTy9s?=
 =?utf-8?B?VWhxQkg5NGtiYk1TQlpmVEhWbTYwTnExcys3UXViOWN6dkNENlZRZU5oU082?=
 =?utf-8?B?dmErRzJnS202Z20xVVBoRE9SeGs1eE4xWDVya1U3aTNIeGlNQS9mWGMvYVhP?=
 =?utf-8?B?YUxOQ1dvK0dWNFVodjZQMzQyREwvczN1YVpEZzdTWkFnUS9ZWEZhbE9QaGZ6?=
 =?utf-8?B?cEk4aTRKTThIRWpJNkZwVHZLYXdMdUFESGlxaysrZW94bnNJV3NlbkIxMW83?=
 =?utf-8?B?SW05K0ZvQXRkWVFBbEE1OU0vUWN0Rk9TL0k0Tk5PU1hWQzZ2VlMxVVhTenBJ?=
 =?utf-8?B?VitmeXZGaFovYjREQUQ4UTdBOGQ4K0srZ2tXSDJnRHJ5MWozdHJmaFViZmx0?=
 =?utf-8?B?NjF4L3ZNLzRTQlJmTm5PcGNzdFd6VFJuT0tVVWZLZ2UxWHRQWUZJamZwTVMv?=
 =?utf-8?B?MGJmMmM1UkZXeG9Xd3d1UlYyY3JoeXdHZlFYZWJJbFJwak5uR2VldE4zYW5y?=
 =?utf-8?B?Wi84RXNZSEpjb0pOUHc3MVdWMmxCZWZrOXgxWDl0V1NmT2NsQVBjOHF6RVBr?=
 =?utf-8?B?d0w1dFF3YTFEbEhXWkpMdjQzQjN5d3VEWldSY3JZaDFFUHdkckc4WkhaZkJW?=
 =?utf-8?B?MnhuajFNM1h1aEJrRGt3QWJNNi84RUFRSzNoN0lVOUZEYngzQnVRa1JXV0ZX?=
 =?utf-8?B?Y2VuUXJZVGxERXh6UWZhVlJTQys1WWxPRmxrMHk4MmRVMnBqeVgvWnMyODI0?=
 =?utf-8?B?U1NLTFhqcGdGV1VIdG1aOFVnaU14U2dtUXliMkpKazZMb1FreXVDdkpaeFhz?=
 =?utf-8?B?SDcwSldxQStGaEtPQjdScGo3OFpYYldMMWVhdkNnSjlSeW0rMVpGTVJXWGxU?=
 =?utf-8?B?RkxSQ09vQnVUUzB6RU9VcDRVOFd5ZHRHZFR5T0l6U09oSEtXazdFb0tZbys3?=
 =?utf-8?B?VzVtK0dZMlZFbElqOWQ0Qk1CZHZ5ZDJIR2FoUlIvd1ZYVHlhVzhnQ1g3Mlpr?=
 =?utf-8?B?ZTFoaDNTcUZmZ3JVc0VCZjRudkJ5WEx4N3BPc1hqcVViZVl4dW1hdWZxVlpR?=
 =?utf-8?B?MWQxS1cyMnJSb3RHTUJQaDNnNERSVUl0QlIyWGcrb2FEd0F5SlhTU0JrMkNM?=
 =?utf-8?B?NkcxT1BmVks5OUxZTjdBL1ZwTVdzeHAwS2dGUEdUZDIrTlhOaXY0U2UwaXhJ?=
 =?utf-8?B?bDhCWWhCZW5mWGIxdnUwOUpvTHdtaFc0ZC9BeWtlQ1J2M1JCUlVMUFVZNnh0?=
 =?utf-8?B?Y2tvR2g3U0I1Y1ZXWEJVTGgzRUhEZ3g0T0szS0xlRWpuMnJDWmdBb1VXMEJa?=
 =?utf-8?Q?9O+sh5CPFopzdBgKLEuvSHD25vvNH0tmfNwbyKvNO8N2T?=
X-MS-Exchange-AntiSpam-MessageData-1: FffRy31We/5+rQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 820ecca8-93c6-45e6-d1c2-08dec14204f2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:30:43.2817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJAa5CCrNdHxmvLUixCD0Z4WPD9UEKkMpmQys/BVqhBWkMUf+9kAD+x6jKdRFP76EyVYG95oewJUDKJyx8L+kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036

From: John Hubbard <jhubbard@nvidia.com>

Add the MCTP (Management Component Transport Protocol) and NVDM (NVIDIA
Data Model) wire-format types used for communication between the kernel
driver and GPU firmware processors.

This includes typed MCTP transport headers, NVDM message headers, and
NVDM message type identifiers. Both the FSP boot path and the upcoming
GSP RPC message queue share this protocol layer.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/mctp.rs      | 90 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 2 files changed, 91 insertions(+)

diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
new file mode 100644
index 000000000000..90e289d4c3fe
--- /dev/null
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! MCTP/NVDM protocol types for NVIDIA GPU firmware communication.
+//!
+//! MCTP (Management Component Transport Protocol) carries NVDM (NVIDIA
+//! Data Model) messages between the kernel driver and GPU firmware processors
+//! such as FSP and GSP.
+
+#![expect(dead_code)]
+
+use kernel::pci::Vendor;
+
+/// NVDM message type identifiers carried over MCTP.
+#[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
+#[repr(u8)]
+pub(crate) enum NvdmType {
+    #[default]
+    /// Chain of Trust boot message.
+    Cot = 0x14,
+    /// FSP command response.
+    FspResponse = 0x15,
+}
+
+impl TryFrom<u8> for NvdmType {
+    type Error = u8;
+
+    fn try_from(value: u8) -> Result<Self, Self::Error> {
+        match value {
+            x if x == u8::from(Self::Cot) => Ok(Self::Cot),
+            x if x == u8::from(Self::FspResponse) => Ok(Self::FspResponse),
+            _ => Err(value),
+        }
+    }
+}
+
+impl From<NvdmType> for u8 {
+    fn from(value: NvdmType) -> Self {
+        value as u8
+    }
+}
+
+bitfield! {
+    pub(crate) struct MctpHeader(u32), "MCTP transport header for NVIDIA firmware messages." {
+        31:31 som as bool, "Start-of-message bit.";
+        30:30 eom as bool, "End-of-message bit.";
+        29:28 seq as u8, "Packet sequence number.";
+        23:16 seid as u8, "Source endpoint ID.";
+    }
+}
+
+impl MctpHeader {
+    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`, `SEQ=0`, `SEID=0`).
+    pub(crate) fn single_packet() -> Self {
+        Self::default().set_som(true).set_eom(true)
+    }
+
+    /// Returns whether this is a complete single-packet message (`SOM=1` and `EOM=1`).
+    pub(crate) fn is_single_packet(self) -> bool {
+        self.som() && self.eom()
+    }
+}
+
+/// MCTP message type for PCI vendor-defined messages.
+const MSG_TYPE_VENDOR_PCI: u8 = 0x7e;
+
+bitfield! {
+    pub(crate) struct NvdmHeader(u32), "NVIDIA Vendor-Defined Message header over MCTP." {
+        31:24 nvdm_type as u8 ?=> NvdmType, "NVDM message type.";
+        23:8 vendor_id as u16, "PCI vendor ID.";
+        6:0 msg_type as u8, "MCTP vendor-defined message type.";
+    }
+}
+
+impl NvdmHeader {
+    /// Builds an NVDM header for the given message type.
+    pub(crate) fn new(nvdm_type: NvdmType) -> Self {
+        Self::default()
+            .set_msg_type(MSG_TYPE_VENDOR_PCI)
+            .set_vendor_id(Vendor::NVIDIA.as_raw())
+            .set_nvdm_type(nvdm_type)
+    }
+
+    /// Validates this header against the expected NVIDIA NVDM format and type.
+    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
+        self.msg_type() == MSG_TYPE_VENDOR_PCI
+            && self.vendor_id() == Vendor::NVIDIA.as_raw()
+            && matches!(self.nvdm_type(), Ok(nvdm_type) if nvdm_type == expected_type)
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 7b6c331da10e..9f0199f7b38c 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -20,6 +20,7 @@
 mod fsp;
 mod gpu;
 mod gsp;
+mod mctp;
 #[macro_use]
 mod num;
 mod regs;

-- 
2.54.0

