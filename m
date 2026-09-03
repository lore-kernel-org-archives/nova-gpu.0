Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012023.outbound.protection.outlook.com [52.101.48.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB54735CBD7
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405345; cv=fail; b=P/gXyjyGSErLiCgOEueujhUVZtX+xwQSuvJJiJwVqyRtNQt8KJ/acR5344xSKroCoL0bZ42mFIS6zYjxBKHJTAWPxHTTv4hh0gdJEGa71VWpOE3GAbjZRpcfcFHguf7bRMz4Y4qymnvk7y+4yJAP+YacAe3sNspPvv1sc7qIbBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405345; c=relaxed/simple;
	bh=LHFfDqrOD72XJt682WSkimM6/ZcJUMk3rqHOHgXDqPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tdtwi9sMclEnl/mm7FY8v9JiSKBIf+czoU5uU0lDE8dgZdo2l48GhqapDnqbRkoy9ElO8bNoQ+8SSoNaibjDRjVxoMaV2zhOQLh4W19YHQ6bmmPj6klULuM6DgxUqWywccISHggwRKdvKlW+Mi1+yyzpNysna9EbtRuRDNglwHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GyQPmKle; arc=fail smtp.client-ip=52.101.48.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GyQPmKle"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEcM7peSXQglS9nLBcjN35W6oTzMPcNcCGHJXiVnUFKrD3reSNMonsoLLoxGSF1V9qPL61qCaySjCAf4vfYwNtoG1ZfN6S78nbKuqoScIvsoMB9SlREwlXiuyFOFpAjF4L9Ef92Pu1mRrjT6Ry4nyCSPakDtmYvQE6KJVElD9zuyno7JHLxXRU9IbgpBcVy9VqdlOkipk3RBEPD3f/Zx9a3ymxXIvqMWzseqgPHLX02A75+PjJs/w0iGC28v7aZfpr6LR7AmesPF7gEkWyJrBeG2UfWnvWcxw6ewn319dqv2eBtLWeovi00ROi6/0+QfmAMf8cGtXQRy/iGW3/SSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3NIyM4T03/IcIOIyWZJYWANN6av5BtR5UDvGJepkoQ=;
 b=IS5AQIpdqjwLPS7LNM1A8wlyJUkdCwuVqq7dSf4GZe++7/eXx5SG5CZQefRZRR/VSJ7tGbry3VUx9yh2xuCGEGm0s8C6spy+tX6G/LM7ZNXjEQgbKH1YeS2Pib8I5bBNuWQmxKmm0xipGM5Sj7oCPxaIlrlSWlj6+JhrOoWrmNW9SWxV8TTt6FppH0db1H8Smtnwwnn17XhgZjxs8IwJwi8oX0Xidch1GG+4IvTIOET/KFMVrxdHZSba+tQxuAgvJSx9EQlA6NNej/bvfqKs5X1XMmn/q5kN2A/7umF/XQNOySCJvKCODvUywltTMXJpQTdv7+nIU5Z/6876AO2z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3NIyM4T03/IcIOIyWZJYWANN6av5BtR5UDvGJepkoQ=;
 b=GyQPmKle2kvgOYvg1AS3U7Xb8P77w71Dor9utF1sEyVlbfmu0PEZf/PZ00Out6QgtATHPfZu2UPF1JXjF6wCFwXPVT5+KWgyZH6fCYBCoCGy+5XDelGDTqGUa++CSVPYZL2OJrNP+GIcPcdczBDX/drJ9eqQPArwAJJrITDb76Jpn73QRxWGmE9e0lAV/FkEd6XlZxCnhhicnM3VEaQLJ1JwYcdCLPaGfqIIxsUt/BZ2+iLY2QXFGTOSKdn2y+77GL4z8DAUbQybLruMtvBnO3JPNBEVj8kNrpow9xMNK5FJQAo1qecgJG+JRscTadm8tnYS6QOi8EKDq07O1ki2AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:32 +0000
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
Subject: [PATCH v3 07/14] gpu: nova-core: add an interrupt delivery self-test
Date: Wed,  2 Sep 2026 20:15:06 -0700
Message-ID: <20260903031514.1515905-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0110.namprd05.prod.outlook.com
 (2603:10b6:a03:334::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3f18c7-e6b7-4dec-e202-08df096999aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|11062099010|56012099006|7136999003|10067099003|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	GUi9sd82kbxMW6BFSMZUR0F55NkU4UsdKSQyaCdPAu6lC/73tOcDdLEHoK1j4ZJuM/HG63aJihP4PMZ2o4aC0j95qRlxxrz1DVrE3Wdjvqiy5SCdgqO3kNCrbm3mrYJQBB3wbm3zvttq7wTTdn5AcorSmGaMt4JgviarSOEK4Pn4Ax0EzAgxKHNy1LeJzGcls1+9WJ7Xa7VvmElvbkonp5DAsOai1PTG1z6qqnjMJRqb/D6HZygZPffh6RZZwYDr/ReU9uC4/BwE2aSXDQXcSjFBgbXCNzq663Vjp80zJlo0HzWlc4A14SzcQVJmLcPy0ggZhgr0Vj3z410K0cHLrh1uxH96jyF2bBIpJT/4hB1F3gJ9hjncgMTFf9N9OFA4E56fcV4bI8+1Q0kcDSBiLXWIy9PEM7q4W5u0wl/2sZzTTo/AlKEHwhAcTKG3uIRTwJzvvxunR7mHP+VG/wwKsrtR7vQSF4tBzD+K0IpWPHv3MVyvyOsqVGbiQnL59TZCIRxLIXa3vUfcM8FGQ5Kkf+fisBjjxs5pVMu2HIkpMU75Ckx1rD7EigU497ZoMuIYKekevWwqEUboBd9rPYlU3w2UdsxRyZ8hygwoJk03/JO8zPFQYlKUKJREUsec/eLkc5gqvHT6YPTGepvaUr8mvv5pFPR7++N5Qpfu2GEybEc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(11062099010)(56012099006)(7136999003)(10067099003)(6133799003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i62HtA9maeyqc4MM9LK3VfRDdE1rP23AYhpwVYjYmCBZhILSGyBghB85PDzb?=
 =?us-ascii?Q?AlecoSxmbluwTpRFtrFwaGd9tus3O1HrrSPcn0DEBKICuzZS3yPWf/DIfsN6?=
 =?us-ascii?Q?pMDthDcB0AmQvk8EMsfILTYUJcaAPpAoMgNN0bTWwjZGQ+Eq0+of8jrJ0X+O?=
 =?us-ascii?Q?RvA95WmPFLECzNJ9sbcF6x1WiUaG9js7FqxVkfDJ0WvC6pLHR3KsGGIvpZty?=
 =?us-ascii?Q?fLLSYuh9umC+AR9xZjeZ4FXEVMNOW0+Rm+XXzYyMzlxGW9ah9Yo2LjlRnDbU?=
 =?us-ascii?Q?r1zqZ/MOlOrNryZFNPk0P6HBe1U/r/RgOSkEQDAd37eyXOXs5d1zr3bx9bRl?=
 =?us-ascii?Q?awBYv5w/6e6Yfn9mgSO5WzGrKJ4fLKvMnrQWf0fVmisSgzz7ENZJv/E4zllV?=
 =?us-ascii?Q?SdAAQgmWDKKFW+vjDZ94ezy6nWcD6UgHcAgp9HZ9CrVyt+pWdklWoZvavhRv?=
 =?us-ascii?Q?PQGbzihh4NzOnKAYYq0nQ5V6cXjR1RAp69wD7UXCnvNSYRJ17dY2bM34V0oi?=
 =?us-ascii?Q?v/AyW3Ona6pU5bp18kklEqw0dr+fuVtv1AmcBaKMjxWLfJ4RdiFmjHRhOhdX?=
 =?us-ascii?Q?x3P3H2BmsZslfGFI8KYT7dhAbAuTIdpLWLNTlFmhc8B2AZPg/yEAAnDMrRQc?=
 =?us-ascii?Q?UI9NPL6zn31cy3/lmqaRyJwbOyAcUc2bVwtV2y+wXp8pcPQgtaAvJOoWewzH?=
 =?us-ascii?Q?HoeTz/tEKh5NNo7FZM/HtjaCOGp/DsTQe9Eavfok6G9Dzs4uj4BlTrbENTp9?=
 =?us-ascii?Q?ipDsa01Ys6qteM7g3f5ux9+DqW9Od4YCIUgZrg5xE/Wz88llf3UfdvBF67CS?=
 =?us-ascii?Q?VySCzLkK03FvwOocvtfO2Tj6sbv8Vm5NGFYS623A4cwmg02pGeY0KXMSShgE?=
 =?us-ascii?Q?d0jl6/83LwguAtnXIjr4CCldCDnpui58jJt0zN/56xGFrwP85RYQ4yVln/3Y?=
 =?us-ascii?Q?jJRVu5PLwyG3q7OneTkSkfhnNfLHJ9yUMDoJ6/KDLvKW8l5BGlGhd0K3JdQQ?=
 =?us-ascii?Q?pTzRM2ATil7kiEB8X6uV4GWnZBZBjgPO6aVNtoNYTfv/Vqgjwa2c0IKU3Vi2?=
 =?us-ascii?Q?fLc5w8faFJA86lFCBa6WneOhJ/5mycEAmr5x1gushEcWYGwBbaRoemYD3vlS?=
 =?us-ascii?Q?jyzZWAY94OkfM8TJ8ITC3eMhxKpKs8hCgY6kb6n88aJg22V3AD+pnv9guTo2?=
 =?us-ascii?Q?tPea5Lv8aq54yCgrQ5XemtCrfAwcynCfdbYI4KO7DOApkQs1+yttmfjS5Riy?=
 =?us-ascii?Q?igW1mTODSaYSaNCRzCblLX3k8tfKmAiZ3uxyUE4NziGSHwqLGxrPo2HGyNfA?=
 =?us-ascii?Q?vDCt8hBFMFVNKaLjeiuDezqnlmm1RtRh0E47kSl0prz66CGKpvdy2U4aR5T1?=
 =?us-ascii?Q?0y/uUZnaiXwn7p4w3njwbg8895Zx3ALkP08paiByhSt26LDFyQ6ybU7uAiC7?=
 =?us-ascii?Q?+KzESzVYcbDYRdrnUxtvpXQiDdckni9dfVAPPIhWrZ9EwFLytbyj7HB5/CTq?=
 =?us-ascii?Q?qIURzfS4nP2hb5LOJx7IzPPYSbZc6UCBQJGpUJwF0E/eBvenbzq1LScQv2IP?=
 =?us-ascii?Q?ZxF12CC73mvbEkOWmZfHC3B9OI+qeVcW76EIRoF8Jskn+VgNL2CumnFsOyd9?=
 =?us-ascii?Q?JuR5o+tsO1QvRR08k5xI/uERaEBt1xLswPmJv9k24FfjjP3k3CQX0fdhRQ1Q?=
 =?us-ascii?Q?ilL2KM20Sk+4dwxDklOoNCZyB6E3935Kf/7pjIoqfbNdHYk8ftuSTNSTxBv/?=
 =?us-ascii?Q?d6coQlWgwg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3f18c7-e6b7-4dec-e202-08df096999aa
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:26.5778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uA0+8n9TP6mL6Cz41BCTkxI7cAS0AU68Yg9+mAaCUfU6L++ar06XN2t0exB3fknFiNs30p9Jld5X/YdwQoAqRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

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

Allocate the PCI interrupt vectors alongside the GPU's other resources
rather than in the test, because the vectors are allocated once for the
whole PCI device rather than per handler. The test takes the vector for
the subtree it services.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig               |  15 +
 drivers/gpu/nova-core/gpu.rs                |  25 ++
 drivers/gpu/nova-core/irq.rs                |   9 +
 drivers/gpu/nova-core/irq/doorbell_test.rs  | 301 ++++++++++++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs |   2 +-
 drivers/gpu/nova-core/nova_core.rs          |   2 +-
 6 files changed, 352 insertions(+), 2 deletions(-)
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
index e1ac8ee9ba4d..8a9bc4baf9ac 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -29,6 +29,7 @@
         Gsp,
         GspBootContext, //
     },
+    irq::SubtreeVectors,
     vgpu::VgpuManager, //
 };
 
@@ -292,6 +293,12 @@ pub(crate) struct Gpu<'gpu> {
     /// Must be kept declared *after* `gsp_resources`, as the latter's `PinnedDrop` implementation
     /// requires the sysmem flush page to be in place.
     sysmem_flush: SysmemFlush<'gpu>,
+    /// Self-referential borrow of `vectors`, so this does not have to be repeated in the
+    /// constructor. Will go away with self-referential pin-init.
+    vectors_ref: &'gpu SubtreeVectors<'gpu>,
+    /// PCI interrupt vector allocation. Dropped last (struct field drop order).
+    #[pin]
+    vectors: SubtreeVectors<'gpu>,
 }
 
 #[pinned_drop]
@@ -330,6 +337,12 @@ pub(crate) fn new<'a>(
         let dev = pdev.as_ref();
 
         try_pin_init!(Self {
+            vectors: crate::irq::alloc_vectors(pdev, crate::irq::SERVICED_SUBTREE.into())?,
+
+            // SAFETY: `vectors` is initialized above, lives at a pinned stable address, and is
+            // dropped after every field that uses `vectors_ref` (struct field drop order).
+            vectors_ref: unsafe { &*core::ptr::from_ref(vectors.as_ref().get_ref()) },
+
             spec: Spec::new(dev, bar).inspect(|spec| {
                 dev_info!(dev,"NVIDIA ({})\n", spec);
             })?,
@@ -347,6 +360,18 @@ pub(crate) fn new<'a>(
                     .inspect_err(|_| dev_err!(dev, "GFW boot did not complete\n"))?;
             },
 
+            // Validate the MSI interrupt path before booting GSP, when the self-test is
+            // enabled. This runs on a quiesced interrupt tree with no GSP state present, so it
+            // never observes or clears GSP or PRIV_RING interrupts.
+            _: {
+                // `vectors_ref` exists for the self-test below, which this configuration omits.
+                #[cfg(not(CONFIG_NOVA_CORE_IRQ_SELFTEST))]
+                let _ = vectors_ref;
+
+                #[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
+                crate::irq::doorbell_test::run_selftest(pdev, bar, spec.chipset, vectors_ref)?;
+            },
+
             // Initialize this early because `gsp_resources` depends on it.
             sysmem_flush: SysmemFlush::register(dev, bar, spec.chipset)?,
 
diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index f6ba883d72c5..f44897692b74 100644
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
@@ -25,10 +27,17 @@
 use crate::num;
 
 use interrupt_tree::{
+    GinVector,
     Subtree,
     SubtreeSet, //
 };
 
+/// The subtree nova-core allocates PCI vectors for.
+///
+/// Every source nova-core services latches in this one subtree, so a single allocation covers all
+/// of them.
+pub(crate) const SERVICED_SUBTREE: Subtree = GinVector::new::<129>().subtree();
+
 /// The message-signaled interrupt type a vector allocation obtained.
 ///
 /// nova-core allocates MSI-X or MSI and nothing else, so the level-triggered INTx that
diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nova-core/irq/doorbell_test.rs
new file mode 100644
index 000000000000..a232a83b62f6
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/doorbell_test.rs
@@ -0,0 +1,301 @@
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
+use super::{
+    interrupt_tree::{
+        GinVector,
+        LeafEnableGuard,
+        LeafMask,
+        Subtree,
+        TopEnableGuard,
+        Tree, //
+    },
+    SubtreeVectors, //
+};
+
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
+/// Derived from the vector so that changing `DOORBELL_VECTOR` moves the subtree it enables and the
+/// handler together.
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
+/// `EINVAL` if the doorbell's subtree is not one nova-core services. `EIO` if the doorbell is
+/// already pending before the test, if the delivery count is not two, if the doorbell bit is still
+/// set once the source is stopped, or if either delivery found a pending bit other than the
+/// doorbell. `ETIMEDOUT` if either delivery does not arrive within the timeout.
+pub(crate) fn run_selftest<'a>(
+    pdev: &'a pci::Device<Bound>,
+    bar: Bar0<'a>,
+    chipset: Chipset,
+    vectors: &'a SubtreeVectors<'a>,
+) -> Result {
+    // The interrupt type decides how the handler rearms delivery, so the tree takes it from
+    // probe's allocation.
+    let request = vectors.request_for(DOORBELL_SUBTREE)?;
+    let msi_type = vectors.msi_type();
+    let tree = Tree::new(bar, chipset, msi_type, DOORBELL_SUBTREE.into())?;
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
+        msi_type,
+    );
+
+    // No delivery may reach the CPU before a handler is registered, and a vector left enabled by
+    // boot would fail the pending checks below. `drain` leaves the top level disabled.
+    tree.disable_all_leaves();
+    tree.drain();
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
+        _leaf_guard: reg
+            .handler()
+            .tree
+            .enable_leaf_guarded(doorbell, doorbell_mask),
+        _top_guard: reg.handler().tree.enable_top_guarded(),
+        reg,
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
+    let residual = handler.tree.read_pending(doorbell).vectors();
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
index 0b4dc2fc8ea8..f27f0137dffe 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -420,7 +420,7 @@ pub(super) fn read_pending(&self, leaf: LeafIndex) -> LeafPending<'a> {
     ///
     /// `EINVAL` if `vector` lies outside this tree.
     // Only the interrupt self-test injects a software interrupt.
-    #[expect(dead_code)]
+    #[cfg_attr(not(CONFIG_NOVA_CORE_IRQ_SELFTEST), expect(dead_code))]
     pub(super) fn trigger(&self, vector: GinVector) -> Result {
         vector.validate(self.leaves)?;
         self.bar.write_reg(
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

