Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CFB30C37A
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363741; cv=fail; b=TFYSHipJ4Ff9q6McYVMkOMLu9w/t5s9hLttYmCoG40yye5vBHYHlUeYSkXqM2YtkSaNsQZhPpnuihYrzMmeALZrsjpkeYoEf36v2EOyD+LCV4X+US3JsEoIIaE/9mymNBPwYS2k1mVC54t1SrYeud4Eq0n3Qp10/gkbyJZ/seeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363741; c=relaxed/simple;
	bh=TwGoS7dPld9+WqS7JNI7rlLCQrKpjNFdmyuOBhnm09A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mr2boDdjrEYaTe6XpAxE+hqp3Rfa4ELsMwZEe6AXYtlNYKUGJHgQi5FtdJyU9Bbz0BDRxEchixmxfRsqGM1jyHFYieAv0TlsgyW5FSnbaGNNENUg6BpZ2E84v18mYJvNlRPZayyQ2jDdPIdai9yHKFPYQ/xKkfEKLZECL4eeGmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z9PfH70c; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z9PfH70c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZpgrs5/qideqbMSEQQPPdzbZlqQDy5iGSSXRFQ7Rca9qUNLjEu907lmz5eW/bsC5ascojIMVRwo9RcXTcT7H2QjhrAuNva5pXH7mXL8W4YrDOhLlwND2iohNZSJFP89YARyDs1HcwGx2a5lNqqyOY53aFFQ88e4ssYFigVPPRJfhL8CbQaa9BeHd1bH9jKLYiBE86Q9RmtET1Yyfnxp7+MF62z8exVvspOJS/XImkiiL7OJEIbAaQGDSUjHxGKwbSHakO4kkFkOGEmPMhmEBE1Vzfcc4D5ny/XMHHeGOVg0J8PilI1Pa/xinGz6YeXio4/btKcrfJEP2/SUxZjYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qa32po/wDBNE6tLcSG0vo6qCwMW+O1LDJuK5X4HVY24=;
 b=NuwBodBHwTAvh3aBa2IhusAUJZKGrmN8iWfQ9ORTgi7cOTmHsXI4YbWFCSdYpSB89q6G+74YxPToplBzA/u3lDd/hqXBLI3yFZonX/P5Y7ACrTXi4eqVOdKmFcNauw2jsTMcIXrUgayfgSeJMb59t1SARlKBrdwS3v8Am8mVljVa3HxNvnq55dFQ0swZyMLz81M1vRRS/esCQ2VxtqeIoayZnqvXWorx6dL5A99yz/+XR6rspGM+ZcCTYxRntvA8LZbBN9Bab1YcNPRaDl4/KEf7TeZ4AjtsHCMV7wwW77JXA2+WvCQQpsQY9rVdFfb3BhcX1o/nfVbE4XI/HVjQ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qa32po/wDBNE6tLcSG0vo6qCwMW+O1LDJuK5X4HVY24=;
 b=Z9PfH70cYvOqm3zvTB/nA5d4R8/1O0Bnm+If+WQfOLssKze3JuoFTkX99useW2O+TsQwjKMOYBMjSEpHTD2r6xFNiiQkdQ5yt1oktCeQLLF+UEbGD4Qy3mCi7dLLWI9ih2Qotsnt1iaPxe2qkIcBW2ImzFV8CKa5IpQghj/ktMbu9ZFTKCBjKzhW0rbNVFalWF8I/e7cxZz2FQ64bB5jPlxCBEcTK0OkgoeQJyZlBL19e9KALoxxKX57EBKLLz9IOCbaEg1rIn/pmxzwlKAbPAAI4obMPLClAKmGqa6kuNwJ82PLxoCr7MEME4WwydRT6MflVhGYNNwJq6il4QUmvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:32 +0000
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
Subject: [PATCH v2 12/31] gpu: nova-core: regs: add msgq v2 BAR0 register declarations
Date: Fri, 21 Aug 2026 18:54:29 -0700
Message-ID: <20260822015448.238214-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: b5196ea5-07c1-49f2-ab65-08defff07268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|56012099006|3023799007|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	xPosZ9H8jAYXTR2EnVyL5uXTMO0ux5GLoJiL67skY+kINnJNt9AkJNYoBeEukVdFBAWM1nBz+jKeqSm1nOVw7xTXR+TFPN8QMx+XlI/Vf6LwyZw/pCnXyvldLgFN2Cj3p5FPTTugDtlYuRh+RLxdhOccRfwVN5B7LoGJcdtecYqUuRBVrm27Ua2wi1/pXcUrHnzujjAhLXTg7lFgNVD79qiFRH1FTBVtCLOnUBKSqNawCSginPsMuvsg5CH5djqePNTcDoNJCKLWjViYElXQhzrvGed7CJ2XE53DcqEtJM9VtOuGdycu+x6u3pJI1o8x//PNcrsaE0bcxNOrP4FQze+CzX8tPomGnWDOpaNPIUMTGqrLhQgJWf+L8CnNFSliLBkdeh3CGxydioKxVWmdSem5ebc4JBK95JQ0ZebiHDx1cfjHM17yBIQGT2IW+jiW/5pq47qroxfMza6VKTJE+/MSvbLGjKE6/CayvXGvIfncH8IgOpnL+OIXcSsI8gqQ8frQQHkALTvjfYbe2ojMZuGZkxGljd1lkVewhOYI1pxVaXzRjSQLLWdefnoW0ozttrmu44z9+X8MfVxCOXaNSGVNTlpJ0ns7OFrK2dVglGAFK4WrI8cKKx88noH2jh0BOTIP/cleskfFLr3VFkrNEGvW+9Jl1wnn80p2p7wI7/E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QIvHEhAFgWVb+ruYBjaIrtk2O7pAjtPNFwITxJ2fFv0z0j5Zb6FXznBCQIp6?=
 =?us-ascii?Q?2lZ/kvQ93me+Te78LxUNGJJVp2QkZBLgW2xslJ6xlUE6cF9RaXmTRTa6cSsB?=
 =?us-ascii?Q?qtH0v9Je15Hb7Lw059ToElv9CMXWCgM1dBi9A5wfVUnPBLAXO7DoVRgLTDRO?=
 =?us-ascii?Q?mPXCHJIi+hglarQtPIedGI5rzmhWYpIMe8xMSWo6ojA/08dgv5aCXbnI0x52?=
 =?us-ascii?Q?FGEJvFiF7Ve6J16N73KOzKuypirIHWGjnq0RMx9ffZsJFCnvcF8dSD6AFIXy?=
 =?us-ascii?Q?DkCmD0MKOb7x1eq+7sBizvzfvzE6Mwe/yS1TSWeQuf4LyV8kmXYfXCUVPuUc?=
 =?us-ascii?Q?4RDccQjyV+GhILxRm0tc2oF+7YTQ7IX1VykvN3T7MJpqaxvMYpGVEG523cqU?=
 =?us-ascii?Q?Pfe042kbVBI2FPP1fusdQqUy0HRX9BcBgMpEivVWOWQozPW+U/JJbGBqTpKr?=
 =?us-ascii?Q?aK1i7yRz9CAIZpV4Yfw634npSvKaQurmE0pqMqTMYnDSLjoYfeBPX+9knIlr?=
 =?us-ascii?Q?Olw/qgLzxBXODRfnc9/9uvn78042Hq0FKAjPlrBMHpc+YTjr1uaEAc3Bi+4L?=
 =?us-ascii?Q?dkGQiEsILrQCQvFXsRMY1jXJh2COap4UVxqZukUbbKyKnJTHLLWtPNFYdq7m?=
 =?us-ascii?Q?hCUg3LwueXpVRrshHxxhGqU+uTmzle3AUvhAHhhC7TdHwCNrvYLEHSve0lYh?=
 =?us-ascii?Q?QJSjAGKcGNZnUt0l+DFRz5GZRR6twfHkq6f+DvcASxecbrZhgyz52E0BNsQ/?=
 =?us-ascii?Q?vvz2zewTZITxeRw1wuxHsQqmeXKbNSJeC2aR9mDV/0SsdVRqB529gXdijEBE?=
 =?us-ascii?Q?eQ4FsqrtS7ceLtedMBRVQfkgsjb8VVac0YdDIacpf6svl1hbzykLGCOInoH+?=
 =?us-ascii?Q?AZfZTred6aBfYMUQd6dGLvzNqnqzlMA7DQC3mrUqNvD7iKpHmkk7L6zrMGKt?=
 =?us-ascii?Q?yflFtZsZKJm49bn7HpvneYxXUDnsEqjh1ZfOlxoFtB2+GcCh1ireB+T1Wxzx?=
 =?us-ascii?Q?qYV8ZgxKOPXD4lNnaPMCNcKe+rWQ93YIRDOMLKQ3Dv1TVuLhjj5KCdPKWIZ3?=
 =?us-ascii?Q?cqyfes+fI8Hqrt4Iw8zlLvPsoJfJCAVswsy36e5mms0qiEFA7p2wWXK2SuBN?=
 =?us-ascii?Q?zJyBGPbF+uwYXkXoluNxyjQp3ua1U9QcZCw3w0OR4s/MMPtMea6IPrx75Lcw?=
 =?us-ascii?Q?WQhbDbv6UaSlH5IjPHiMz9SUSHiQeHqecf9wfOoYYGOjbB/0geRqLMQjafLt?=
 =?us-ascii?Q?F9If2pJzS+AFQMPYRGvzpDPtTMGqRBqIUzQyMTKxHKmp1NoGrDABBH+EdQNT?=
 =?us-ascii?Q?SlN6jHJVKjwKEcY688K/77n4e6gDK27ZjRp27NlPces+iSklO/z5W3xLZ8rk?=
 =?us-ascii?Q?cakwHd1Qa+W3me+jQy9m8cfkNIAGf1IjcJgHJ8hGismqfJDReUFUZWy/hf6w?=
 =?us-ascii?Q?sgEyx5aK9yiZil2R9nkaY57kSng7m+UPY/qUzwSW1ZVrEsay+uq2Hc4au09q?=
 =?us-ascii?Q?0e8GE6Ye5N7j5aXMFnuhasIrcxlNmQ7amnqeHBRiEAKqx13gSNuMteL4tEEO?=
 =?us-ascii?Q?bdKkgMepLiddU8cyYGwwpwksqa0JIIriTqXuxkjvv+aHw0EgRb+HKuErJuDR?=
 =?us-ascii?Q?1+2rRVHC/4g7YwagWPLEAj5zXFgYC6eimjbJlXusI24r14ct2iXYtFQ/mWNT?=
 =?us-ascii?Q?mbBGoEmyrExOGu9WkredLrXd6IRCkoFs0+GU2BkK0kLpkmFsL10pkqI/NY8k?=
 =?us-ascii?Q?EbVm/agDRA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5196ea5-07c1-49f2-ab65-08defff07268
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:31.1121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KscnBlPnJLK/lF66pnBgI1yzDfjvWmtPWS4vefDUVz/yFuStnoCC+YG7a7LFeWw9krTXWC4Ko+eW4fx4QeSnuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

Msgq v2 moves the four ring pointers out of the in-memory headers and
into BAR0. NV_PGSP_QUEUE_HEAD already exists as the v0 doorbell, so add
NV_PGSP_QUEUE_TAIL, NV_PGSP_MSGQ_HEAD, and NV_PGSP_MSGQ_TAIL at the
queue-0 offsets.

Nova only uses queue 0, so the registers are scalars rather than
8-element arrays. A comment records the full hardware layout for future
multi-queue work.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/regs.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/regs.rs b/drivers/gpu/nova-core/gsp/regs.rs
index 9a48aa87e7fb..d2e40ed13123 100644
--- a/drivers/gpu/nova-core/gsp/regs.rs
+++ b/drivers/gpu/nova-core/gsp/regs.rs
@@ -5,6 +5,18 @@
 use crate::regs::NV_PBUS_SW_SCRATCH;
 
 // PGSP
+//
+// The msgq v2 wire protocol replaces the in-memory ring pointers with four
+// BAR0 registers per queue:
+//
+//     NV_PGSP_QUEUE_HEAD[i] @ 0x00110c00 + i*8  (CPU TX write, doorbell)
+//     NV_PGSP_QUEUE_TAIL[i] @ 0x00110c04 + i*8  (GSP TX read)
+//     NV_PGSP_MSGQ_HEAD[i]  @ 0x00110c80 + i*8  (GSP RX write)
+//     NV_PGSP_MSGQ_TAIL[i]  @ 0x00110c84 + i*8  (CPU RX read)
+//
+// Nova only uses queue 0, so the four registers are declared as single
+// scalars at the i=0 offsets. NV_PGSP_QUEUE_HEAD is also used as the v0
+// doorbell, which is why it predates the others.
 
 register! {
     pub(super) NV_PGSP_QUEUE_HEAD(u32) @ 0x00110c00 {
@@ -12,6 +24,24 @@
     }
 }
 
+register! {
+    pub(super) NV_PGSP_QUEUE_TAIL(u32) @ 0x00110c04 {
+        31:0    address;
+    }
+}
+
+register! {
+    pub(super) NV_PGSP_MSGQ_HEAD(u32) @ 0x00110c80 {
+        31:0    address;
+    }
+}
+
+register! {
+    pub(super) NV_PGSP_MSGQ_TAIL(u32) @ 0x00110c84 {
+        31:0    address;
+    }
+}
+
 // PBUS
 
 register! {
-- 
2.55.0

