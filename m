Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997BC35E950
	for <nova-gpu@lists.linux.dev>; Sat, 29 Aug 2026 01:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787967220; cv=fail; b=YN+bp3m1+HLEf9fIib00JHYegIint+J72mO/wg+lpriZOcmarnZYn9dyw5oqvG20PCpWKBwCZ0x09bY0kZftTF2RQUb5qHx3i5auXmHn9KIhdJTj2CT30uEa+s3Z8jECLTtMS6+gqIrMtar2j8SgbUVH27Pneps5O1T6V6P2RIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787967220; c=relaxed/simple;
	bh=6gISvyzzNA4sv8+NgNu6bThYJ/MZ7woHadWEQuvTc/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kNPUGvnTo4BLiGrgImXXBqKtJQkHRfuyqkW+ZrXsLFMqwAvy15YI8S0lSuBvsmaaLXIVyIAEiTgyj6tS/zjyBI/oG+Ejo+kIiPvCFIufGRDLg6XLAI8gwsRrxcXAasSbodNtXBhR4Yep/wqnFPEIh1q/nY97fsoxiBgj8n+wHLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o/oPnmZx; arc=fail smtp.client-ip=52.101.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o/oPnmZx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8T0RdrQ8ZYRqK9/otZaScTN+1HNHrGV4T1GeqWniATEWswVPnXdYTRrjV+IrITRmwngp8Uk0uUUq3LM8sqMeTSYxmRkIgu0WfunqFaCZyXujGzCAQxehBA5R5xznFrI9oLZu6ZNxYhgEO76J/FKEB6RNEdsq8Wj9l5Wi/TdijBwl9NYHsZ8Y8gQdD4zZMqQMk4L3oqPd+/dvn+npUduJiyJuaXDhP7YuWKDJHOpehnYo8XiZrUh4bxsSEI4cVcMCa+DHHbbtVvKpCERAVysOOwDf8RcMJJg86e5G/l3MURKpaFBRcTB8VSImTLB8nc9DkgXzLtNlOWugCjaOU+t4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+lPD43wj5wqJVjpS9k8Exj0sQND8iH5lC4XgzESCz8=;
 b=ACwtRc1syDI/flojgXpLyeI68eCE22ntyUO9r2rkqneEF9JmDBwsUH01MTMnR5RAurCn3bStP0kxcunvZuvt1gqZeICOXIRvHmQKz6rzpT5Qw7U86y5CCftB6xrHIY2WDRdcUxCx6MeuL0O5d7cOSduACkxDog2j8KpXE9oMgQZOxXW4vuHnMUjdp9yvf21Y51FltbHb+qc9RszkJLkEepu8uFdtMX4mP8niMBvU9uUkGOP3VCKDWAUZZ3ewyby0iJuYlz+cLL4ziC8j085NJa4HyJd17V72Sii4IrrqKIUVSyuWHY1R6Y1yp65shBQJ2yWz+Q9eAG04WxrZhXCNYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+lPD43wj5wqJVjpS9k8Exj0sQND8iH5lC4XgzESCz8=;
 b=o/oPnmZxBrrh+qGwfzB/Ake+Qw2nbPZ+u/yBF0QcS/S/Dk67M8SD9TpmLt6ibTSLhVMUgI0jNglp8cYfyyAAgpXLboxCjs94qtk2rybXOV8GCJxPriPZ1doSuNbOzltI8TmgSZnx1hvrQwYcdBGwDP0GCs5KplvVp6epzmsW6knpL172qFeVfvT0iC3lPv4sFeCU0PvAdk+khK4tFB35zioUpDcxxNAw5cD5KoqGy+J3Xo/F4LBC9TreO2aInYlQCI/qHwL2xmTiCxj6PWwPHtvzVRMg0FbXzBQWmcu/kyYl98S4DivhLTqKHpSalc7BASQ0lvxZXz+eDyxDqZYsOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SAVPR12MB999121.namprd12.prod.outlook.com (2603:10b6:806:4e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 01:33:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 01:33:33 +0000
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
	Will Pierce <wpierce@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 07/15] gpu: nova-core: add an interrupt delivery self-test
Date: Fri, 28 Aug 2026 18:33:26 -0700
Message-ID: <20260829013324.499542-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829012243.496697-1-jhubbard@nvidia.com>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SAVPR12MB999121:EE_
X-MS-Office365-Filtering-Correlation-Id: f8cfca3f-de19-4228-f810-08df056d89af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Rf/XzPd2XCj0qDrU35e9h7/989ARty81llmaRIR3UyBT2dseWKy087+Ih2w8zCc+fksnwlUXufFAkmytpLhYH9wmAjwty84mQrBWhUBg0NWImHS9DpxW10M7VuE/fxVCgNYvZ4AZAVQSwheYuvMGRV/xh16hys0szlIP1bYfdtX0HLIVsJjLRRofDfxP1khieDPiXpS7up5PQphI971XiOlhn8o3vKfTkXtaylxXAHHTgw5XoDCf3qvTBzpa0ADxWMzdSR/8SutOLEFhVZJSPRjAcFATXQh6RrWxoD3bWADR85XmIf21BlAzwUZiSQAE87VH7YJEOA5wQTbDlnwrwSXPRCJfAUfDwlvX8RfjznWqtnE6AgoVxgOc+nq9Dv52ZkB+ySAv/83v5riG7yTxQ53uAaA1wTfCKCMCyfAkvwQbmJKRQY4BGuMIL+1iFdnhUwkqUH8EFYT5MRx6Qt4ErI14Qaqt/geio0u+GJ+GYFhpcwhuh31s9y53DO367j27B/UaNQNIAnM02vR0UeDcFlOyYWTsTg58qiQQEPKQ/p8Rb+2eD1c28UTamkH3//ADCGyNZaLd0OMaQBrzYGgYswvRvecmLGsYpHt61DKO1tuo9CuIqnePN9poFl4t5rvY6scdSjfygmiQjp0ZqMTitJStyZU2R+p7jFLktFM6FZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qHwccqFGNlhwiHZe9/lKLOEQ45Yt7ErUU9F3IOlOzhXxDRAWTRCOOwpcfu3U?=
 =?us-ascii?Q?mnNRu6YpZ23CpQUaCc00K1ZfcP4OsXvog122y7GZ29SE+2fVBtXz4nMIhMha?=
 =?us-ascii?Q?sCi8EoVi296FENTOuJkVmRpHGrY9Z+eJ6NEu1c1VlB3uN7B6ZZvViah5DcxP?=
 =?us-ascii?Q?KyW4BtglE1iyAQz/ZrKKou7KZdS5hVJj3Hfr+ucdSGErCnUDsi93usJTuSjn?=
 =?us-ascii?Q?6FogX6wOJhhoG7SScgGOqMM06ubQNtOKKF7NNs6YLghm30u7UkJ+rrOahD86?=
 =?us-ascii?Q?3N7d3ubhacgdpxaoffz5u9UMwgYv7N1wdm2n7K7AsBvhDl8hB1Eaai5rRZIM?=
 =?us-ascii?Q?bOck4eVCsgjHtZHJHYdCH5OJidkDp4PghvcVLe51F8uRXCdQqd4Zfkzv7Sbf?=
 =?us-ascii?Q?tGecw2WnGz4wevEMaV6zGX6sG0F7TugcbTuu6wcW54lqFm1ZogzzW2PU7H2l?=
 =?us-ascii?Q?AqB5+QAX5KCYJusHx9K3WtTybJinGOeMpk/6rvoFTaFIohPjadu1MxYuhvlY?=
 =?us-ascii?Q?e3WXsLJ5bGYoDdZmakZ+aKbiMSP0xA2TUCINF3QBu1LbmMuA7ckGGqwT9VRM?=
 =?us-ascii?Q?8qzsaFGnAUdXS35HEUBTSBLrTpy4j+iNvQBhoLjhIWhnmnaoVDs2STvdrDkf?=
 =?us-ascii?Q?Ft0idb+o7kZ7K1aHYbsOzMHKPBBJJT+4BptXrZsHkasSvxr9lUvhfvDj/utM?=
 =?us-ascii?Q?JjzzH6t445xiAR9vrUdsBN5OixOE3bkYUTJFzGDEl2KaGWE2tv+5SgPNROeM?=
 =?us-ascii?Q?Ngf71noCk6A5VdmRFt0sTHtutg8mHUU8k+46bjIxWO4OiNXmPDcB1CeIsIZj?=
 =?us-ascii?Q?F+Zd4G/otFnPAUgMCsVRIYgniiOjm7AHyluVNR/PIQ7JbL+U3mczxTnhrTMA?=
 =?us-ascii?Q?a4Zv1IYIRNJ9JK4sKzYyYFAF0FKvLimaVeHk0us5t3+pMD9Ftrlo8oTUDura?=
 =?us-ascii?Q?3p1vDCy+AzRgTF85WCYbqwqB9vLoIfS/XyGVHF1qM2+bbO3j/RqyhMvI2Fur?=
 =?us-ascii?Q?l8gDFSkEAwV66fH02pq0WwOj3Vnd26s2dL7EXpr3SXuN7SMt4VeyfZwVlRKi?=
 =?us-ascii?Q?T8aIJE170Q+ucylNAR1U7jqQms3dl/o/Sxy9PjIt7AUqt/c5s9wVIqZw7isQ?=
 =?us-ascii?Q?b1l03yiNFN4s08xcyvP7D5mVRMboscFhvrErqzH0HIdqFB6uYiRZ7mg2Mhk0?=
 =?us-ascii?Q?jh0tKam7VKwCHiuqQH6wd9HHlAlhXvSnOrDRJf0M1tx4MIyKXzgi/A5yxcOm?=
 =?us-ascii?Q?JzBFIKkX4GyI5z2CRkEJKdtokJd/nNKiKxeDAZai+aBXIvCm973IducF72xW?=
 =?us-ascii?Q?EJy/7gLck+4d1ulvxB2sATmeM7iGVYEgEy+hefx8HESci5C/Wk/oFBdGs7j1?=
 =?us-ascii?Q?JHQ2+4hn5yBl2m2OT0E7r6rLyE8iGR0zVFmc8M4HARfXZDu5+CM2spIfvg0K?=
 =?us-ascii?Q?sNINKqxnV8WLqaYEw/TxI3PLm+EVWNMYwGDSk0VqJ8RsNI6RSQCHtFOl8WGk?=
 =?us-ascii?Q?F+9IlGIkC7zaLXD3dLw5K/PrfO8jcC2blKq/HV8PFLfxM1Q7AcxiyaUsP8Jo?=
 =?us-ascii?Q?izfnt0wx5ax8aO9ZWbfNZSHj1te979nmgqc0mAD5C20QOuW29pyCnWUFJjAo?=
 =?us-ascii?Q?mu6RSby9gEaJKDisDsIQHDklpyEHR+1ls5J98JNujigmYNz4ZpVlB7K2yn4I?=
 =?us-ascii?Q?+bFqY6g6HBnpUTPAnjHN10yqNimRjD+/OD40ApZdUdcgomL83CNghwBh0w2s?=
 =?us-ascii?Q?XOTgjXvI4Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8cfca3f-de19-4228-f810-08df056d89af
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 01:33:33.0745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+8MR/sOqdRkXehHExJ43ZlP6xe+F+I044h9HXtb0N6Enlncy46qqhjKHbFn0DmtXiqjG2i/lmVkTjPuQleddA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999121

A GPU interrupt can be lost in the MSI or MSI-X allocation, in the GIN
tree's enable bits, or in the rearm. Every one of those failures looks
the same to the driver: no interrupt arrives, and nothing in the symptom
says which one broke.

Add an optional probe-time self-test that injects the CPU doorbell
through the GIN software trigger. One injection would pass even with a
broken rearm, because the first message-signaled interrupt arrives
whether the driver rearms or not. The test injects twice, and waits for
the first handler to rearm before it injects again.

Run it before GSP boot on a quiesced tree, and fail probe unless exactly
two deliveries arrive, each delivery finds only the doorbell pending,
and the leaf ends clear. Under MSI-X the injected subtree has its own
table entry, so the delivery exercises that entry too.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig               |  15 +
 drivers/gpu/nova-core/gpu.rs                |   8 +
 drivers/gpu/nova-core/irq.rs                |   2 +
 drivers/gpu/nova-core/irq/doorbell_test.rs  | 294 ++++++++++++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs |  73 +++--
 drivers/gpu/nova-core/nova_core.rs          |   2 +-
 6 files changed, 367 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/nova-core/irq/doorbell_test.rs

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index f918f69e0599..7198fae6b6f4 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -15,3 +15,18 @@ config NOVA_CORE
 	  This driver is work in progress and may not be functional.
 
 	  If M is selected, the module will be called nova-core.
+
+config NOVA_CORE_IRQ_SELFTEST
+	bool "Nova Core interrupt delivery self-test"
+	depends on NOVA_CORE
+	help
+	  Run an interrupt delivery self-test during nova-core probe. It
+	  injects a known vector through the GPU interrupt controller's
+	  software trigger and confirms the interrupt reaches the driver's
+	  handler, validating the PCI interrupt path from the GPU to the CPU
+	  with no dependency on GSP firmware. The result is printed to dmesg.
+
+	  If the test fails, the PCI probe fails and the driver does not load.
+
+	  This is intended for driver bring-up and for debugging PCI, MSI, or
+	  passthrough setups. If unsure, say N.
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9e4232645a7e..589b4b210a22 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -347,6 +347,14 @@ pub(crate) fn new(
                     .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n"))?;
             },
 
+            // Validate the MSI interrupt path before booting GSP, when the self-test is
+            // enabled. This runs on a quiesced interrupt tree with no GSP state present, so it
+            // never observes or clears GSP or PRIV_RING interrupts.
+            _: {
+                #[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
+                crate::irq::doorbell_test::run_selftest(pdev, bar, spec.chipset)?;
+            },
+
             // Initialize this early because `gsp_resources` depends on it.
             sysmem_flush: SysmemFlush::register(dev, bar, spec.chipset)?,
 
diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index c6bf1dbacabe..37dea5abf833 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -8,6 +8,8 @@
 //!
 //! See `Documentation/gpu/nova/core/interrupts.rst`.
 
+#[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
+pub(crate) mod doorbell_test;
 mod hal;
 mod interrupt_tree;
 mod regs;
diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nova-core/irq/doorbell_test.rs
new file mode 100644
index 000000000000..3fd8b26e135e
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/doorbell_test.rs
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Interrupt delivery self-test, driven through the CPU doorbell vector.
+//!
+//! Exercises the whole PCI interrupt path (GPU to PCIe to CPU to handler) with no GSP dependency:
+//! it injects a known vector through the GIN software trigger and confirms the handler runs. Two
+//! interrupts are triggered one at a time, which also covers the rearm that every delivery after
+//! the first depends on. Gated behind `CONFIG_NOVA_CORE_IRQ_SELFTEST` and run before GSP boot, so
+//! it never observes or clears GSP interrupt state.
+//!
+//! See `Documentation/gpu/nova/core/interrupts.rst`.
+
+use core::pin::Pin;
+
+use kernel::{
+    device::Bound,
+    irq,
+    pci,
+    prelude::*,
+    sync::{
+        atomic::{
+            Atomic,
+            Relaxed, //
+        },
+        Completion, //
+    },
+    time, //
+};
+
+use super::interrupt_tree::{
+    GinVector,
+    LeafEnableGuard,
+    LeafMask,
+    Subtree,
+    TopEnableGuard,
+    Tree, //
+};
+use crate::{
+    driver::Bar0,
+    gpu::Chipset, //
+};
+
+/// Fixed vector for the CPU doorbell.
+///
+/// The resource manager pins the CPU doorbell to this vector on every supported chip, so nova-core
+/// uses the constant directly instead of discovering it at runtime.
+const DOORBELL_VECTOR: GinVector = GinVector::new::<129>();
+
+/// Subtree carrying the doorbell vector, and the only subtree this test services.
+///
+/// Derived from the vector so that changing `DOORBELL_VECTOR` moves the allocation, the subtree it
+/// enables, and the handler together.
+const DOORBELL_SUBTREE: Subtree = DOORBELL_VECTOR.subtree();
+
+/// Time allowed for each of the two deliveries to arrive.
+const DELIVERY_TIMEOUT_MS: time::Msecs = 1000;
+
+/// Interrupt handler installed by the self-test.
+///
+/// Services the doorbell the way a notification source is serviced: it clears its own leaf bit and
+/// rearms PCI interrupt delivery, leaving the rest of the tree untouched. It records the leaf's
+/// pending bits seen on each of the first two deliveries and signals the matching completion.
+#[pin_data]
+struct DoorbellTestHandler<'a> {
+    /// The interrupt tree, which carries the borrowed BAR0 that register access needs.
+    tree: Tree<'a>,
+    /// Signalled by the first delivery.
+    #[pin]
+    first: Completion,
+    /// Signalled by the second delivery.
+    #[pin]
+    second: Completion,
+    /// Count of deliveries this handler has serviced.
+    irq_count: Atomic<u32>,
+    /// Doorbell leaf's pending bits observed on the first delivery.
+    first_pending: Atomic<u32>,
+    /// Doorbell leaf's pending bits observed on the second delivery.
+    second_pending: Atomic<u32>,
+}
+
+impl irq::Handler for DoorbellTestHandler<'_> {
+    fn handle(&self) -> irq::IrqReturn {
+        // Clear only this handler's own bit and leave `TOP_EN` alone. A full walk disables and
+        // enables the tree, which produces a delivery edge by itself and would hide a missing PCI
+        // interrupt rearm.
+        let leaf = self.tree.read_pending(DOORBELL_VECTOR.leaf_index());
+        let pending = leaf.vectors();
+        if !pending.contains(DOORBELL_VECTOR.leaf_mask()) {
+            self.tree.rearm_pci_irq(DOORBELL_SUBTREE);
+            return irq::IrqReturn::None;
+        }
+        leaf.clear_vectors(DOORBELL_VECTOR.leaf_mask());
+
+        let count = self.irq_count.fetch_add(1, Relaxed);
+
+        // Rearm before signalling, so delivery is possible again by the time the waiting thread
+        // triggers the next vector.
+        self.tree.rearm_pci_irq(DOORBELL_SUBTREE);
+
+        match count {
+            0 => {
+                self.first_pending.store(pending.into_raw(), Relaxed);
+                self.first.complete_all();
+            }
+            1 => {
+                self.second_pending.store(pending.into_raw(), Relaxed);
+                self.second.complete_all();
+            }
+            _ => (),
+        }
+
+        irq::IrqReturn::Handled
+    }
+}
+
+/// Everything the running self-test owns, torn down in declaration order.
+///
+/// That order is what every exit path, including an early error, needs: disabling the leaf stops
+/// new deliveries, dropping the registration runs `free_irq()`, which waits for a handler still in
+/// flight, and only then are the tree's subtrees disabled, so a late handler cannot rearm them.
+struct SelftestResources<'a, 'r> {
+    _leaf_guard: LeafEnableGuard<'a>,
+    reg: Pin<KBox<irq::Registration<'r, DoorbellTestHandler<'a>>>>,
+    _top_guard: TopEnableGuard<'a>,
+}
+
+impl<'a> SelftestResources<'a, '_> {
+    /// Returns the registered handler.
+    fn handler(&self) -> &DoorbellTestHandler<'a> {
+        self.reg.handler()
+    }
+
+    /// Disables the doorbell source and waits for a handler already running on another CPU.
+    ///
+    /// On return no further delivery can reach the handler, so its counters and the doorbell
+    /// leaf hold their final values.
+    fn quiesce_source(&self) {
+        self.handler()
+            .tree
+            .disable_leaf(DOORBELL_VECTOR.leaf_index(), DOORBELL_VECTOR.leaf_mask());
+        self.reg.synchronize();
+    }
+}
+
+/// Runs the interrupt delivery self-test.
+///
+/// Quiesces the interrupt tree, registers a temporary handler, and injects the doorbell vector
+/// through the GIN software trigger twice, one delivery at a time. This validates the PCI
+/// interrupt path from GIN to the ISR without GSP firmware, including the rearm without which only
+/// the first interrupt would arrive. The handler, its IRQ registration, and all tree state are
+/// torn down before this returns.
+///
+/// # Errors
+///
+/// `EIO` if the doorbell is already pending before the test, if the delivery count is not two, if
+/// the doorbell bit is still set once the source is stopped, or if either delivery found a pending
+/// bit other than the doorbell. `ETIMEDOUT` if either delivery does not arrive within the timeout.
+pub(crate) fn run_selftest<'a>(
+    pdev: &'a pci::Device<Bound>,
+    bar: Bar0<'a>,
+    chipset: Chipset,
+) -> Result {
+    // The allocated interrupt type decides how the handler rearms delivery, so the vectors are
+    // allocated before the tree is built.
+    let vectors = super::alloc_vectors(pdev, DOORBELL_SUBTREE.into())?;
+    let request = vectors.request_for(DOORBELL_SUBTREE)?;
+    let irq_type = vectors.irq_type();
+    let tree = Tree::new(bar, chipset, irq_type, DOORBELL_SUBTREE.into());
+    let doorbell = DOORBELL_VECTOR.leaf_index();
+    let doorbell_mask = DOORBELL_VECTOR.leaf_mask();
+
+    // Under MSI-X the subtree index is also the table entry the delivery arrives on, so a pass
+    // shows that the per-subtree routing works. Under MSI every subtree shares one entry.
+    dev_info!(
+        pdev.as_ref(),
+        "interrupt self-test: starting on vector {}, subtree {}, with {:?}\n",
+        DOORBELL_VECTOR.into_raw(),
+        DOORBELL_SUBTREE.index(),
+        irq_type,
+    );
+
+    // No delivery may reach the CPU before a handler is registered. `drain` enables the top level
+    // as the last step of its cycle, so disable it again afterward.
+    tree.disable_leaf(doorbell, doorbell_mask);
+    tree.drain();
+    tree.disable_top();
+
+    // A delivery can be credited to the trigger below only if the vector starts out clear, so
+    // refuse to run otherwise.
+    let pre_pending = tree.read_pending(doorbell).vectors();
+    if pre_pending.contains(doorbell_mask) {
+        dev_warn!(
+            pdev.as_ref(),
+            "interrupt self-test: failed, vector {} already pending (leaf[{}] pending {:#x})\n",
+            DOORBELL_VECTOR.into_raw(),
+            doorbell.get(),
+            pre_pending.into_raw(),
+        );
+        return Err(EIO);
+    }
+
+    let handler_init = try_pin_init!(DoorbellTestHandler {
+        tree,
+        first <- Completion::new(),
+        second <- Completion::new(),
+        irq_count: Atomic::new(0),
+        first_pending: Atomic::new(0),
+        second_pending: Atomic::new(0),
+    }? Error);
+
+    // Register the handler before allowing any source to fire.
+    let reg = KBox::pin_init(
+        // SAFETY: the registration is owned by `resources` below and dropped before this function
+        // returns, so its `Drop` (which calls `free_irq()`) always runs and the registration is
+        // never leaked or `mem::forget`-ed.
+        unsafe {
+            irq::Registration::new(
+                request,
+                irq::Flags::TRIGGER_NONE,
+                c"nova-core",
+                handler_init,
+            )
+        },
+        GFP_KERNEL,
+    )?;
+
+    // From here every exit must tear down the source, the registration, and the tree. The fields
+    // are initialized in the order the hardware requires, which is the reverse of the declaration
+    // order that tears them down: the handler is registered above before either source is
+    // enabled, the leaf next, and the top level last.
+    let resources = SelftestResources {
+        reg,
+        _leaf_guard: tree.enable_leaf_guarded(doorbell, doorbell_mask),
+        _top_guard: tree.enable_top_guarded(),
+    };
+    let handler = resources.handler();
+
+    handler.tree.trigger(DOORBELL_VECTOR)?;
+    let mut completed = handler
+        .first
+        .wait_for_completion_timeout(time::msecs_to_jiffies(DELIVERY_TIMEOUT_MS))
+        .is_some();
+
+    // Trigger the second interrupt only once the first handler has cleared its leaf bit and
+    // rearmed, so the two cannot coalesce into one delivery and a handler that never rearms
+    // cannot pass.
+    if completed {
+        handler.tree.trigger(DOORBELL_VECTOR)?;
+        completed = handler
+            .second
+            .wait_for_completion_timeout(time::msecs_to_jiffies(DELIVERY_TIMEOUT_MS))
+            .is_some();
+    }
+
+    // Stop the source and wait out any handler still running, so the values read below are the
+    // final ones.
+    resources.quiesce_source();
+
+    let count = handler.irq_count.load(Relaxed);
+    let first_pending = LeafMask::from_raw(handler.first_pending.load(Relaxed));
+    let second_pending = LeafMask::from_raw(handler.second_pending.load(Relaxed));
+    let residual = tree.read_pending(doorbell).vectors();
+
+    // The self-test runs before GSP boot on a leaf that `drain` has just cleared, and nothing
+    // triggers the vector after the second delivery, so each delivery must find the doorbell bit
+    // and nothing else, and the leaf must end clear.
+    if completed
+        && count == 2
+        && first_pending == doorbell_mask
+        && second_pending == doorbell_mask
+        && !residual.contains(doorbell_mask)
+    {
+        dev_info!(
+            pdev.as_ref(),
+            "interrupt self-test: passed, subtree {}, {} deliveries\n",
+            DOORBELL_SUBTREE.index(),
+            count,
+        );
+        Ok(())
+    } else {
+        dev_warn!(
+            pdev.as_ref(),
+            "interrupt self-test: failed, {} of 2 deliveries, leaf[{}] pending {:#x} and {:#x}, \
+             {:#x} left set\n",
+            count,
+            doorbell.get(),
+            first_pending.into_raw(),
+            second_pending.into_raw(),
+            residual.into_raw(),
+        );
+        Err(if completed { EIO } else { ETIMEDOUT })
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 523b26d55137..1d26ca408dc3 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -240,6 +240,30 @@ pub(super) fn validate(self, leaves: LeafCount) -> Result {
     }
 }
 
+/// Clears the enables of the vectors set in `vectors` for `leaf` (`LEAF_EN_CLEAR`).
+///
+/// Shared by [`Tree::disable_leaf`] and by [`LeafEnableGuard`]'s [`Drop`], which has no tree to
+/// reach through.
+fn clear_leaf_enables(bar: Bar0<'_>, leaf: LeafIndex, vectors: LeafMask) {
+    if let Some(loc) = CPU_INTR_LEAF_EN_CLEAR::try_at(leaf.get()) {
+        bar.write(loc, vectors.into_raw().into());
+    }
+}
+
+/// Clears the `TOP` enables of every subtree in `serviced` (`TOP_EN_CLEAR`).
+fn clear_top_enables(bar: Bar0<'_>, serviced: SubtreeSet) {
+    bar.write(CPU_INTR_TOP_EN_CLEAR, serviced.into_raw().into());
+}
+
+/// Clears the pending vectors set in `vectors` for `leaf` (write-1-to-clear).
+fn clear_leaf_pending(bar: Bar0<'_>, leaf: LeafIndex, vectors: LeafMask) {
+    if !vectors.is_empty() {
+        if let Some(loc) = CPU_INTR_LEAF::try_at(leaf.get()) {
+            bar.write(loc, vectors.into_raw().into());
+        }
+    }
+}
+
 /// Returns the leaves that subtree `index` covers.
 ///
 /// An index beyond the leaf register arrays yields nothing rather than panicking.
@@ -251,6 +275,10 @@ fn subtree_leaves(index: u32) -> impl Iterator<Item = LeafIndex> {
 }
 
 /// The GIN CPU interrupt tree for a single PCIe function.
+///
+/// Copying one is copying a borrowed BAR pointer and three small values, which an interrupt
+/// handler needs so that it owns a tree of its own.
+#[derive(Clone, Copy)]
 pub(super) struct Tree<'a> {
     /// Borrowed BAR0, through which every tree register is reached.
     bar: Bar0<'a>,
@@ -287,11 +315,6 @@ pub(super) fn new(
         }
     }
 
-    /// Returns the subtrees this tree services.
-    pub(super) fn serviced(&self) -> SubtreeSet {
-        self.serviced
-    }
-
     /// Rearms PCI interrupt delivery to the CPU after servicing `subtree`, the one subtree the
     /// calling handler serves.
     ///
@@ -310,15 +333,17 @@ pub(super) fn enable_top(&self) {
 
     /// Disables this tree's serviced subtrees (`TOP_EN_CLEAR`).
     pub(super) fn disable_top(&self) {
-        self.bar
-            .write(CPU_INTR_TOP_EN_CLEAR, self.serviced.into_raw().into());
+        clear_top_enables(self.bar, self.serviced);
     }
 
     /// Enables this tree's serviced subtrees until the returned guard drops.
-    pub(super) fn enable_top_guarded(&self) -> TopEnableGuard<'_> {
+    pub(super) fn enable_top_guarded(&self) -> TopEnableGuard<'a> {
         self.enable_top();
 
-        TopEnableGuard { tree: self }
+        TopEnableGuard {
+            bar: self.bar,
+            serviced: self.serviced,
+        }
     }
 
     /// Enables the vectors set in `vectors` for `leaf` (`LEAF_EN_SET`).
@@ -332,9 +357,7 @@ pub(super) fn enable_leaf(&self, leaf: LeafIndex, vectors: LeafMask) {
 
     /// Disables the vectors set in `vectors` for `leaf` (`LEAF_EN_CLEAR`).
     pub(super) fn disable_leaf(&self, leaf: LeafIndex, vectors: LeafMask) {
-        if let Some(loc) = CPU_INTR_LEAF_EN_CLEAR::try_at(leaf.get()) {
-            self.bar.write(loc, vectors.into_raw().into());
-        }
+        clear_leaf_enables(self.bar, leaf, vectors);
     }
 
     /// Enables `vectors` for `leaf` until the returned guard drops.
@@ -342,24 +365,24 @@ pub(super) fn enable_leaf_guarded(
         &self,
         leaf: LeafIndex,
         vectors: LeafMask,
-    ) -> LeafEnableGuard<'_> {
+    ) -> LeafEnableGuard<'a> {
         self.enable_leaf(leaf, vectors);
 
         LeafEnableGuard {
-            tree: self,
+            bar: self.bar,
             leaf,
             vectors,
         }
     }
 
     /// Reads the vectors pending in `leaf`.
-    pub(super) fn read_pending(&self, leaf: LeafIndex) -> LeafPending<'_> {
+    pub(super) fn read_pending(&self, leaf: LeafIndex) -> LeafPending<'a> {
         let pending = CPU_INTR_LEAF::try_at(leaf.get())
             .map(|loc| self.bar.read(loc).into_raw())
             .unwrap_or(0);
 
         LeafPending {
-            tree: self,
+            bar: self.bar,
             leaf,
             pending: LeafMask::from_raw(pending),
         }
@@ -389,6 +412,7 @@ pub(super) fn trigger(&self, vector: GinVector) -> Result {
     ///
     /// This clears enables outside the subtrees nova-core services, so it is a probe-time
     /// operation only.
+    #[expect(dead_code)]
     pub(super) fn disable_all_leaves(&self) {
         for index in 0..self.leaves.into_raw() {
             if let Some(leaf) = LeafIndex::try_new(index) {
@@ -427,7 +451,7 @@ pub(super) fn drain(&self) {
 /// Holding one is the proof that the leaf was read, which is what [`Self::clear`] and
 /// [`Self::clear_vectors`] require.
 pub(super) struct LeafPending<'a> {
-    tree: &'a Tree<'a>,
+    bar: Bar0<'a>,
     leaf: LeafIndex,
     pending: LeafMask,
 }
@@ -449,11 +473,7 @@ pub(super) fn clear(&self) {
     /// A handler that services one vector uses this rather than [`Self::clear`], which clears
     /// every vector the leaf had pending.
     pub(super) fn clear_vectors(&self, vectors: LeafMask) {
-        if !vectors.is_empty() {
-            if let Some(loc) = CPU_INTR_LEAF::try_at(self.leaf.get()) {
-                self.tree.bar.write(loc, vectors.into_raw().into());
-            }
-        }
+        clear_leaf_pending(self.bar, self.leaf, vectors);
     }
 }
 
@@ -462,24 +482,25 @@ pub(super) fn clear_vectors(&self, vectors: LeafMask) {
 /// Dropping it disables the same vectors, so an error path cannot leave a source enabled with no
 /// handler behind it.
 pub(super) struct LeafEnableGuard<'a> {
-    tree: &'a Tree<'a>,
+    bar: Bar0<'a>,
     leaf: LeafIndex,
     vectors: LeafMask,
 }
 
 impl Drop for LeafEnableGuard<'_> {
     fn drop(&mut self) {
-        self.tree.disable_leaf(self.leaf, self.vectors);
+        clear_leaf_enables(self.bar, self.leaf, self.vectors);
     }
 }
 
 /// Keeps a tree's serviced subtrees enabled at `TOP` for as long as it is held.
 pub(super) struct TopEnableGuard<'a> {
-    tree: &'a Tree<'a>,
+    bar: Bar0<'a>,
+    serviced: SubtreeSet,
 }
 
 impl Drop for TopEnableGuard<'_> {
     fn drop(&mut self) {
-        self.tree.disable_top();
+        clear_top_enables(self.bar, self.serviced);
     }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index dfd11dfe562c..65ce547bd44e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,7 +17,7 @@
 mod fsp;
 mod gpu;
 mod gsp;
-#[expect(dead_code)]
+#[cfg_attr(not(CONFIG_NOVA_CORE_IRQ_SELFTEST), expect(dead_code))]
 mod irq;
 mod mctp;
 #[macro_use]
-- 
2.55.0

