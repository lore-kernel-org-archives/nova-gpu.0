Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703173911DC
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 04:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789188287; cv=fail; b=hPsghCMl0uDehmqRU50/+pKcXaH7nJZfCDHOWDplprnYUPObE9vkkUX8nnhwo6EoA52DNH22TIv9dE58YPkaAl8OdTdxDL7T4D0MnI8x6dKiar1fTHlKDkYPNMw0b1LcnoRXXwPmJk8ipk3M/vKkI41fHPswiwh4Ium6jP+W7SM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789188287; c=relaxed/simple;
	bh=7aG5s6ZR/t9r2fJfFYwcOSUJjuDnLWTqdlwo0HC2fDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WgAOnWNGygaSccokOzLsAgJmgQkpqjwlIo1HK1mLIXg9awHEYfsRBkTx8f21zwleeoVIuiw+0iP8fKFfPI/UmUI1V3HdsihPY8AEGAseUpMPKkOHeJrzWImQdz7BHmZuJxsF+RJ5yHkQ1bFIAv5Rih3V17NWcLc7LU+xGS+Lykc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NNsn95yt; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NNsn95yt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLJQntc9Z9s7587AHixIrWwgKO92micsplXOfT4hpgMD01onz69H/Mylfps8yKike3BDiVcjo8zcZgif1i3C9ScmMSsCKdSi32copfKe8wxgqfnHh08Z2FktYubdCT0zXbjv9HlFl8gDx6LayTgRgs4+KBNf8xOVtqntd0RGSqv3u48iGeQqI2e/UO1YJkgAWJqslTaqls98urbkDtcNaZJppHkS6NeMx+dOVs5ozySPldxJaDPJw6S022NRBsH6eBxUrLz+ZE/oxKE3gzIN9AfUusuNmoPKP5QBrSDso1cCcnLcKNqepYd101J81uPepAfcyMtS82NBJsRTO2/StQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8utSJMd2yh8EG++UJe5MUi34LE9z5XPkP8R7WQS4s4U=;
 b=dBFajXhBLsxIe8OvgH9o3NE5dLjmj1bKkHaeUoyCKzJlCS9PbJ8fzoDCJCZg+ou0kvA6eiLw6zhobVeoa25gauaBYHcKYMoRviTlny2ogGPP01AVpRiUvVpwqBY/BHJVroTt/U4x9YvKk+FoLP846/ZmK6Z2GsEJjuMPnQPLKnw9rtaCVA1qaqJoSSgd5qEKrBpgrBhGJJd5vgd/P8g4Clxm+tFB/lfDJqBCst0of8ILaFpvz0EWCzwV+BY3bUfnOIZ34M3el39RbZ5E/zrXfrtxtMpLgSXVbjxfgpq5O3aXR2TfVSpJq6p1A4qw3YXqCGtdbySmaQCnNuk4SAaBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8utSJMd2yh8EG++UJe5MUi34LE9z5XPkP8R7WQS4s4U=;
 b=NNsn95ytMRD2vh+loh741KKFWHTEDW7dav15qdauvc9NMvft6HDOzlp89rcJcX6tkKHXTlEQ37mdGFlOzIKkeu+S8J6q51TclLGSx5MgX0F3AsYR+0HbQr7krfJeN/3WsFdIIv4Z80zUcMIukf+M3a+hARSbRKbegrYb0VHAG+GRqk2/xFXqzt3AjBAo2EHm63e0kEvOFZSw4WyvkAKPUhCyrDvI+WH1vw3rRzNYxPpDUVwu8yqCgttfxv58BB7sWg/XokPtbaC1ovYH93R5QROnv24Z5wKmllVLRV6H9tcqJ2BZOd5UIc/QVZ6WzJ2djYaywbsBqmJbxJvtYngjJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 04:44:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 04:44:33 +0000
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
Subject: [PATCH v4 17/17] gpu: nova-core: document the GIN interrupt controller and GSP events
Date: Fri, 11 Sep 2026 21:44:00 -0700
Message-ID: <20260912044400.677097-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912044400.677097-1-jhubbard@nvidia.com>
References: <20260912044400.677097-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2de470-661d-4b4c-011d-08df10888a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|6133799003|3023799007|18002099003|5023799004|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	4pXchQkMQsEoN/JhIvnS2FY55Hr17W8rSdzqQuViVbAuE/aev+9RBwwh2GbCbCZrUG9s75ZN8Jd7NobO3i0bNihe3Dw19j8M4k1aTnRJHgS5idKzDuE8uUFTPG4RFdTbJRgHPE4gVnk1KoNtHOYAnyJu8+T+8ZxtYHvv1a/9Lpa2BgzsRVb0h80Z3OSiHXpaTyZkJ1VqjLKGalt+qcx7s1QS8iU8bBQagBDLpL85jta8FzpTcMkcyyfk2pZG3jv/3vvPuKbVP+V1Zrka3kpoU+AsO8HbhkJPQ1I495/BxbOZCsEkHpLpcNUeTwGvFfc9wM482Ujn6BL8fOSsOkJ8xzkPIP8LqyYMbnaYWyc3lPDSKFbqrzRuQ0NpSmxBe1BqrgZ1mZX3Wx3JsH6AN1DUiTOdXLfGBskJUOcb3FgZSVUd0GMmFxnmbp3vuF2AdLKt5YfUpBOd86e/xUE2ovtNm9+5x4f5DhX0g5o5k1kLI2B52+2EzTxheYTfc7ivtorFZgCYy+qNa8Ui9TIDC1l+Rvnl+Xn3mjMlJTmXnUKKdsBcC+YtZrC6jqUoklmVEqeSJ13RREdT1mWgz39m2P/2XqKQsxt0jNsVirOLQt1kAGJNLimF/SIaq4h0pgH9wDu/dwqqkEZIzxxI/MKd34zPY6Y1UE8S417qRfvhs/zKjBI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(5023799004)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+/dfvqQ4C0YlnkvHOvA7wT+XUOmzGyg4+wsZjjLOkZu5Eh4auuqvA/XB+5Co?=
 =?us-ascii?Q?DFQ5Lh4IQvlZyjDduZH29JbReKxsDeyrGZkojtgC8mpG669FEqKNt99ayaiD?=
 =?us-ascii?Q?Tc11L9fWOdafrRDtMpE4ILZaKiKbFRs9NgLm4CBjRFIBw+uhjEWIP1BiYu4w?=
 =?us-ascii?Q?LAf3R0zKkS5gG3tgu7sH7k3895lfRJGJ55hN0bZBiUWDbHhvSinV96fUYUoi?=
 =?us-ascii?Q?p6rK3019NzQPsSmcy5A36gKDmYRRw5Mk/spDWFvEhqZ419dqXooGZTtLmemw?=
 =?us-ascii?Q?/7eoqLqhNM2LdQXDMuJO2a5QqLE2JlcNfrjVTUGeEr+JKEMKtpKd1JJAL1dX?=
 =?us-ascii?Q?B8QR3dA2v/goXQI/26FHMuSrUnvl1bGBClo0coRPDSlHeH10GEghBiu5R9Uw?=
 =?us-ascii?Q?xsh2xB7yi7CHNVORFfoKAVLS/ryuDGwgbMBgG+C9gP0F2jlqvJg7cdCCTVFt?=
 =?us-ascii?Q?HxpcIof7S7KKnOSALh1WO8UQWasVRrZaLkGLxGyjIDB2UzihsBgj4hGByYwV?=
 =?us-ascii?Q?teHWRUOsM+ed72gwWOCer/V1vSAnuS9z9NaSWxTnDlleQsK95gLMUiqcy0l0?=
 =?us-ascii?Q?X3Zcd/WI4agb8KQTcXCKeXKplSUriQMzNBCUh1T9uqt8dYp+rgNyHwYknAkd?=
 =?us-ascii?Q?9uybFHs5YtxxfkpEpfofQvgGhejLb3JEKqepknFYBhgQ/olhSRgvgbVsGlcq?=
 =?us-ascii?Q?XZG/3CRHLEuXU6WSqlO9cE+90r6lDWtaG+Wf9RIeMonc3BOj4zUTutTHqB6h?=
 =?us-ascii?Q?zcI00o4aqJXtua2xpVNqotDGnmP8lqKNtwRQgodhZEE3H71/EdTirvtbG9jO?=
 =?us-ascii?Q?mlprBdfhezepeR/ROdrxnQt1kDS2y/SrFcJ6ulHlXC729bVEADyeHFcfMPTI?=
 =?us-ascii?Q?N1axKzmiRxE8xn3E1dXlhVTykBtnrI6j4k2T8GsiN02u5mLlK9jGoq8M2Nyb?=
 =?us-ascii?Q?n70IoKViXMoZVhFLyGUWu7YDmFbGJ9UG02Qr+pkmkPclyr46MdIQWZSv0OYv?=
 =?us-ascii?Q?2RG0jyaN9JmdMMAQJOOUSN9AuHTUOUz18OZWEL7mTa2lwUgm9d+NIWt5AkSw?=
 =?us-ascii?Q?0Joyigk0jLChq4ZT0+gyL24PYi4jDBUtEzpm0LqVRNb63/+Uz9+b86SFsEk6?=
 =?us-ascii?Q?xaYosztPsK+ypXaQow5VJ9Uuqh/lPht0Tmg6HZEzWMxVa7JBFbHFD1Gt3rGb?=
 =?us-ascii?Q?szZ/3VCUYSVAHkFNsgu5V30Yz2U0KC3E4LRzzLcaSK8f3HLuDyQCuusPpPDO?=
 =?us-ascii?Q?tP7HADFVkj2RHDqEeG8grhzQK/uMbbWEHUs7kMbMZtP0BiIgT0Nadl9EkX2k?=
 =?us-ascii?Q?M2oucSxPoV3F2E+YFIC6v8uKB6ukyYP9zgev7TCbdRxMH47P62fXvY08GMTf?=
 =?us-ascii?Q?mtcjLvC/cdw5o6UV/gCWAyR/exKESOV9BYYLV3wdK/ybSQxXfLJhWE/NuXfN?=
 =?us-ascii?Q?LmKNApA5RoySN+t4RsdKJVY63XxtODxKgIOnCN4M+Tr+0Cgd/Zcw1iJbEYpX?=
 =?us-ascii?Q?kSLAKsvn1kdzZzcfxPKj29KGkfoTV4a2dyNqfZv8FBhFa0m2ajfcWxhulWsI?=
 =?us-ascii?Q?ZG3AvGx5sFyx2Yp9qhXGQFpla9x2ssgE25LxU50g/B6aHKoSHS/iFx6hI57n?=
 =?us-ascii?Q?w4XurzGHHQR6JqL/hjzoRQKNPYI1HdkLbDvXwNN4VZB9Q+B6SlHIZsfjBB0n?=
 =?us-ascii?Q?+yzdpNxlqghaRC0rdHvh6YV7SZoObL1ZEuc3mtoLLMDLlNV1EEGH7TUWKD3K?=
 =?us-ascii?Q?6HFWiP1/5g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2de470-661d-4b4c-011d-08df10888a6e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 04:44:33.5816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeT/a6ixQgp/zRXKBiAzfhksZ/dOpZWsIfXEH+wmY4xnkTXBV9Wo6fNscuU/7rXvrelOQwHUN5gHxnkzWrUgAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229

The interrupt code rests on hardware behavior that the code cannot show
on its own: how GIN, the GPU's interrupt controller, records and
delivers interrupts, what edge-triggered delivery requires of a handler,
and how the GSP signals the CPU. Some of those requirements come from
Open RM rather than from the hardware manuals.

Add a design document that records that behavior, the rules nova-core
follows because of it, and the terms the code uses for it. The code
comments cite the document by section rather than repeating it.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/nova/core/interrupts.rst | 674 +++++++++++++++++++++
 Documentation/gpu/nova/index.rst           |   1 +
 2 files changed, 675 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/interrupts.rst

diff --git a/Documentation/gpu/nova/core/interrupts.rst b/Documentation/gpu/nova/core/interrupts.rst
new file mode 100644
index 000000000000..280dcf97688a
--- /dev/null
+++ b/Documentation/gpu/nova/core/interrupts.rst
@@ -0,0 +1,674 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+=============================================
+GPU interrupt handling: GIN and the GSP event
+=============================================
+
+This document describes how nova-core receives interrupts from the GPU on Turing
+and later parts. It covers the GPU Interrupt and Notification unit (GIN), which
+is the GPU's interrupt controller, and the GSP event, the interrupt that
+nova-core services in normal operation.
+
+Throughout, *CPU* means the CPU and the nova-core driver running on it. The GPU
+also has on-chip processors that run their own firmware and receive their own
+interrupts. The GSP (GPU System Processor) is one of them.
+
+Register names are the names from the GPU hardware reference headers. The
+pre-Hopper headers call the controller ``NV_CTRL`` and the Hopper-plus headers
+call it ``NV_GIN``. This document calls it GIN throughout, because the tree that
+nova-core services is the same on every supported part. "Register naming" at
+the end says how the names map onto the headers. Open RM, NVIDIA's open-source
+GPU kernel driver, is cited wherever nova-core follows it.
+
+Terminology
+===========
+
+The three levels of the controller, innermost first:
+
+leaf
+    One ``LEAF`` register. Each of its 32 bits is the pending bit of one
+    interrupt source. A Turing, Ampere, or Ada tree has 8 leaves. A Hopper or
+    Blackwell tree has 16.
+
+subtree
+    Two consecutive leaves, summarized by one bit of ``TOP``. A subtree is the
+    unit of enabling at ``TOP``, and under MSI-X it is the unit of delivery:
+    every interrupt from one subtree arrives on one MSI-X entry.
+
+tree
+    One ``TOP`` register and the leaves under it. Every PCIe function has its
+    own tree, and nova-core services the CPU tree of one function.
+
+The hardware headers, Open RM, and the Linux PCI API all use the word "vector",
+each for a different number. This document gives each one its own name, and a
+bare "vector" always means a GIN vector.
+
+GIN vector
+    The GPU-internal interrupt source number. It addresses one bit of one leaf.
+    A 16-leaf tree holds vectors 0 through 511, and an 8-leaf tree holds 0
+    through 255. The CPU doorbell is vector 129 and the GSP event is vector
+    155.
+
+MSI-X entry
+    An index into the device's MSI-X table. One entry serves one subtree.
+
+PCI vector
+    One of the interrupts that ``pci_alloc_irq_vectors()`` allocates: an MSI-X
+    entry, or the single MSI message.
+
+Linux IRQ number
+    What ``request_irq()`` takes, obtained from ``pci_irq_vector()`` for a PCI
+    vector. Linux's ``struct msix_entry`` calls this number ``.vector`` as
+    well.
+
+The remaining terms, each named for the register or the specification that
+defines it:
+
+enable, disable a vector
+    Writes to ``LEAF_EN_SET`` and ``LEAF_EN_CLEAR``.
+
+enable, disable a subtree
+    Writes to ``TOP_EN_SET`` and ``TOP_EN_CLEAR``.
+
+serviced subtree
+    A subtree that nova-core enables and has a handler for.
+
+rearm
+    Restoring PCI interrupt delivery after servicing an interrupt. See
+    "Rearming PCI interrupt delivery".
+
+mask
+    Reserved for the two places where hardware and the PCI specification use
+    the word: the MSI-X per-entry Vector Control mask bit, which Linux
+    controls, and the falcon interrupt masks. It never names a GIN enable.
+
+latched, pending
+    Two names for one state, a set ``LEAF`` bit. The vector's source sets the
+    bit whether or not the vector is enabled.
+
+clear a vector
+    Write a 1 to the vector's bit in ``LEAF``. Open RM calls the same operation
+    ``intrClearLeafVector_HAL``.
+
+pending bits
+    The plain 32-bit value read from a ``LEAF`` register.
+
+notification
+    An interrupt whose only content is that something happened, such as a
+    posted message. Servicing a notification means reading what it announces.
+    The unit that raised it needs no attention. The GSP event is one.
+
+unit
+    Any block that raises an interrupt. "Engine" is reserved for the blocks
+    that do user work: GR, CE, NVDEC, and the like.
+
+falcon
+    One of the GPU's microcontrollers (see
+    Documentation/gpu/nova/core/falcon.rst). The GSP runs on the RISC-V core
+    inside its falcon. A falcon latches each of its interrupt causes and routes
+    it either to the host, meaning the CPU, or to its own core.
+
+The GIN controller
+==================
+
+A GPU has many interrupt sources: the GSP, the copy engines, the graphics
+engine, video decode and encode, the MMU fault path, timers, and others. GIN
+records which of them are pending and raises the PCI interrupt to the CPU.
+
+Trees
+-----
+
+GIN keeps one tree for each destination it can deliver an interrupt to. The CPU
+has one tree per PCIe function, so the physical function and each virtual
+function have their own. The GSP has a tree, and so do the other on-chip
+processors that receive interrupts. Every tree has the same two-level layout,
+and a function reaches its own tree through the per-function register aperture.
+
+nova-core services the CPU tree of one function. A virtual function's tree
+belongs to that function's driver, and a processor's tree belongs to the
+firmware running on that processor.
+
+The two-level tree
+------------------
+
+A tree is a set of ``LEAF`` registers and one ``TOP`` register.
+
+* ``LEAF(i)`` is a 32-bit register that holds the pending bits of vectors
+  ``32i`` through ``32i + 31``. A set bit is a pending vector.
+* ``TOP`` is a 32-bit read-only register. Bit ``N`` summarizes subtree ``N``,
+  which is ``LEAF(2N)`` and ``LEAF(2N + 1)``. The bit is set when an enabled
+  vector is pending in either leaf.
+
+A tree with L leaves has L / 2 subtrees and uses TOP bits 0 through L / 2 - 1.
+The other TOP bits read 0. The leaves and subtrees that a part has are its
+implemented leaves and subtrees, and "Per-architecture differences" gives the
+counts. For an 8-leaf tree::
+
+    TOP bit 0  ->  subtree 0  ->  LEAF(0), LEAF(1)   vectors   0..63
+    TOP bit 1  ->  subtree 1  ->  LEAF(2), LEAF(3)   vectors  64..127
+    TOP bit 2  ->  subtree 2  ->  LEAF(4), LEAF(5)   vectors 128..191
+    TOP bit 3  ->  subtree 3  ->  LEAF(6), LEAF(7)   vectors 192..255
+
+    LEAF(4), one bit per vector, holds vectors 128..159:
+
+      bit 1  = vector 129  (CPU doorbell)
+      bit 27 = vector 155  (GSP event)
+
+A vector's number fixes its place in the tree::
+
+    leaf    = vector / 32
+    bit     = vector % 32
+    subtree = leaf / 2
+
+Registers
+---------
+
+nova-core defines the tree's registers in the ``irq`` module's ``regs.rs``. The
+leaf registers are arrays indexed by leaf number.
+
+* ``LEAF(i)`` reads as the pending bits of leaf ``i``. Writing a 1 to a bit
+  clears that vector, and a 0 leaves the bit as it was.
+* ``LEAF_EN_SET(i)`` and ``LEAF_EN_CLEAR(i)`` enable and disable the vectors
+  of leaf ``i``, one bit per vector.
+* ``TOP_EN_SET`` and ``TOP_EN_CLEAR`` enable and disable subtrees, one bit per
+  subtree.
+* ``LEAF_TRIGGER`` takes a vector number and latches that vector, exactly as
+  the vector's own source would. It is write-only. The self-test uses it.
+
+nova-core does not read ``TOP``. "Servicing the tree" says why.
+
+Every set and clear register acts per bit: a 1 performs the action for that
+bit, and a 0 leaves the bit alone. No register needs a read-modify-write.
+
+GIN delivers a vector to the CPU only when its leaf enable bit and its
+subtree's TOP enable bit are both set. The enables do not affect the latch. The
+source of a disabled vector still sets its ``LEAF`` bit. ``TOP`` does not show
+that bit, so reading the leaf is the only way to see it.
+
+How a unit interrupt reaches the CPU
+------------------------------------
+
+A unit does not write a ``LEAF`` register. Each unit has an interrupt control
+register that GSP firmware programs. The control register holds the unit's
+vector, the GFID that identifies the PCIe function whose tree receives the
+interrupt, and one enable bit per destination: the CPU, the GSP, and the other
+on-chip processors. When the unit has an event::
+
+    1. The unit sends GIN an interrupt message carrying the vector, the GFID,
+       and the destination enables from its control register.
+    2. In the tree of each destination that the message selects, GIN sets bit
+       (vector % 32) of LEAF(vector / 32).
+    3. If the vector and its subtree are enabled in the CPU tree, GIN raises
+       the PCI interrupt.
+
+Because firmware assigns the vectors, nova-core does not hardcode which vector
+belongs to which unit, with two exceptions. The hardware headers of every
+supported part define the GSP event as vector 155, and GSP firmware's own
+interrupt table uses that definition. The CPU doorbell is vector 129. Pre-Hopper
+hardware fixes that number, and GSP firmware keeps it on Hopper and later.
+nova-core names both by number. A driver can fetch the full unit-to-vector
+table from the GSP by RPC, and nouveau does. nova-core does not, because a
+fixed vector needs no lookup.
+
+Edge-triggered delivery
+-----------------------
+
+A ``LEAF`` bit is a latch. Its source sets it on a rising edge, and it stays set
+until the CPU clears it. A source that stays high does not set the bit again.
+
+GIN raises the PCI interrupt for a subtree when the subtree's enabled pending
+state goes from low to high::
+
+    Per vector, in leaf i at bit b:
+        LEAF(i)[b] AND LEAF_EN(i)[b]
+
+    Per subtree N, across leaves 2N and 2N + 1:
+        OR of every enabled pending bit  ->  TOP[N]
+
+    Delivery for subtree N:
+        TOP[N] AND TOP_EN[N]  ->  rising edge  ->  PCI interrupt
+
+``TOP_EN`` applies after the summary, so disabling a subtree stops delivery
+without changing what ``TOP`` reports.
+
+Three consequences:
+
+* Code that must find every pending vector reads the leaves. A vector that
+  latched while disabled is not in ``TOP``.
+* Writing ``TOP_EN_SET`` for a subtree with an enabled pending bit produces a
+  new edge. GIN delivers an interrupt for a pending bit left uncleared as soon
+  as its subtree is enabled again.
+* A source that holds its signal high produces no new edge after the CPU
+  clears the leaf bit. Such a source has to re-emit its interrupt. The falcons
+  do that through ``INTR_RETRIGGER`` (see "Retriggering a falcon").
+
+Delivery over PCI
+=================
+
+GIN delivers the tree's interrupts to the CPU as MSI or MSI-X, whichever Linux
+grants. nova-core requests MSI-X first and falls back to MSI, and never uses
+INTx.
+
+MSI has a single message, and every subtree raises that one message, so one
+Linux IRQ serves the whole tree.
+
+MSI-X gives each subtree its own table entry, at the index equal to the subtree
+number. Linux masks every entry until a driver requests its Linux IRQ number,
+and a masked entry sends no message: the GPU records the interrupt in the MSI-X
+pending bit array, where it stays until Linux unmasks the entry. An entry that
+the driver never requests is never unmasked. A driver that enables a subtree
+without requesting that subtree's entry loses every interrupt from that
+subtree, with nothing reported: the leaf and TOP registers show the vector
+pending and enabled while no handler runs.
+
+The serviced-subtree invariant
+------------------------------
+
+Every subtree enabled at ``TOP`` has an allocated PCI vector with a registered
+handler.
+
+MSI satisfies this with its single message. MSI-X needs one allocated entry per
+serviced subtree, and a PCI allocation cannot be sparse, so nova-core requests
+entries 0 through the highest serviced subtree::
+
+    MSI-X, with subtree 2 serviced:
+
+      subtree 0  ->  entry 0   allocated, no handler, stays masked
+      subtree 1  ->  entry 1   allocated, no handler, stays masked
+      subtree 2  ->  entry 2   handler here, and its rearm covers subtree 2
+
+    MSI, with any serviced set:
+
+      every serviced subtree  ->  the one allocated PCI vector, whose
+                                  handler's rearm covers the whole serviced set
+
+An allocated entry whose subtree nova-core does not service costs nothing. The
+entry stays masked, and a disabled subtree raises no interrupt.
+
+nova-core services one subtree. The GSP event, vector 155, is in leaf 4, which
+is in subtree 2. Open RM's headers place its UVM_SHARED interrupt category in
+subtree 2 on every part nova-core supports. The self-test doorbell, vector 129,
+is in the same leaf, and the test allocates its own vectors for it (see
+"Self-test").
+
+Rearming PCI interrupt delivery
+-------------------------------
+
+A message-signaled interrupt is delivered once per edge, and the PCI side
+delivers no further interrupt until the CPU rearms it. The rearm operation
+depends on the GPU family and on the interrupt type Linux granted:
+
+==================  =====  ===========================================
+Architecture        Type   Rearm operation
+==================  =====  ===========================================
+Turing through Ada  MSI    write the configuration-mirror EOI register
+Hopper and later    MSI    clear then set the serviced TOP enables
+Any                 MSI-X  clear then set the handler's own TOP enable
+==================  =====  ===========================================
+
+The end-of-interrupt register is ``NV_XVE_CYA_2`` in the BAR0 mirror of PCI
+configuration space, and the value written does not matter. The ``TOP_EN``
+cycle produces a new delivery edge. The MSI forms cover every serviced subtree,
+because one message serves all of them. The MSI-X form covers one subtree,
+because each serviced subtree has its own entry and its own handler.
+
+A handler rearms once per delivered interrupt, on every path, including the
+path where it finds its vector not pending. A handler that skips the rearm
+receives no further interrupts.
+
+Open RM makes the same split. It writes the configuration-space EOI for MSI on
+pre-Hopper parts, and cycles the TOP enables of the subtrees it services for
+Hopper-plus MSI and for MSI-X.
+
+Servicing the tree
+==================
+
+Servicing a leaf has a required order: read its pending bits, then clear them.
+Clearing a leaf before reading it discards every vector latched in it, and
+nothing reports the loss. In nova-core, reading a leaf produces the handle that
+clears it, so the wrong order does not compile. The handle clears exactly the
+bits it read, so a vector that latched after the read stays pending.
+
+A handler clears its bit before it services the vector. Clearing afterwards
+would discard an interrupt that the source raised while the handler ran.
+
+nova-core services the tree in two ways.
+
+The notification path services one vector. It reads the vector's leaf, clears
+only the vector's bit, and rearms. The subtree stays enabled, and a vector
+pending beside it in the same leaf keeps its bit set for the code that services
+that vector. The GSP event handler takes this path, and so does the self-test
+handler.
+
+The startup drain walks the whole tree, because it must clear whatever is
+pending across every subtree rather than one known vector. It disables the
+serviced subtrees at ``TOP``, reads and clears every implemented leaf, and
+leaves the subtrees disabled for its caller to enable once the caller is ready
+for deliveries. The drain reads every leaf rather than descending from ``TOP``,
+because sources latch vectors during boot while those vectors are disabled, and
+``TOP`` does not show them. Open RM's stall-interrupt path reads every leaf for
+the same reason.
+
+The two paths as register operations::
+
+    Startup drain, run once during probe:
+        write TOP_EN_CLEAR = serviced        stop new deliveries
+        for each implemented leaf i:
+            pending = read LEAF(i)
+            write LEAF(i) = pending          clear what was read
+        (returns with TOP_EN still clear)
+
+    Notification, the subtree stays enabled:
+        pending = read LEAF(leaf)            is the handler's bit set?
+        write LEAF(leaf) = bit               clear that one bit
+        rearm PCI interrupt delivery
+
+The drain clears every pending bit, including bits that nova-core never
+services. An uncleared bit holds its subtree in the pending state, and enabling
+that subtree again would deliver an interrupt for a vector that no handler
+services.
+
+The drain's ``TOP_EN_CLEAR`` is not a rearm, and pre-Hopper MSI rearms through
+the configuration mirror, which the drain never writes. An interrupt delivered
+before probe had no handler to rearm it, so the startup sequence rearms
+explicitly after the drain.
+
+Nothing in nova-core serializes access to the tree. The GSP event handler
+touches only its own leaf, and the drain runs during probe, before that handler
+is registered.
+
+Per-architecture differences
+============================
+
+The tree is the same on every supported GPU except for its size, which changes
+at Hopper:
+
+===================  ======  ========  ====================
+GPUs                 Leaves  Subtrees  Implemented subtrees
+===================  ======  ========  ====================
+Turing, Ampere, Ada  8       4         ``0x0f``
+Hopper, Blackwell    16      8         ``0xff``
+===================  ======  ========  ====================
+
+The interrupt HAL provides the leaf count, and the subtree count and the
+implemented-subtree set derive from it. A subtree that the part does not
+implement has no TOP bit, so building a tree that services one fails with
+``EINVAL``. Vectors 129 and 155 are in the 8-leaf tree, so every supported part
+has them.
+
+Open RM's headers assign every interrupt category of a 16-leaf tree to leaves 0
+through 11. The drain reads all 16, because a vector can be latched in any
+implemented leaf.
+
+The HAL's other value is the rearm method (see "Rearming PCI interrupt
+delivery"). Two falcon properties also differ by family and have a HAL of their
+own. Turing falcons have no ``INTR_RETRIGGER``, and the RISC-V routing
+registers moved at GA102 (see "Retriggering a falcon").
+
+The GSP event
+=============
+
+When the GSP has output for the CPU, it writes messages into the GSP-to-CPU
+queue in shared memory and raises SWGEN0, one of the software-generated
+interrupt causes of the GSP falcon. SWGEN0 is routed to the host, at vector
+155, leaf 4 bit 27, in subtree 2.
+
+The queue carries notifications (log records, error records, lifecycle events)
+and command replies. A thread waiting for a reply reads the queue itself, so
+the interrupt is only the trigger to drain the queue (see "Draining the
+GSP-to-CPU queue").
+
+The falcon latches every cause it raises, SWGEN0 among them, in its
+``IRQSTAT`` register. The handler services the host-routed causes and clears
+their latches, and then it writes ``INTR_RETRIGGER`` so that the falcon
+re-emits any cause that latched in the meantime. "Retriggering a falcon" has
+the details.
+
+Draining the queue takes the command-queue mutex and walks shared memory, so it
+cannot run in hard interrupt context. nova-core registers a threaded handler,
+under the name ``nova-core`` in ``/proc/interrupts``. The top half runs in hard
+interrupt context and reads and writes only registers, and it wakes the IRQ
+thread to drain the queue::
+
+    GSP writes messages into the GSP-to-CPU queue
+    GSP raises SWGEN0
+    GIN sets bit 27 of LEAF(4), and subtree 2 becomes pending
+    PCI interrupt -> Linux IRQ -> top half, in hard interrupt context:
+        read LEAF(4), and if bit 27 is clear, rearm and return
+        clear bit 27 (the subtree stays enabled)
+        read the falcon causes routed to the host, clearing SWGEN0 if set
+        for every other host cause: log it, clear its latch, and read the
+            host causes back
+        if the clear ended all of them: retrigger the falcon
+        otherwise: disable vector 155 at its leaf and skip the retrigger
+        rearm PCI interrupt delivery
+        wake the IRQ thread if SWGEN0 was set
+    IRQ thread, which may sleep:
+        take the command-queue mutex and drain the GSP-to-CPU queue
+
+A halt and a posted message can be pending together, so the top half services
+every cause that the status reports.
+
+A drain fails when a message's framing or checksum is bad, which poisons the
+queue (see "Draining the GSP-to-CPU queue"). Every later event would fail the
+same way, so the IRQ thread disables vector 155 and logs the failure, which
+leaves the queue unserviced until the device is reset.
+
+The handler, the self-test, and the rest of the driver read BAR0 through one
+shared mapping. nova-core unregisters an interrupt handler when the device
+unbinds, so a handler runs only while the mapping exists.
+
+Retriggering a falcon
+---------------------
+
+A falcon signals the tree when its set of host-routed causes goes from empty to
+non-empty. A cause left latched keeps the set non-empty, so no later cause
+signals the tree, and the vector is lost. For a cause that stays latched, the
+handler can clear the tree leaf first or the falcon latch first, and the loss
+is the same.
+
+``IRQSTAT`` latches every cause in the falcon, including the causes routed to
+the falcon's own RISC-V core and owned by the firmware running on it. A host
+handler owns only the causes that ``PRISCV_RISCV_IRQMASK`` and
+``PRISCV_RISCV_IRQDEST`` both select, so it intersects ``IRQSTAT`` with both
+before it reads or clears a cause. Open RM computes the same intersection in
+``kflcnRiscvReadIntrStatus``. GA100 keeps the Turing offsets of the two routing
+registers and GA102 moves them, so the offsets change at GA102 rather than at
+the Ampere boundary. The handler masks no cause: ``PRISCV_RISCV_IRQMASK`` is
+read-only to the host, and ``FALCON_IRQMASK`` has no effect on host routing on
+a RISC-V falcon.
+
+``INTR_RETRIGGER`` makes the falcon re-emit its host-routed causes into the
+tree, which supplies the transition that clearing the leaf lost. The handler
+writes ``INTR_RETRIGGER`` only on a path where it ended every cause that it
+read, because a re-emitted cause that nothing clears arrives again at once and
+on every pass after that.
+
+``IRQSCLR`` ends a latch and does not end the source behind it, so a cause
+driven from outside the falcon stays set after the write. On Blackwell the
+fault-containment and ECC causes are driven that way: they appear in
+``IRQSTAT`` but come from ``PRISCV_RISCV_FAULT_CONTAINMENT_SRCSTAT`` and
+``PGSP_ECC_INTR_STATUS``, and only a device reset ends them. So the handler
+clears the latch of every host cause other than SWGEN0, reads the host causes
+back, and retriggers only when the read-back is empty. When a cause is still
+set, the handler disables vector 155 instead and reports that the device needs
+a reset. Disabling loses no notification: the cause that is still set holds the
+host-routed set non-empty, so the falcon would signal nothing further either
+way. Open RM makes the same choice, and ``kgspService_TU102`` skips
+``kflcnIntrRetrigger`` once it has recorded a fatal error.
+
+A fault cause that arrives after the clear cannot be told apart from one that
+the clear failed to end, so the handler disables the vector in that case too.
+Both mean the GSP has faulted.
+
+Turing falcons have no ``INTR_RETRIGGER``, so a Turing handler cannot re-create
+a transition it has lost. It must leave no host cause latched: it reads the
+host-routed status once and takes every cause that the status reports, rather
+than stopping at the first one it recognizes. One window stays open. A cause
+that arrives after the handler has read the status is not in the value the
+handler clears, so it stays latched after the leaf has been cleared, and no
+later cause from that falcon signals the tree. Open RM has the same window on
+Turing, where ``kflcnIntrRetrigger`` does nothing.
+
+Enabling the GSP event
+----------------------
+
+SWGEN0 is a latch, and the GSP drives no new edge into the tree while it stays
+set. nova-core's GSP boot code consumes the GSP's notifications by polling the
+queue, which leaves the latch set and leaves pending bits in the tree. The
+handoff from polling to interrupts has a required order::
+
+    disable every implemented vector    drop enables left by boot, or by a
+                                        driver that ran before this one
+    drain the tree                      clear stale pending bits
+    rearm PCI interrupt delivery        required under pre-Hopper MSI, where
+                                        nothing else does it
+    clear the SWGEN0 latch              so the next message makes an edge
+    register the threaded handler       nothing can reach it yet
+    enable subtree 2 at TOP             the drain left it disabled
+    enable vector 155 at LEAF(4)        deliveries become possible here
+    drain the GSP-to-CPU queue          messages posted before the clear
+
+nova-core quiesces the tree before it registers the handler. Registering
+unmasks the PCI interrupt, and GIN would then deliver a vector that boot left
+enabled to a handler that services one vector and has no way to service any
+other. Open RM clears every leaf enable at the same point for the same reason.
+
+nova-core clears the latch after the drain. If nova-core cleared the latch
+first, a message posted before the drain could set it again, along with bit 27
+of LEAF(4). The drain would then clear the leaf bit while the latch stays set,
+and no later message would signal the tree. Clearing after the drain can
+instead leave the leaf bit pending with the latch already clear. Enabling the
+vector then delivers one interrupt whose ``IRQSTAT`` reads zero. The top half
+clears the leaf bit, rearms, and does not wake the IRQ thread, and the queue
+drain that follows reads the message.
+
+Clearing the latch makes the first interrupt possible. A message that the GSP
+posted before that clear produces no interrupt, so the sequence ends by
+draining the queue.
+
+The subtree is enabled at ``TOP`` once the handler is registered. The drain
+left it disabled, and under pre-Hopper MSI the rearm is a configuration-space
+write that does not enable it again, so the enable is explicit. On teardown
+nova-core disables the vector at its leaf, so that nothing in the subtree can
+be delivered, then calls ``free_irq()``, and disables the subtree last.
+Disabling the subtree earlier would let a handler still in flight enable it
+again through the ``TOP_EN`` cycle of its rearm, which would leave the subtree
+enabled with no handler registered. nova-core tears down the registration
+before it frees the queue that the handler drains and before it unloads the
+GSP.
+
+Draining the GSP-to-CPU queue
+-----------------------------
+
+The queue carries command replies and unsolicited events, and a message's
+function code says which it is.
+
+* A function code that matches the awaited reply: the message is decoded and
+  returned to the caller that sent the command.
+* Anything else is an event. An OS error record and a robust-channel record
+  are logged at error level, and an unrecognized function code at warning
+  level. The other known events (GSP logs, libos prints, assertion records,
+  lifecycle notices) need no action and get no line of their own, because the
+  receive trace at debug level already records every message's arrival with
+  its sequence number, function code, and length.
+
+The sequence number takes no part in the match, because the GSP does not echo
+the command's sequence number on every reply. On r570 the reply to
+``UnloadingGuestDriver`` carries sequence 0.
+
+The read pointer advances past every message, whether it matched, was an event,
+or matched but failed to decode, so a message is never left at the queue head
+for the next receive to parse again.
+
+Corrupt framing is the exception. A message's length is inside the region that
+the checksum covers, so once the framing or the checksum fails there is no
+trustworthy length with which to skip the message. Such a failure poisons the
+queue: nova-core logs it once, and every later receive fails with ``EIO`` until
+the device is reset.
+
+The polling path and the IRQ thread both read the queue under the command-queue
+mutex. Replies and events share one queue and one read pointer, so one lock is
+held across the whole drain. A thread waiting for a reply logs each event that
+arrives before the reply and keeps waiting. One deadline of 5 seconds applies
+to the whole wait, rather than a fresh timeout after each message, and the
+thread holds the mutex for the whole wait, so no other caller consumes the
+message it waits for.
+
+With one lock, a drain waits for an in-flight command's receive to finish or
+time out. For log and error records that delay does not matter.
+
+Self-test
+=========
+
+The self-test confirms that an interrupt injected at the GPU is delivered to a
+registered handler. It runs during probe, after the GPU's boot firmware, GFW,
+has completed, and before nova-core boots the GSP, because the test disables
+and drains the whole tree, including the GSP's leaf. The test is built only
+under ``CONFIG_NOVA_CORE_SELFTESTS``, like the other probe-time hardware tests.
+Those other tests log a failure and let probe continue. A failed delivery test
+fails probe, because an interrupt path that does not work leaves the driver
+unable to make progress later, in a place that says nothing about the cause.
+
+The test writes ``LEAF_TRIGGER`` with vector 129, the CPU doorbell, at leaf 4
+bit 1. The vector then takes the ordinary path to the CPU under the ordinary
+enables. The doorbell keeps the same number on every supported part, so the
+test names it without asking the GSP, which is not running yet.
+
+The test allocates PCI vectors for subtree 2, disables every vector, drains the
+tree, and checks that the doorbell bit starts out clear. It registers a
+non-threaded handler with a completion, under the name ``nova-core-selftest``
+in ``/proc/interrupts``, and enables the vector and the subtree. It triggers
+the doorbell, waits up to 1000 ms for the first delivery, triggers it again,
+and waits up to 1000 ms for the second. The handler takes the notification
+path: it clears only its own bit and rearms, and never walks the tree.
+
+The test triggers twice, and the second trigger waits for the first handler to
+finish. One delivery would prove nothing about the rearm, because the first
+message-signaled interrupt arrives whether the driver rearms or not, and two
+triggers in a row could coalesce into one delivery. A handler that walked the
+tree would prove nothing either: on every configuration except pre-Hopper MSI
+the rearm is a ``TOP_EN`` cycle, so a walk that enabled ``TOP`` again would
+rearm delivery whether the handler asked for it or not.
+
+The test passes only if both deliveries arrive, each finds the doorbell bit and
+nothing else pending in leaf 4, and the bit is clear once the vector is
+disabled. Anything else fails probe. Requiring the exact pending bits on the
+second delivery shows that the first handler's clear reached the hardware. No
+other vector in leaf 4 can be pending, because the test disabled every vector
+and runs before GSP boot.
+
+The test releases its PCI vectors and its handler before returning, so the
+driver's own allocation covers the GSP subtree and nothing else. Sharing the
+driver's allocation would have let the test pass only because the doorbell and
+the GSP event happen to be in the same subtree.
+
+The test exercises the path from the GPU to the handler without GSP firmware,
+which helps when bringing up PCI, MSI, MSI-X, and passthrough setups. Under
+MSI-X a pass also shows that the delivery arrived on the entry belonging to the
+serviced subtree.
+
+The parts with no hardware dependency have KUnit tests instead: the vector
+arithmetic, the leaf and subtree sets, the per-architecture leaf count and
+rearm method, and the falcon retrigger and routing HAL.
+
+Register naming
+===============
+
+nova-core uses the ``NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_*`` names for the CPU
+tree on every supported part. That is the per-function aperture: each PCIe
+function reaches its own tree through it, at the same offsets. The controller
+also has a central aperture that exposes every function's tree. The pre-Hopper
+headers name it ``NV_CTRL_CPU_INTR_*`` and the Hopper-plus headers
+``NV_GIN_CPU_INTR_*``. nova-core does not use it. Open RM's kernel-side code
+for the controller is the ``Intr`` object.
+
+Scope
+=====
+
+nova-core services the CPU tree of one function and nothing else. It implements
+no virtual-function tree management and no GFID routing, which belong to the
+physical function's driver or to firmware in a virtualized setup, and no MIG
+(multi-instance GPU) support. It services none of the subtrees that the
+hardware headers reserve for the stall interrupts of the host-driven engines.
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 59b206238498..224caef9ea42 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -35,3 +35,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/falcon
    core/tlv
    core/pramin
+   core/interrupts
-- 
2.55.0

