Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47178373C12
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693663; cv=fail; b=NzzYIZJ9kNKXeQaERVxycKvokrSBPn/U4GN3/Vv0rNll9EJf4DlEmJcJJrXzwchAaejtGl2yjLttD9BONj2IfDM9zdyNzpJ7cRqrS7sXQfKI6vD0QDMsZnfXsf0NUpd1YXo/EYpjs/tKMCCMn8d4nZH9fGR0aGee/Qyg9A7vj64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693663; c=relaxed/simple;
	bh=6FelJ9mPSKfqPyqHdn8frYfSApp7qkMJqNyZFVI/hXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dnJRtDBrc7g+maRoqpezcOsrLOT/KJg9sd1P2n9fbsrDHv64gNsE4wS7MrdBZy2fTaDdtaaBeKKf4mkc1nWd+iEEV0LJvtCzhgaI6mpZ2oZMZ7jC1XIldSx0X4x9qqGpBeZUQANTY/WEBy6K/I9Pg0lw2Lwk+mtQ1NvuxgVU8nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VryEjDY3; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VryEjDY3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajULNqOsATmS0cfsfnW+OVxG2zLPKsIWchJPATEoXq4xTKbft/mTXdP4DuMGh5SRbhP0Tq4V1GYM09rU/3mv3wYlcgCoxOUrLG/2wQCH+wSETVg9kh3NyZphpKWn0d/b53+6ETTlZ7O8G/NMJpRu7KEbM1JFO5rYO6wTcDHK66Kt5b9NOwUM+80DdIBojjv9GjaZbRMTHeBl5XZZZoGyUxPbYqBl+RIS/n9Czoav5Al5FCbS/SdZxMuxkbkYoeqWqymw5Qf5pEM3MAR5Nchs41D45T7YRPAtN3AKJFixqdpL8bYB818SG/ZuYtlPH8rit8o9IAc3i9P95aemhpx11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyr5X2o9EdPsiKN35s5i3Hun+6eHEF3YGQOe+ynRRqE=;
 b=EkDaBhPog2HW3skXBnJPONLuKWhP9UYi2z/SguLFd7eCvvZ2ZRPaS0tQpJFmDZWIGAFZDmuoh8ENz7zccoLBzzrTseVr7Q6MKnmwTqmTLCnuzsOSTnhrAqp4Zd7StCsa3p1MLk5O/LjGdSBMbX4pufm4Q2bU8Uv30w5dOK9t7PSy3lCyvE4YyqftL8SNBrUlVMVJZiNcx6WT03bTP3DwItAFVLyFGiOkREz5bIjtpuooTKVB7YzAQD3nYEBOVKeWdnLFZzCyR8vhDIYHo1UmdbtsD4WwDZHKYYlMbJ0T7D8mZV+a4ju2uFrw1PulJxc2wBcpE7ZhsrYERG6yiUGwjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyr5X2o9EdPsiKN35s5i3Hun+6eHEF3YGQOe+ynRRqE=;
 b=VryEjDY3umBpmZrtpQJXm2d5+UZkLNbzKVIGY5lJEP7mZx428uEAtRgPvUZgjiZLWauXENkTSwEsUqC8GPK8zPUhvl8iHp6zWlSudYD0duOusfFobvZxb7u5AfFKOx3xqFKZ7eU15GhpyiAs23ZP2Madzas18pJhqDpkjljEssAFMYFBk9BEk0qaxLrDmk9VQWUAF874LPyWHqhnkbNRulGeGNMxBtUoZORy3J+5ql1PHSh2euOW6DYNDWwAEDNtWwR01GSwGCkbN2AQ0xr+TRo1XS7FsWBHewyPjvdHcm35zbQ9iVS1ZLV9hILzBwferrjblPFMX3IObcLdyUXyCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:30 +0000
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
Subject: [PATCH v3 05/33] gpu: nova-core: regs: add msgq v2 BAR0 register declarations
Date: Thu, 17 Sep 2026 18:06:51 -0700
Message-ID: <20260918010719.1176945-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f45647-c904-4bb3-35f4-08df152136bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wwKhYyHgcnD+FHcWvG9msaLZXmBFcSys4mfXbHPJHRtJtAVmzp93n/e6ZBtJXApez9/gr6t6iC6/38FjrkRC6kMyRtZwB1xIcWi4hKibz0K+MWPMCfFrM6LHfVGwZg/2uLO9Z/TTfbo3TvEF4L30R/UxmLcR8P+SHGrt+uRBEa6X6bF+dt2Zf6BQcRi2MdU5HyHdAxW38MvnyfR0uwEP7af9sLVdDonBOxCRpjIlIsfsA7rjkh3pXEp1ErkCPas8czxLGD1uQaRZonoFqZgf+nuwWMgQAVjjAT0emibwZZsLb2Ce54KcmNgwUCGr38k+lGS0uoqx+OH5XioH90xCT5p6vIkfmDUv1Yrm6anLBotsqQezDToRDZsGtAA4HKl0su30J3fGPTEcCHDdi4k835ogZcpl1LNocITRxmD0tvykEJfjcd+9T/KdqEVGFbBbwZJ1dD21iu/BG7qVajbN2MCIZeDo2oP8rmiEo0aX8itsoGIp0SS36mJjV9ZaeSSsQcvEalETWVsgcjJyO+6ZTzXJcrCv3Q2glJZEBxj/r7PHZgYvEKY90DFZTyHpoAkbSq2qKVk77nOEB7W73COMXZoTINvAYJ+tlyU/kfLTr4Q746DQpitzOy6M42WneSxTFn2Y0CWRecCZ01JxQUDLt5veOQmV0mdwMqvzrompDyM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uxSRJOcN9wvUp8yYMpdGAKKuuAinoDrfV1ettuekgXgeZOEfZUtsmWlwWm7M?=
 =?us-ascii?Q?UpurjDP6NICrfsL+6PccFcDHDW+2pHE10iD+d9KZiKlK6HBWA4Dj4MR/KaPF?=
 =?us-ascii?Q?N5M+Pb6qSQNGcFcaHTHdUeqTJyin3zBVjaNFsv88mjthcp1ri+ZlgK9R54eJ?=
 =?us-ascii?Q?tG332rNlSC33mKyXI+fJJYLMsvG8X+fF0I5r8BNVHqgZm3hV2RrXx40mcb8P?=
 =?us-ascii?Q?QvHWBTsXRj3+ChwEi1TwtHsbPGcThR1z167VCjiUAMQ/2GVFVN3W5kEWnFHD?=
 =?us-ascii?Q?UI6XU4vFpN9vZGYB5ko98SX492ZGC0FoXE433m0Yhha0uDk0igbC/NNGuvdE?=
 =?us-ascii?Q?muKpHoJ9+aR4EAMxC2jReWYH6F/uI6KwgFC/MEaC4bXt2pQ9TbXz7LBWEE9b?=
 =?us-ascii?Q?Ei9V/8+ktbXPbY6ODM+Z9Tw5SpAkdALOne2caV9OvXlI+3h5GljpUciLrcxH?=
 =?us-ascii?Q?1a42rbadFfPdN1+95FHPsHiTqbQXd2xo6+y71gK6JYM4DG22Gh3okqRQMn8t?=
 =?us-ascii?Q?AEMzkA4Kp/WtuOgU2Ueup11ki+L7D+Xy6zaW3TclayDy5GKFTkEmlVM9pujK?=
 =?us-ascii?Q?G3ayEGEQ3PSCnAyqpOdjPtw1iMdwA0vD1wdrGaEDqVT/CsmbOPoukQfkQszk?=
 =?us-ascii?Q?0IB/8BR8lFxSh/coxjbzhLaE47YoVFC4jdcjbyYtOox3Bp+Ddjmz/erj6iDc?=
 =?us-ascii?Q?vPqroUDGvvbPV86my1TXGhzOqbU9aSh2eFtnJV0318GVeQd9z6h1qffmRB49?=
 =?us-ascii?Q?dphhF5kF48oV4+v9iI7ux63tcwijZNaoaMUKZnGvE+fXZAFg1fqDRrs4TCG1?=
 =?us-ascii?Q?gTvYa9x45KRFcq2lwm7H6Ja8CnSOhKxUdtoSo7A3ELtJ9h5shkJffVE5DRtb?=
 =?us-ascii?Q?dhp1+VbOD7v545PlqPv0u3uEWN9rHYuwzEnPnWsyj+eJ9i8KNF++fc+5RKin?=
 =?us-ascii?Q?VsZGhSZj5TTjUQLSgM5xvHEuwrrvg6Vsq7gKbpD9UFemWqFgsmFbufLlf0LK?=
 =?us-ascii?Q?xmr44c3ITfcoDdcHJbtMEQrVAkjpjMzUxm9T4yx/b2Wk9BjdALuNZDnHiXec?=
 =?us-ascii?Q?l60b2K4lVDoeJRaK25dpvT7EWpqqSAzri7P2qWbbuhqNSRWB4itZD3ar2Ywo?=
 =?us-ascii?Q?ebLAbDqIf4fqAEyzzzZEs/EmnFgG6fT5pbHt06yHEg1PesSR9dpK+hZX3l/N?=
 =?us-ascii?Q?BOOdbBQMsI0iv3hUzSa9C+K+a0l4AUXmmeycfsN2TIyoiJoRwRWUlDirt9z9?=
 =?us-ascii?Q?N+1nNDmhn4H2/8AdzXYsWf+qCD751ZL3jCsI3quKNPQm61RJ0ZhWyhZGPECG?=
 =?us-ascii?Q?tsuwDqLiH7To06L4pVWh4jPbSvpRXl1ivrZH1sqRK5LOIPEWBbeX3br+5C97?=
 =?us-ascii?Q?bHuI4R72RvSOGTM/Ye8IXGA1eRwsn/dRsRyrZDOYGwYF6CXNEajbgBflsotE?=
 =?us-ascii?Q?t7sPltgmNl2RJ4qHhMg1qJ21ahhvA9A9GEqJ3LoxQ3cE8giEnamOWpLmFlfN?=
 =?us-ascii?Q?KTIbOj5+97wP0QO06X+kyOZ5ti3HpTgCknP0/l5XinTwuN7YKZt9ZJWvqK2l?=
 =?us-ascii?Q?dMxo2FyxkEJqmDKenB9oRuofnO6I1rDk54m0Qhe9P/E6VzGFNhtEgZlmeaLt?=
 =?us-ascii?Q?XorE8wUmtNKXZsxkf7ETWwOEX+o0ws00Dr/achRr1rz4APp+BtJqfMcql8yi?=
 =?us-ascii?Q?JiSBF+kdhwuvkx7OYshjBQ+L6TD0CYsqeiP2a5wAXgtRnvTDhRN3l6qm7Mak?=
 =?us-ascii?Q?y7UwmwPVqQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f45647-c904-4bb3-35f4-08df152136bf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:30.7786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VnhUFNfRkmoNIYoB/5zCNF52rOTj3j+PMSVCUIwGHCraEQXYYRlRrL7y194JbSTL8OxMpjMy9plu6qBMrRTiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

Msgq is the pair of ring buffers in shared memory through which the
driver and GSP-RM communicate. The command queue carries commands from
the driver to GSP-RM, and the message queue carries messages from GSP-RM
to the driver. Each ring buffer has a write pointer and a read pointer.

Msgq v0, which the r570 firmware uses, keeps both pointers of each ring
buffer in that ring buffer's header, in shared memory. Msgq v2, which
the r000 firmware uses, keeps the four pointers, two per ring buffer, in
four BAR0 registers instead:

    NV_PGSP_QUEUE_HEAD    command queue write pointer
    NV_PGSP_QUEUE_TAIL    command queue read pointer
    NV_PGSP_MSGQ_HEAD     message queue write pointer
    NV_PGSP_MSGQ_TAIL     message queue read pointer

The GSP numbers its queues 0 through 7, and each numbered queue is one
such pair of ring buffers with its own four pointer registers, so the
hardware has 32 pointer registers in all. Nova-core uses queue 0 only.

A write to NV_PGSP_QUEUE_HEAD also interrupts the GSP. Msgq v0 uses that
write as the doorbell, so nova-core already declares NV_PGSP_QUEUE_HEAD.

Declare the other three, NV_PGSP_QUEUE_TAIL, NV_PGSP_MSGQ_HEAD and
NV_PGSP_MSGQ_TAIL, each as a scalar at its queue 0 offset rather than as
an array of eight.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/regs.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/regs.rs b/drivers/gpu/nova-core/gsp/regs.rs
index 3c410d65e8e4..fae7825f0846 100644
--- a/drivers/gpu/nova-core/gsp/regs.rs
+++ b/drivers/gpu/nova-core/gsp/regs.rs
@@ -8,13 +8,32 @@
 };
 
 // PGSP
+// The GSP has eight numbered queues, each with its own four msgq pointer registers. nova-core
+// uses queue 0 only, so each register is declared as a scalar at its queue 0 offset.
 
 register! {
     base: NovaRegisters;
 
+    /// Write pointer of the CPU-to-GSP command queue, which the driver advances. A write to this
+    /// register also interrupts the GSP, so this register is also the doorbell.
     pub(super) NV_PGSP_QUEUE_HEAD(u32) @ 0x00110c00 {
         31:0    address;
     }
+
+    /// Read pointer of the CPU-to-GSP command queue, which the GSP advances.
+    pub(super) NV_PGSP_QUEUE_TAIL(u32) @ 0x00110c04 {
+        31:0    address;
+    }
+
+    /// Write pointer of the GSP-to-CPU message queue, which the GSP advances.
+    pub(super) NV_PGSP_MSGQ_HEAD(u32) @ 0x00110c80 {
+        31:0    address;
+    }
+
+    /// Read pointer of the GSP-to-CPU message queue, which the driver advances.
+    pub(super) NV_PGSP_MSGQ_TAIL(u32) @ 0x00110c84 {
+        31:0    address;
+    }
 }
 
 // PBUS
-- 
2.55.0

