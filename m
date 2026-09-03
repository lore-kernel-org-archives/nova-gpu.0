Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BD9376A0A
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405349; cv=fail; b=k/GQEC7fUZ8xlyUUx+/HFq9hNCikaYNim2SkibCyDXJ98+MkV0PFgSqMwW+VR//uLGkPVvpM5dDFP4DmxU49t5J6ZC29ZxOWfJU0AscTo04Q7Uwa4MwAb8nA4dQu62WeogezOTm0+315X7a2lC2R1ncAAD1rskohxmNMSZ47uog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405349; c=relaxed/simple;
	bh=AFxwqI7KjrcR+Eyf9a2WbB3vDAoOVPq073knKzKOFQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kanWtn7GiJ5d0z8o5mmNJaO5/xUhBXP7Lsqxw3ycGjeLODQJAixXM+WR3ZjyVP/xPJd2fS+Ay2hJqPCOYOOH69CEf9R1XTK5C9RCsFPXensQYHEZKRfTyNuCLyuknNw+ovIagtLLPxrmsn6+qnvcwLZGhWAJKk78CkVg21W5i1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kj5Tdr9Y; arc=fail smtp.client-ip=40.93.198.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kj5Tdr9Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i51bUwKOZcuz+e2Z3znIpePawfjgSgNg+DVbsWA4o6rGBwChRXNOtEIbKJvDdL0eJeoxDdmmpDbHqjiT/CuGvNb4EFFsm8n7MgYZbjNgeCafVOfNdUcfh0lS4bXf1ugRNj1irIyBlfGTnL71auDnxZRWGZoH1JTiu5/IPzlrpgZMQIdOb6fsFghkhfcbs1WzajP3lUbv2M2SlEHftgKznL+wiKSxD7Oy/fsrMlTAz9y9/daM8g3CDnqKGyoXvIEbCwqiMsjNbzpWISLhxY1Th9kWPyB0FoXRIkUArmowFIUyzPZcRNtHy0ciol9CAG7iMmw6fWS/mrcOwXr3+8mQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqZRNWEXr4MZ8J/zyTKQwZ123L7r1VsFnBdplwUnesg=;
 b=hTEjMD0jHbObbAKZ0DCPflLpdXL9gFo93KUohCb1JdUuzHg4IjkDDgwqOa3qZGe4JXAWfNRLBY8ZyEGBLRUyuJlyXF2EAE4rg61PazOMsAdFMxNYJ4XlFEIoWAI4IJDbJbYOOg0AEaMV35Me3gQNl4wU9Z93G/XoLwvg/mXrEtZ+A7ZWKrt6vxxnmUY6KOK55JT43VckR8jfDa4XmGq4vuHu8Ycxx+00B79YAYnodzu66eJdMfWKYmbFdr1D9XrSvNsEpcNzMjJU3mhAobOful0ry3A1QMADJK2d7A+I35hTUpgBhmgOzRzHZruuT09+2E2QrPcH5jX89C7e0uDJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqZRNWEXr4MZ8J/zyTKQwZ123L7r1VsFnBdplwUnesg=;
 b=Kj5Tdr9YCtdLfWubnUC+OLPB4qgnTXLJXFSTLTLB5dGqWCYhAfiFYhGD+Dy8rdaMcJ6n34zFfuA4yt9FzsHuTVnMgMqNcxHutqBhqECR+zYlfwYlEQtVpNN6eZsO1teA1XHZV0/hgranOl5C8cdh2iJ6gWR71Zesu4mRMOmXwe4myk0DApVF2sIrAhRgQW5N69gPcyCGD4R/Vl3i+yF31ULLGDanmpZ80CSP61xUQiuZN8+cri9XCrWSrENOHo/gqGFWMk4gUFacJoWxv3AiAjtW7ube0ElST03Wol4aVEBDLMNKjvXr4Q21g5Q9z7R1mLr1lKcxVVivNQuaMl2tYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH0PR12MB8487.namprd12.prod.outlook.com (2603:10b6:610:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 03:15:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:35 +0000
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
	John Hubbard <jhubbard@nvidia.com>,
	Will Pierce <wpierce@nvidia.com>
Subject: [PATCH v3 14/14] gpu: nova-core: document the GIN interrupt controller and GSP events
Date: Wed,  2 Sep 2026 20:15:13 -0700
Message-ID: <20260903031514.1515905-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH0PR12MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: c253784f-ebf4-4066-8ad5-08df09699eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|6133799003|3023799007|10067099003|56012099006|5023799004|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OwRKXdislmfLARQDa28SBT415CnYCnmoR2zVvIvNdNggO2Ynn2i1/gkgc3ITds2Or2l0buz1yMQVgZJLPzO2Y+SK5GOgfs5npsVrgQmJGq/FbKU9pronLkb1wZZxGnRXvDe+fez15qW3YzjYEtbyJp5CvVgYaT2aGcmWZ44tLuam8EcT2wJo11zHejHG9EfMxC5bouqIT8txGpyaFda3f72yf8GEICB8wnl/+uFBxD0fU4qmWbKNA9SXf4JdyARVm6zxjMI/vMZ+BrAd5ouzUwWV7GP3nzbSc6caGjmygPg2GzCs+d/w004tXizVLkspWDcHAIZ2bfz0xmVR1NHNRWt+Sdi7BYz7f7fyjmALw/EemEM1ezvurtxuYky0yakNgTMtA/s1QZvOhrTKWqN7qkoL8tlF9HKsZOwq4r9qUy+Y65LzW+6dimhulEWYEd3A8nB7y4Z4wbj5nRUcFdtRyyqHMTj6Gy9S1IjUALkhGaNNMjAKIo/VY3GrW6grzGutiUXZmTheu22oBT+ABeLe39lA+5HKMPJh7DWW14OeE81k3r0O0G5ETGNI2GIDMqPxw3UpST6LpQaCv9VOlR5WGNQxsQzajSo0LzMwKy86W8HgiE1gAneMyA4FCv6/FQ19fIbHeft5ItTrclJFxZFOslWs0gjyKL5bahB55ssMXHI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RewmNJc3wGMalvyM6efFDn+VThAPb1xDiP6EiCFfmWsBAPAoWt89VkjKdIa6?=
 =?us-ascii?Q?+7eTxBujjm8seQxes7ohGoXW75TS10CQc0RqtU14g3J/CosWuJbJEmcGZCvZ?=
 =?us-ascii?Q?XGw7xg1kJUYqePG7CYDctBHpV7JTX801yYB0r9QamqaqkBgO2kUaUErB1OQO?=
 =?us-ascii?Q?XMkxjsLy878SpQVevy+Vd9w5NofU8g4Mt/TL4tUt5cYv7wTlJjglzNFEcsDg?=
 =?us-ascii?Q?/kOCgjQr/WcXfAvWixLEnbBVLlBbzbhto7uyPrD/XfAroMoZexP8UAuQvXUp?=
 =?us-ascii?Q?nKl0MixbX40M7lPk9cgt936Ao2jxjmVPlSb2QMWtgnc7k+nbZNjZ48xL8SUR?=
 =?us-ascii?Q?2TOmBcmiTsDPwuSy2hujgw2VTXyS6TN9AyTZgWuiFi/yXaYqtEOpRa7vH1dt?=
 =?us-ascii?Q?fUfHpck6PQtYa31ymVCAsusHF9ABv18Hj6sWYpcX7PhHnGxb76RqkngDn5Ec?=
 =?us-ascii?Q?wzwy7XHCy9OCeNCy7w8+HSk9H88OzZamh3XI8rES2JnTU+kdNzgrhX2NvOC/?=
 =?us-ascii?Q?bD8m/dUJqvY8fpovqzR110XOrjHAtpd72wXopJc1lv3MSGkzdSJV3p90mx7e?=
 =?us-ascii?Q?K+x1PW+kFJ+wKh3GI1k8k7suquYF/+7L9kXy85YNIkVTRakXhXLvo2Y6bDAV?=
 =?us-ascii?Q?q2/UR7gpvwYM9COAJPj8o+9SL/z2b8fmXjiUG4l7+eLBOtBsBSCbgcX/v/6r?=
 =?us-ascii?Q?FLO3Lb+AZJY+FEEXApLNX4S/Di1DcwDJGE3oNPrhZl20Y6UfwIu9n3pGx5Gf?=
 =?us-ascii?Q?IO07+lyBSACqf8wh+mF4yykn4Bj/wcWpLhkadF22+UMz365V9K4qderon5Fj?=
 =?us-ascii?Q?QrYDNq/Cer7pe5/lCpK257Q1VI2cMFHV/weylG7Wcr07OVaB3ZHDUP2oEqQo?=
 =?us-ascii?Q?2n97Wh/X9nZctPWbJlvlzF97gaArp0FjKKHs9KsaG86jZsvhcoy6TVB7XNNT?=
 =?us-ascii?Q?KivsTbhkQMDqd74hZ9yVIXnSPzLVZGokUZhsAbsub95Xqpv+9ayURivRZR7x?=
 =?us-ascii?Q?rJDDRgUzYT8X3VUPMqcUqojLxge+vQVXOJ+Fq7MsaZDfbTV8BaahJVZwgpJH?=
 =?us-ascii?Q?5Bhds4VzDGtfreC/nQbQMQEHKzpEyOLrZ+8qcTq1Z5fb+utLJguAhuXf0w9e?=
 =?us-ascii?Q?8lMw0zVRzXFH7g8HNiUvUidrgL7KUdOVx9RTOQQzF6zzDSSbWXgiKtzO4vsn?=
 =?us-ascii?Q?QQVZGVHJPjeSy3JjoLPYsvvlzTzTAkVfOiBPbC8lz+M9S9dCX+y4pPEM5xVD?=
 =?us-ascii?Q?l5mdQihoLvKvp6GQqjQ9OEfmrVCUNdD/phNZTZ34Bya6Jh8Ngc4aoGiV1HS4?=
 =?us-ascii?Q?D9r9G1Mu7rIvfB3WXHuJ6oE3XI1tjxGEp+YD9FveHQNz3qRT5loNcD1b0+Yu?=
 =?us-ascii?Q?WU05pyDzNhpQH6ggz0Tgh1JUFy8pLwleppdlT8mu4Gd9pYEgvHae/CZ+Q/QO?=
 =?us-ascii?Q?lwN0zLUOCRQIdeGRRJus7hUHhxaHu+8QvThAW6OTzG6uzDYKYHMUIBSZ2/8T?=
 =?us-ascii?Q?ptR4V2XdoygprX9huncf67OYjaK2zDMXxWWlLYl/6HjwsjQWm9QSWAGEnR3L?=
 =?us-ascii?Q?tenZR7cTV3Qz+6o89p7FsQne/Ij3mV+mQ1ac+4WGn444Oq1KdrPYimOjggGp?=
 =?us-ascii?Q?XcYyRPF2WdMjStS5uF/rJp3GDWdI2Izzg1TxBa5WT2R3ucgYZ1OfskEbTRqn?=
 =?us-ascii?Q?ORcRTNmKBssM/4bYC5KzfF/mpFQ98QiTgRtHy09JTJ6Z+7YGCLk3S+bIApbR?=
 =?us-ascii?Q?PIKjuQw6ZQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c253784f-ebf4-4066-8ad5-08df09699eeb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:35.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPhem9vuJk9beY/lp363qlhaZL8GiQ0IlDOxQvP6RzgKDZfd0VSLSqzN2cgSh9sUi26jfoQjtSefz8S/i0zUlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8487

The hardware behind nova-core's interrupt support is not obvious from
the code. Delivery is edge-triggered and needs a rearm after every
interrupt. The rearm operation differs by GPU family and PCI interrupt
type, and a vector that latched while disabled sets no bit in the TOP
summary register. Three different numbers are also all called a vector,
in GIN, the MSI-X table, and the Linux IRQ API.

Add a design document covering the two-level register tree, how an
interrupt reaches the CPU under MSI and MSI-X, and the rules that
delivery imposes on a handler. It also covers the GSP event: which of
the falcon's interrupt causes reach the host and which belong to the
firmware, the falcon retrigger, the handoff from boot-time polling to
interrupts, and how the GSP's messages are classified. A glossary
defines the tree's three levels and names every other term after the
register or the specification that owns it.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/nova/core/interrupts.rst | 716 +++++++++++++++++++++
 Documentation/gpu/nova/index.rst           |   1 +
 2 files changed, 717 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/interrupts.rst

diff --git a/Documentation/gpu/nova/core/interrupts.rst b/Documentation/gpu/nova/core/interrupts.rst
new file mode 100644
index 000000000000..60d24adbcf06
--- /dev/null
+++ b/Documentation/gpu/nova/core/interrupts.rst
@@ -0,0 +1,716 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+=================================================
+GPU interrupt handling: GIN and the GSP event
+=================================================
+
+This document describes how nova-core receives interrupts from the GPU on Turing
+and later parts. It covers the GPU Interrupt and Notification unit (GIN), which
+is the GPU's interrupt controller, and the GSP event interrupt.
+
+Throughout, *CPU* means the CPU and the nova-core driver running on it. The GPU
+also has on-chip processors that run their own firmware and receive their own
+interrupts, and the GSP (GPU System Processor) is one of them.
+
+The register names in this document are the names from the GPU hardware
+reference headers. The CPU tree's registers are in the per-function
+``NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_*`` aperture on every supported part, and
+the controller has a different name in the pre-Hopper headers (see "Register
+naming").
+
+Terminology
+===========
+
+The GPU hardware documentation, Open RM, and the Linux PCI API all use the word
+"vector", each for a different number. This document gives each one its own
+name, and a bare "vector" always means a GIN vector.
+
+GIN vector
+    The GPU-internal interrupt source number, 0 through 511 on Hopper. It
+    addresses one bit of one leaf (see "Mapping a vector to the tree"). The CPU
+    doorbell is GIN vector 129 and the GSP event is GIN vector 155.
+
+MSI-X entry
+    An index into the device's MSI-X table. One entry covers one subtree, so a
+    Hopper part uses entries 0 through 7.
+
+Linux IRQ number
+    What ``request_irq()`` takes, obtained from ``pci_irq_vector()``. Linux's
+    ``struct msix_entry`` calls this number ``.vector`` as well.
+
+The three levels of the controller itself, innermost first:
+
+leaf
+    One ``LEAF`` register. Each of its 32 bits is the pending bit of one GIN
+    vector. A pre-Hopper tree has 8 leaves, and a Hopper-plus tree has 16.
+
+subtree
+    Two consecutive leaves, summarized by one bit of ``TOP``. A driver enables
+    and disables whole subtrees, and under MSI-X every interrupt from one
+    subtree arrives on one MSI-X entry.
+
+tree
+    One ``TOP`` register and the leaves beneath it. Every PCIe function has its
+    own tree, and nova-core drives the CPU tree of one function.
+
+The remaining terms, each named for the register or the specification that owns
+it:
+
+enable / disable a GIN vector
+    Writes to ``LEAF_EN_SET`` and ``LEAF_EN_CLEAR``.
+
+enable / disable a subtree
+    Writes to ``TOP_EN_SET`` and ``TOP_EN_CLEAR``.
+
+serviced subtree
+    A subtree nova-core enables and has a handler for.
+
+rearm
+    Restoring PCI interrupt delivery after servicing an interrupt (see
+    "Rearming PCI interrupt delivery").
+
+mask
+    Reserved for the two places where hardware and the PCI specification use
+    the word: the MSI-X per-entry Vector Control mask bit, which Linux owns,
+    and the falcon cause masks. It never names a GIN enable.
+
+latched, pending
+    Two names for one state, a ``LEAF`` bit that is set. The bit is set when its
+    source asserts, whether or not the GIN vector is enabled. A pending bit for
+    a disabled vector does not set the subtree's bit in ``TOP``.
+
+clear a leaf vector
+    Write a 1 to the vector's bit in ``LEAF``. Open RM calls the same operation
+    ``intrClearLeafVector_HAL``.
+
+pending bits
+    The plain bitmask value read from a ``LEAF`` register.
+
+unit
+    A generic interrupt-raising block. "Engine" is reserved for the blocks that
+    do usermode work: GR, CE, NVDEC, and the like.
+
+The GIN controller
+==================
+
+A GPU has many interrupt sources: the GSP, copy engines, the graphics engine,
+video decode and encode, the MMU fault path, timers, and others. Each one has a
+GIN vector number, which is internal to the controller and is not a PCI vector
+index.
+
+GIN records which vectors are pending in its own two-level register tree and
+raises the PCI interrupt when an enabled vector becomes pending in a subtree
+that had none pending. The CPU's handler reads that tree to tell the sources
+apart, clears the pending vectors, and runs the work for each.
+
+How the tree reaches the CPU over PCI
+-------------------------------------
+
+How many PCI interrupt vectors the tree needs depends on the interrupt type
+Linux grants.
+
+MSI has a single message, and every subtree raises that one message. One
+allocated PCI vector serves the whole tree.
+
+MSI-X raises a separate table entry per subtree, so a subtree's interrupts
+arrive on the table entry whose index is the subtree number. Linux leaves an
+entry masked until a driver requests its Linux IRQ number, and a masked entry
+sends no message: the GPU records the interrupt in the MSI-X pending-bit array,
+where it waits to be unmasked. An entry the driver never requests is never
+unmasked, so a driver that enables a subtree without requesting that subtree's
+entry loses every interrupt from it, and loses them silently: the GIN leaf and
+TOP registers show the vector pending and enabled while no handler runs.
+
+The serviced-subtree invariant
+------------------------------
+
+Every subtree enabled at TOP must have an allocated PCI vector with a registered
+handler.
+
+MSI satisfies this with its single message. MSI-X needs one allocated, unmasked
+entry per serviced subtree, and a PCI allocation cannot be sparse, so it runs
+from entry 0 through the highest serviced subtree::
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
+An allocated entry whose subtree the driver does not service costs nothing,
+because the entry stays masked and a disabled subtree raises no interrupt.
+
+nova-core services exactly one subtree. Both vectors it uses, the GSP event
+(155) and the self-test doorbell (129), are in leaf 4, which belongs to subtree
+2. That is also the subtree GSP-RM assigns to its ``UVM_SHARED`` interrupt
+category on every chipset nova-core supports.
+
+Interrupt trees
+===============
+
+GIN keeps a separate interrupt tree for each place an interrupt can be sent to:
+
+* One tree per PCIe function. The Physical Function (PF) has a tree, and each
+  Virtual Function (VF) has a tree.
+* One tree per on-chip microcontroller that receives interrupts, starting with
+  the GSP.
+
+Each destination reaches its own tree through its own register aperture and
+cannot reach another destination's tree. GSP firmware selects the tree each
+unit's interrupt is sent to.
+
+nova-core services the CPU tree of one function. A VF tree belongs to that
+virtual function, and a microcontroller tree belongs to the firmware running on
+that microcontroller.
+
+The two-level tree
+==================
+
+Each tree has two levels. The bottom level is the LEAF registers, which hold one
+pending bit per vector. The top level is the single TOP register, which
+summarizes the leaves.
+
+* Each ``LEAF(i)`` is a 32-bit register holding the pending bits for vectors
+  ``i * 32`` through ``i * 32 + 31``. A set bit means that vector is pending.
+* ``TOP`` is a single 32-bit read-only register. Each of its bits summarizes one
+  *subtree*, which is a pair of adjacent leaves. TOP bit ``N`` reflects
+  ``LEAF[2N]`` and ``LEAF[2N + 1]`` as filtered by their leaf enables, so a
+  vector that latched while disabled does not appear in TOP.
+
+A subtree is two leaves, so a part with L leaves has L / 2 subtrees and uses
+that many TOP bits. An 8-leaf part uses TOP bits 0 through 3 and a 16-leaf part
+uses bits 0 through 7. The remaining bits always read 0::
+
+    TOP  (one 32-bit register, shown here for an 8-leaf part)
+
+      bit 0  ->  subtree 0  ->  LEAF[0], LEAF[1]   vectors   0..63
+      bit 1  ->  subtree 1  ->  LEAF[2], LEAF[3]   vectors  64..127
+      bit 2  ->  subtree 2  ->  LEAF[4], LEAF[5]   vectors 128..191
+      bit 3  ->  subtree 3  ->  LEAF[6], LEAF[7]   vectors 192..255
+
+    A LEAF is one 32-bit register, one bit per vector. For example, LEAF[4]
+    holds vectors 128..159:
+
+      bit 1  = vector 129  (CPU doorbell)
+      bit 27 = vector 155  (GSP event)
+
+Mapping a vector to the tree
+----------------------------
+
+Each vector occupies one bit of one leaf, and each leaf belongs to one
+subtree::
+
+    leaf    = v / 32
+    bit     = v % 32
+    subtree = leaf / 2
+
+Registers
+---------
+
+All the registers are 32 bits, defined under the
+``NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_*`` names in the ``irq`` module's
+``regs.rs``. The leaf registers are arrays indexed by leaf number:
+
+* ``LEAF(i)`` holds the pending bits for the vectors in leaf ``i``. Reading
+  returns the pending bits, and writing a 1 to a bit clears that vector
+  (write-1-to-clear). A handler clears a bit before it services that vector,
+  because clearing afterwards would discard an assertion that arrived while the
+  handler ran.
+* ``LEAF_EN_SET(i)`` and ``LEAF_EN_CLEAR(i)`` enable and disable individual
+  vectors in leaf ``i``.
+* ``TOP`` is the read-only summary: bit N is set when an enabled vector is
+  pending in ``LEAF[2N]`` or ``LEAF[2N + 1]``.
+* ``TOP_EN_SET`` and ``TOP_EN_CLEAR`` enable and disable whole subtrees.
+* ``LEAF_TRIGGER`` makes a vector pending in software. The self-test uses it.
+
+Each bit of a set or clear register acts on its own: writing a 1 performs the
+action for that bit, and writing a 0 leaves the bit's state alone. No caller
+ever needs a read-modify-write.
+
+A vector reaches the CPU only when both its leaf enable bit and its subtree's
+TOP enable bit are set. The leaf enable governs delivery and the TOP summary,
+but not the latch: a disabled vector still latches its LEAF bit, and reading the
+leaf is the only way to see that bit.
+
+How a unit interrupt reaches the CPU
+====================================
+
+A unit does not write a LEAF register itself. Each unit has an interrupt routing
+register, and GSP firmware programs it once at boot. Firmware writes three
+things into it: the unit's VECTOR (which leaf bit it uses), its GFID (which tree
+to post to: the PF or a specific VF), and its destination flags (which consumers
+receive the interrupt: the CPU, the GSP, or another on-chip microcontroller).
+
+Later, when a unit has an event, three things happen in turn::
+
+    1. The unit sends an interrupt message to GIN, carrying the VECTOR, GFID,
+       and destination flags from its routing register.
+    2. GIN sets bit (VECTOR % 32) in LEAF[VECTOR / 32], in the tree that the
+       GFID and destination flags select.
+    3. If that vector is enabled and its subtree is enabled, GIN raises the PCI
+       interrupt to the CPU.
+
+Because firmware assigns the vectors, nova-core does not hardcode which vector
+belongs to which unit, with two exceptions. Firmware pins the GSP event and the
+CPU doorbell to fixed numbers on every supported chip, so nova-core names both
+by number (see "The GSP event vector" and "Self-test").
+
+Edge behavior and rearm
+=======================
+
+The pieces behave as follows:
+
+* A LEAF bit is a latch. It is set on the rising edge of its source and stays set
+  until the CPU writes a 1 to it. A source that stays high does not set the bit
+  again.
+* TOP is read-only and reports the subtree's *enabled* pending state.
+* LEAF_EN and TOP_EN are CPU-controlled enables that allow or block delivery.
+* GIN raises the PCI interrupt for subtree N when the subtree's enabled pending
+  state goes from low to high::
+
+    Per vector, in leaf i at bit b:
+        LEAF[i][b] AND LEAF_EN[i][b]
+
+    Per subtree N, across its leaves 2N and 2N + 1:
+        OR of every enabled pending bit  ->  TOP[N]
+
+    Delivery for subtree N:
+        TOP[N] AND TOP_EN[N]  ->  rising edge  ->  PCI interrupt
+
+    TOP_EN is applied after the TOP summary, so disabling a subtree stops
+    delivery without changing what TOP reports.
+
+Because a disabled vector is invisible in TOP, code that must find every pending
+bit cannot descend from TOP. It has to read the leaves directly. Open RM does
+the same: its stalling-interrupt path never reads TOP, and instead reads the
+LEAF registers of every subtree it implements.
+
+Because delivery is edge-triggered, writing ``TOP_EN_SET`` while an enabled leaf
+bit is still set produces a new edge. A ``TOP_EN`` cycle rearms delivery on that
+edge, and a pending bit left uncleared delivers an interrupt as soon as its
+subtree is enabled again.
+
+A unit that holds an internal level signal high does not produce a new leaf edge
+after the CPU clears the bit, so rearming alone does not re-deliver it. Such
+units have an ``INTR_RETRIGGER`` register that forces a new edge.
+
+Retriggering a falcon
+---------------------
+
+A falcon signals the tree when its set of host-routed interrupt causes goes from
+empty to non-empty. Clearing the tree leaf while a host-routed cause is still
+latched keeps that set non-empty, so no further cause sets the vector and the
+interrupt is lost. Clearing the tree leaf first or the falcon latch first makes
+no difference to that loss, so a handler on a falcon vector writes
+``INTR_RETRIGGER`` on every path that services the vector.
+
+``IRQSTAT`` latches every interrupt cause in the falcon, including the causes
+routed to the falcon's own RISC-V core and owned by the firmware running on it.
+A host handler owns only the causes that both ``PRISCV_RISCV_IRQMASK`` and
+``PRISCV_RISCV_IRQDEST`` select, so it intersects ``IRQSTAT`` with both of them
+before it reads a cause or clears one. Open RM computes the same intersection in
+``kflcnRiscvReadIntrStatus``. GA100 keeps the Turing offsets for both registers
+and GA102 moved them, so the offsets change at GA102 rather than at the Ampere
+boundary.
+
+The ``INTR_RETRIGGER`` write must not be able to raise a cause that nothing
+clears. Before the re-emit, the handler uses ``IRQSCLR`` to clear the latch of
+every host cause it read. The handler masks no cause:
+``PRISCV_RISCV_IRQMASK`` is read-only to the host, and ``FALCON_IRQMASK`` does
+not gate host routing on a RISC-V falcon.
+
+``INTR_RETRIGGER`` is absent on Turing falcons and present from GA100 onward, so
+the write is conditional on the architecture. A Turing handler cannot re-create
+a transition it has lost, so it must leave no host cause latched: it reads the
+host-routed status once and takes every cause that status reports, rather than
+stopping at the first one it recognizes. A cause left behind keeps the
+host-routed set non-empty, and no later cause from that falcon signals the tree
+at all.
+
+One window stays open on Turing. A cause that arrives after the handler has read
+the status is not in the value the handler clears, so it stays latched after the
+tree leaf has been cleared. Open RM has the same window: ``kgspService_TU102``
+ends with ``kflcnIntrRetrigger``, which is implemented from GA100 onward and
+does nothing on Turing.
+
+Rearming PCI interrupt delivery
+-------------------------------
+
+Clearing the GIN state is not enough. A message-signaled interrupt is
+delivered once per edge, and the PCI side delivers no further interrupt until the
+CPU rearms it. Which operation does that depends on the GPU family and on the
+interrupt type Linux granted:
+
+==================  =====  ===========================================
+Architecture        Type   Rearm operation
+==================  =====  ===========================================
+Turing through Ada  MSI    write the configuration-mirror EOI register
+Hopper and later    MSI    clear then set the serviced TOP enables
+Any                 MSI-X  clear then set the handler's own TOP enable
+==================  =====  ===========================================
+
+The MSI forms cover every serviced subtree, because one message serves all of
+them. The MSI-X form covers one subtree, because each serviced subtree has its
+own table entry and its own handler.
+
+nova-core allocates MSI-X or MSI and nothing else. The level-triggered INTx that
+``kernel::pci::IrqType`` also names has no representation in the driver, so the
+table above has no row for it.
+
+A handler must rearm once per delivered interrupt, on every path that services
+one. A handler that skips the rearm receives no further interrupts at all.
+
+The rearm is separate from the TOP_EN writes a full tree walk performs. The walk
+clears TOP_EN on entry, so that it can read and clear the leaves with no new
+interrupts arriving, and it leaves TOP_EN cleared for its caller to enable once
+the caller is ready for deliveries. That clear is not a rearm, and pre-Hopper
+MSI rearms through the configuration mirror, which the walk never writes, so the
+startup sequence rearms explicitly after the walk.
+
+Servicing an interrupt
+======================
+
+nova-core services the tree in one of two ways, depending on which code handles
+the interrupt.
+
+The GSP event handler services one vector, so it leaves its subtree enabled and
+reads and clears only its own leaf bit, touching a single leaf per interrupt.
+
+The startup drain walks the whole tree instead, because it must clear whatever is
+pending across every subtree rather than one known vector. It disables the
+subtrees, clears every pending leaf, and leaves the subtrees disabled.
+
+The drain reads every implemented leaf rather than descending from TOP, because
+sources latch vectors during boot while those vectors are still disabled, and
+TOP does not show those bits.
+
+The two paths as register operations::
+
+    Full tree walk (the one-time startup drain):
+        write TOP_EN_CLEAR = serviced        disable, to stop new interrupts
+        for each implemented leaf i:
+            pending = read LEAF[i]           pending vectors in this leaf
+            write LEAF[i] = pending          clear (write-1-to-clear)
+        (returns with TOP_EN still clear)
+
+    Notification, subtree stays enabled (the GSP event handler, and the
+    self-test, which deliberately mirrors it):
+        pending = read LEAF[gsp_leaf]        is the handler's bit set?
+        write LEAF[gsp_leaf] = gsp_bit       clear that one bit
+        rearm PCI interrupt delivery         see "Rearming PCI interrupt
+                                             delivery"
+
+The walk writes back every bit it read, so it clears every pending leaf bit,
+including the bits nova-core does not handle. An uncleared bit holds its subtree
+in the pending state, and enabling that subtree again would deliver an interrupt
+straight away for a vector that no handler services.
+
+The notification path clears one bit, so a vector pending alongside it in the
+same leaf keeps its bit and stays pending for whoever services it.
+
+Both paths rearm PCI interrupt delivery. A handler rearms for the interrupt it
+has just serviced. The startup path rearms after the walk, because an interrupt
+delivered before probe would have left delivery un-armed, with no handler
+present to rearm it.
+
+Interrupts and notifications
+============================
+
+Two kinds of source use the tree:
+
+* An interrupt means a unit needs servicing.
+* A notification means a unit is reporting that something happened, such as a log
+  record or completed work.
+
+The GSP event is a notification, and its handler takes the notification path
+above.
+
+The hardware manuals also split the vector space into "stall" and "nonstall"
+ranges. Those name address ranges rather than describing behavior. nova-core
+does not service the stall range.
+
+Per-architecture differences
+============================
+
+The tree is the same on every supported GPU except for its size, and there are
+only two sizes, split at Hopper:
+
+===================  ======  ========  ====================
+GPUs                 Leaves  Subtrees  Implemented subtrees
+===================  ======  ========  ====================
+Turing, Ampere, Ada  8       4         ``0x0f``
+Hopper and later     16      8         ``0xff``
+===================  ======  ========  ====================
+
+Sources do not populate every leaf of a 16-leaf tree. The startup drain reads
+every implemented leaf anyway, because a vector can be pending in any of them.
+
+The implemented-subtree set is wider than the set nova-core enables, which holds
+only the subtrees it services. A subtree the architecture does not implement has
+no TOP bit to deliver its vectors, so building a tree that services one fails
+with ``EINVAL``.
+
+The HAL provides the leaf count, and the subtree count (leaves / 2) and the
+implemented-subtree set derive from it. The rearm method is the HAL's other
+per-architecture value.
+
+Multi-die parts
+===============
+
+On multi-die parts the controller is replicated per die, with an aggregation
+level above the per-die TOP registers. nova-core services the CPU tree of one
+function on a single-die part, so it does not drive the aggregation level.
+
+The GSP event
+=============
+
+When the GSP has output for the CPU (log records, error records, and other
+events), it writes the messages into the GSP-to-CPU queue in shared memory and
+raises SWGEN0, one of the software-generated interrupt outputs of the GSP
+microcontroller (a "falcon" in NVIDIA hardware). SWGEN0 is routed through a GIN
+vector, so it reaches the CPU as a PCI interrupt::
+
+    GSP writes messages into the GSP-to-CPU queue
+    GSP raises SWGEN0
+    GIN sets the GSP leaf bit, and the subtree becomes pending
+    PCI interrupt -> Linux IRQ -> nova-core top half, in IRQ context, which
+                                 must not sleep:
+        read the GSP leaf bit and clear it (subtree stays enabled)
+        read the GSP falcon causes routed to the host, clearing SWGEN0 if it
+            was set
+        for every other host cause the status reports: report it, then clear
+            its latch
+        retrigger the falcon
+        rearm PCI interrupt delivery
+        wake the IRQ thread if SWGEN0 was set
+    IRQ thread, which may sleep: take the command-queue lock and drain the
+        GSP-to-CPU queue, routing each message
+
+A halt and a posted message can be pending together, so the top half handles
+every cause the status reports rather than choosing between them (see
+"Retriggering a falcon").
+
+The interrupt is only the trigger to drain the queue. A thread polling for a
+command reply routes the messages it reads through the same classifier (see
+"Draining and classifying the GSP-to-CPU queue").
+
+If the drain fails, the queue cannot advance past the message it could not parse,
+so every later notification would repeat the same failure. The IRQ thread
+disables the GSP vector and reports the failure, which leaves the queue
+unserviced until the device is reset.
+
+Enabling the GSP event
+----------------------
+
+SWGEN0 is a latch, and the GSP drives no new edge into the tree while it stays
+set. GSP boot consumes its notifications by polling the queue, which leaves both
+the latch set and stale state in the tree, so the handoff from polling to
+interrupts has a required order::
+
+    disable every implemented vector    drop enables left by boot or by a
+                                        driver that ran before this one
+    drain the tree (full walk)          clear stale GIN state from boot
+    rearm PCI interrupt delivery        required under pre-Hopper MSI, where
+                                        nothing else does it
+    clear the SWGEN0 latch              so the next assertion makes an edge
+    register the threaded IRQ handler   nothing can reach it yet
+    enable the GSP subtree at TOP       the walk left it disabled
+    enable the GSP vector at its leaf   deliveries become possible here
+    drain the GSP-to-CPU queue          messages posted before the clear
+
+Clearing the latch makes the first interrupt possible. Messages the GSP posted
+before that clear produce no interrupt, so the queue drain follows.
+
+The tree is quiesced before the handler is registered. Registering unmasks the
+PCI interrupt, and a vector that boot left enabled would then deliver to a
+handler that services one vector and has no way to service any other. Open RM
+clears all leaf enables at the same point for the same reason.
+
+The latch is cleared after the tree walk, not before. Clearing it first would
+let a message posted before the walk set the latch again, along with the GSP
+leaf bit. The walk then erases the leaf bit while the latch stays set, and a set
+latch holds the falcon's host-routed set non-empty, so on Turing no later
+message would signal the tree at all. Clearing last can instead leave the GSP
+vector pending with the latch already clear, so enabling the vector delivers one
+interrupt whose ``IRQSTAT`` reads zero. The queue drain that follows reads the
+message.
+
+The subtree is enabled at ``TOP`` once the handler is registered, and disabled
+again only after ``free_irq()`` has returned. Disabling it earlier would let a
+handler still in flight rearm it, leaving the subtree enabled with no handler
+behind it. The explicit enable is required because the walk leaves ``TOP``
+disabled, and under pre-Hopper MSI the rearm is a configuration-space write that
+does not enable it again.
+
+The GSP event vector
+--------------------
+
+The GSP event uses a fixed vector, ``GSP_INTR_0_VECTOR`` (155), on Turing
+through Blackwell. Vector 155 is leaf 4, bit 27, subtree 2. nova-core enables
+that leaf bit and services it, with no runtime vector discovery.
+
+A full unit-to-vector table can be fetched from the GSP by RPC. nova-core does
+not fetch it, because a pinned vector needs no lookup.
+
+Draining and classifying the GSP-to-CPU queue
+=============================================
+
+The queue carries both command replies and unsolicited events. Each message is
+routed by its function code into one of two classes:
+
+* The function code matches the awaited reply. The message is decoded and
+  returned to the caller that sent the command.
+* Anything else is an unsolicited event. OS-error and robust-channel records are
+  logged at error level. An unrecognized function code is logged at warning
+  level. Other known events (GSP logs, libos prints, assertion records,
+  lifecycle notices) need no action, and the classifier does not log them,
+  because the RPC receive trace already records their arrival.
+
+The RPC sequence number appears in the receive trace and takes no part in the
+match, because the GSP does not echo the sequence number of the command on every
+reply. On r570 the reply to ``UnloadingGuestDriver`` carries sequence 0.
+
+The read pointer advances past the message in both cases, and also when a
+matched message fails to decode, so a message is never left at the queue head
+for the next receive to parse again.
+
+Corrupt framing is the exception. A message carries its length inside the
+region the checksum covers, so once the framing or the checksum fails there is
+no trustworthy length with which to skip the message. Such a failure poisons the
+queue, and every later receive fails.
+
+The classifier is a fixed set of function codes rather than a handler registry,
+and it logs the events that need attention.
+
+Both the polling path and the IRQ thread route messages through this classifier
+under the command-queue lock. Replies and events share one queue and one set of
+read pointers, so one lock covers the whole drain. A thread waiting for a reply
+passes each event that arrives before that reply to the classifier and keeps
+waiting, under a single deadline for the whole wait rather than a fresh timeout
+after each message.
+
+With one lock, a drain waits for an in-flight command's receive to finish or
+time out. For log and error records that delay does not matter.
+
+Design notes
+============
+
+Register naming
+---------------
+
+nova-core uses the ``NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_*`` names for the CPU
+tree on both pre-Hopper and Hopper-plus parts. Any function reaches its own tree
+through that aperture. The Hopper-plus central aperture (``NV_GIN_CPU_INTR_*``)
+configures other functions and is not used by the CPU path.
+
+The controller has two names in the hardware headers and in Open RM.
+``NV_CTRL`` names the tree on pre-Hopper parts, and ``NV_GIN`` names the
+Hopper+ unit that contains the tree along with arbiter logic. This document
+calls the controller GIN throughout, because the tree nova-core drives is the
+same on every supported part.
+
+Tree API
+--------
+
+Servicing a leaf has a required order: read its pending bits, then clear them.
+Reading a leaf produces the handle that clears it, so clearing a leaf before
+reading it does not compile. Enabling and disabling a vector or a subtree has no
+such order, so the tree provides those as methods of its own, with no handle
+involved.
+
+The handle orders the calls that service one leaf. It is not a lock and it does
+not coordinate the tree as a whole. Nothing stops two walks from running against
+the tree at once. nova-core does not run concurrent walks: the GSP event handler
+touches only its own leaf and never walks the tree, and the only whole-tree
+walk, the startup drain, runs once during probe.
+
+Threaded handler
+----------------
+
+The queue drain sleeps: it takes the command-queue mutex and walks shared
+memory, so it cannot run in hard-IRQ context. nova-core uses a threaded IRQ
+handler, and the sequence under "The GSP event" shows which work each half
+does. The self-test does no sleeping work and uses a non-threaded handler with a
+completion.
+
+Shared BAR0 mapping
+-------------------
+
+The GPU, the self-test, and the GSP event handler read the same BAR0 registers.
+nova-core keeps one BAR0 mapping and lets each of them borrow it. An interrupt
+handler is torn down when the device unbinds, so it only runs while the mapping
+is alive.
+
+Self-test
+=========
+
+The self-test runs during driver probe. It registers a real interrupt handler
+and confirms that an interrupt injected at the GPU is delivered all the way to
+that handler, so it needs a working GPU and PCI interrupt path. It is gated by
+``CONFIG_NOVA_CORE_IRQ_SELFTEST`` and runs before GSP boot, so it never touches
+GSP interrupt state.
+
+The parts with no hardware dependency are covered by KUnit tests instead: the
+vector encoding, the subtree and leaf arithmetic, and the per-architecture rearm
+policy.
+
+The test drives ``LEAF_TRIGGER``, a hardware register that every supported part
+implements. Writing a vector number to it latches that vector exactly as its
+unit would, after which the vector takes the ordinary path to the CPU under the
+ordinary enables.
+
+The test drives vector 129, at leaf 4 bit 1. It registers a handler for that
+vector and triggers it twice, waiting for the first delivery before triggering
+the second. Its handler deliberately mirrors the notification path: it clears
+only its own leaf bit and rearms PCI interrupt delivery, rather than walking the
+tree.
+
+The two interrupts cannot coalesce into one, because the second is triggered
+only after the first handler has finished. A handler that fails to rearm times
+out on the second delivery instead of passing. One delivery would prove nothing
+about the rearm, and a handler that walked the tree would prove nothing either:
+on every configuration except pre-Hopper MSI the rearm is a ``TOP_EN`` cycle, so
+a walk that enabled ``TOP`` again would rearm delivery whether the handler asked
+for it or not.
+
+The test passes only if both deliveries arrive, each one finds the doorbell bit
+and nothing else pending in the leaf, and the doorbell bit is clear once the
+source is stopped. Anything else fails probe. Requiring the exact mask on the
+second delivery shows that the first handler's clear reached the hardware. The
+test starts by disabling every vector in every implemented leaf and draining the
+tree, and it runs before GSP boot, so no other vector in the doorbell's leaf can
+be active and the exact mask costs nothing.
+
+The test borrows the allocation that probe made for the serviced subtrees rather
+than allocating its own, and looks up the vector for the doorbell's own subtree.
+If the doorbell moved to a subtree nova-core does not service, that lookup
+fails, and the self-test and probe fail with it. The interrupt is not misrouted
+silently.
+
+The test exercises the interrupt path from the GPU to the handler without GSP
+firmware, which is useful when bringing up PCI, MSI, MSI-X, and passthrough
+setups. Under MSI-X a pass also shows that the per-subtree table entry routing
+works, since the delivery arrives on the entry belonging to the serviced
+subtree.
+
+Virtualization
+==============
+
+The per-function trees, the GFID routing, and the central ``NV_GIN`` aperture
+support virtualization: each VF gets its own tree, and the PF or firmware routes
+a unit's interrupt to the right function. MIG (multi-instance GPU) partitioning
+adds more structure. nova-core services the CPU tree of one function, and
+implements no VF tree management, GFID routing, or MIG support.
+
+References
+==========
+
+* nova-core source: the ``irq`` module holds the GIN register definitions, the
+  interrupt HAL, and the tree API. The falcon interrupt registers are in the
+  top-level ``regs.rs``, and the GSP command queue is in the ``gsp`` module.
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 2afa58e8f08d..2130d1caf4c3 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -34,3 +34,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/fwsec
    core/falcon
    core/tlv
+   core/interrupts
-- 
2.55.0

