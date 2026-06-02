Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D236AB56
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370512; cv=fail; b=OEIEq0YhtOPuB8YpU9Wu3r93T66MtmHAAhKlQdTVmU1OHwsD+bE+ZfIhVMHA97wBgZg3aWV6JKycCTsOYBtEUdQ5inbzmuGxCN7rRMFYJxsBCi9AUDq/BTAwYK7a8rfPMeI8a4UZcTqAb/mbi+ccJJXaTa47xWSAAahgBtFMfbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370512; c=relaxed/simple;
	bh=l7CzRBzLa6c4dyemblZLYod3eyGA8DSEU05wf/XxhfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=soLb/kWOrWVRToOo9wHRcGOaOS/iBRC190e75/k06k7hEYp7Fh+GDNIavYuRiCbrlFPLwzIfizpTqUCnI/myqSJ82aC8ugzZwTtkZtKlsXzlDGfMKCXcNefK4GmGshWyeJHjuv/gN4y3DihArc9QRXtFRth9li7Gib6ajuwFixk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YZUP25xb; arc=fail smtp.client-ip=52.101.61.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YZUP25xb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmNhPAdPb45cuaweGkWE5PvJ7iA04ELXHWEmxcPyiUz1G3hiwgFP2B4BR2aUXj1VXqu3bCLneEB7rtNp8Nf5G439svKeXmcH3Kv0TTli1RGm1d9fYaTy+V6nelsrxEMIo6X/c4DBhbzZpjYu1MjvqMrKHfJ4M7v2cAaZ3XMCQq3NrJcs3Q+nL7Yikhr8RGXM2cCKHWbZet5hf6DTGrhBjRxSFoXxDXlTzreayLVTapb8eLenw/3EvLGIsn+nww6BIOzUS/KHXvKmybOWrDJDRYXzk7vv52n4wLB8DNLjFeCNRiWi6VKyDhV9nfNZ8+mHA79cZ7HVjFbKB2imgBkoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0qF2zQowbLBjmG28L67ID3oBgQugwLCymmAGG7cRb8=;
 b=NYA8QP6mWiDrePDCAq4XNYWxju5Tqeu3TKEmfCnqCtVgPkP81px67rrsy2lOk8ml6hnheR9F/rqcVDDczIy4BQRqu7KTdOBo9Jp7IoD8EIe1YxmC4pTC1lKfJgWbrLhgTlYc/2mNNaQXnPVBW/Egw/dDqP0ZE1+iDwBuxUsHr1LNn8yH4qXsetnw4AYc7P/em7uZMJnznA0erEuzGcjBJMQHxkVHlFBXCFnIjJFimyGAHyFkvgNfkacARb/IdZxFqEDD6hijUlvNnsD8MIrrwSk1lgHJaLdfx3ijNIGu82HHKa5XT6cYxkgoKDZOU0qh0NGtEU8UW7wQ9OWkE6LBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0qF2zQowbLBjmG28L67ID3oBgQugwLCymmAGG7cRb8=;
 b=YZUP25xb3QOCqNRrHO9wcDCdBf6fayd9+7pxTdqezzEZEU21sLS/k8ztoeqw6N8rWixha0BUM3wiNMgOBe6iW8ybOr3tGGQNU+mdUr36UoK5PL4BhkovLzzQY8EA4hdoAtP/RWQELJqOhJwDQYeM5B5fz0N+x1yYk80HeA4IXCCBUCSvtkwHstphPSpL1JnPxnUIhSGTJjOjo8XMBSDrCnNk2Au7JsRwWE+EGNEt/5dTowtOyb8hbBwaNE2wh/QscUV8VP4524NZON7pT8x7unGKlrdm3aY4GVFgN5CIU3n6vBSYuMxEulbwLXLj9nvOVfgm3wKnKbdR/CwiKVdXTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:28 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH v12 12/22] gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion waiting
Date: Mon,  1 Jun 2026 20:21:00 -0700
Message-ID: <20260602032111.224790-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 404d6c4c-a21e-4dc8-0eb1-08dec05608ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	XAxZJJ/WrQICyikotL19WIAi8ulltGqbUc/Q3MDOgo/2Jf2wtUmximqh3N2AiZXTa7PO9rJY35tTQt60l47PXn6EGdZeE8FdgxbZq/6Bq2cwm966zJAh+/J09TNOXXbAn3cGxpMpqFGxgfLWfCd90Ya1HbVUZsG8aO0k1CFNz1O6xyWkayjz4WiFubOBTd0obUEF4UTD7h2rPXoRB0Fu9QRTQfpCRDzObK7zj+vLHJXXdYgaWxYdDf4+f5MbD9/F4NSVr9d12cuQXtxEUwgGgZba3PbxI7fMwHOnmUDQeByLM9cv1n37AMPfDjNottdGUJ0pPJj3IDOyRGWJVnOlVSUcW5Zt9DUOoknXF5Z4ZJX1D1aEW4Gqe93GIrUPUKJxwRXhVUBkigFOJhnHrdTosAqkjze2zRB5h9t0DXGtncQA2sbYvQEChyjxINnUkyzgNY83E3ubH5fw99FnQWCNaJ/JEiapu7UXEmeyxDIxrtksgVAj9B2DG+OpY3IW6ncFDtyFw84O47qRMjOtx8OnBcEN4r6VoEGSX2zfIlGioU66rxWs+QLPFJV2QhEz7xT+h+BuTkSVXLZRtIrGYJtz0Anjd2nim9ocGwuwcYs+LgHcYcX1pTak2BJ3hGqZKJ6E5sj2q02S0EtTki1v89iaeR7J2M4JJE2q2MP8HKhXAsJwXE9/kdhCxa0IhnG1jOEv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dwkBIBiummJznlkjNitrK7o5kaTlkMobJOaC+xdjhcn+2OAx68U7lrQkIBAj?=
 =?us-ascii?Q?s253a27WXl4SoxdM3HTLTb1Kbx7ASTyTcRO+DpJp1tUvAyKR1Xos3dfvQd27?=
 =?us-ascii?Q?vXaE0Jfr4MHDFZ8Gk6pSwcfAYbqurVO6K/g6AjZj0xFZW1fXtFSI/C3USbhe?=
 =?us-ascii?Q?rcx3Ehbc2BPejLgIusKIdWvhqg1XnWcK+581i2v37p+DrXrDyp/41YJ8t5om?=
 =?us-ascii?Q?OPrZ2qRFeHDD+m9q6KOdKDhUGX1qssF4vQ/MRPbsr/XXcqi2qI4P4naXUCes?=
 =?us-ascii?Q?it7Oe4xJxw1hMtdp0IyZ9JiWprIEQpLSAdqd/UvJitYRRIoh/2qiob9DDyGT?=
 =?us-ascii?Q?+ux+JMO24cvgpOpDGtprVwp6SS2ihNMiqaxYEEXwBkuufJC9OO2AHJzrSyeF?=
 =?us-ascii?Q?2SuMTCD/8pdJ/gyZS3qcND8Kfsnp1fyP9mURY1CyrH9b4QfqsXpup52Cop9b?=
 =?us-ascii?Q?0Wod2ew2EDsteOPX1Owvcd61Pk0pVG0BwfQNbtxyIuMF0SHjLquGJv7rUdAh?=
 =?us-ascii?Q?FNW0t7lAT3cIZbrPu8/AvNmuUtUrmld8TZCVmMAFYCGD09dqqhxzMa6Alaoi?=
 =?us-ascii?Q?aNvgEVLk7XPrDLAZ1oqQ+rIY0euj6/ee60SOEbvewIzoSlNNK9npD3M1UV/Z?=
 =?us-ascii?Q?OFo4XWu6ONe1h/EmKQv43cOZ9CdcecXkXq//pRG60+i4FkpAgWFmzoB4Nml5?=
 =?us-ascii?Q?WMAAwOH+Lb+4UFwYgF4CT4bwtbOuhZSYsRirTQDFumSakvgITB+RLcI1vCjI?=
 =?us-ascii?Q?z5MXrlr6h+FJwaNeW8jmXQxEYgMtZ1VJ30pWCNdcfBo/8PCaq2IlB/KDDDuT?=
 =?us-ascii?Q?JduVnCJVspLG5PBlVHqj/lhlXDnPw7MXdi8PXNhLktuLjwYFgyzDZOeoR6t9?=
 =?us-ascii?Q?EhMZ4VKmfVKSeqe8OwTkhqlRroxkC6+IwIwpyc+GLpJURQNSoc6fB83+QaT5?=
 =?us-ascii?Q?S+IYLMgoo/QV0hZQP0XMzJquW6CRej89i3Sx8yL9D8f6hQDLsZtIK5Z/JTEx?=
 =?us-ascii?Q?c+HEBkKUPwyc3alr3USnlJRaCPegJH+qWilRAdpzGCNsJCLrO4++MbE18OQ3?=
 =?us-ascii?Q?k+4uDO6UOOCTdF51MH5gMor9bRABJPJzDvUnkB30uCaeHYjP5pSl6RdsUjgt?=
 =?us-ascii?Q?VWbVpe2/TsJkN2/eEwLj925fOxfoQi/yH0BJ91RPvfcQqd0gcLybMMKQiTJM?=
 =?us-ascii?Q?YQCqRPXHvQbS6xWOCL2by/8MXv/UI+2onx3YIf/7qlSW+Is9w1LK0iddHqzi?=
 =?us-ascii?Q?u9tTx6IIX8MWLpbKG5ti917+/2BR01SHUew+z3wdH3MVt2fEoQ3+OA/fU5yx?=
 =?us-ascii?Q?thBwl77tQ0H/mcTl4/bmRCb2ocPWMGSvflbbHiwm+L8DtDsngtwzFdhTI/lM?=
 =?us-ascii?Q?bTifdJPgi1JFQHgGxNyqkAuOTrWGio+yUl8hJCDK11cUmOoc21IoXNsvB356?=
 =?us-ascii?Q?akNY3MQFwdR2XsRoCBtZm4KzF1E/73ZWQ9GcdhAb0x1LnpheZGgUPc0figO7?=
 =?us-ascii?Q?nnlFLg1WiJzM4SC8DauOwb9hGapuCBsS6OTPp09WWb8y+0efRlnIL6Nf+91a?=
 =?us-ascii?Q?SzC27vbXdArZe3HWoA4oBhrdRDZna9fDT4vaecLL9LGf2hdmHDtf/P6rC92n?=
 =?us-ascii?Q?4RW3DXtD/VKolVVReAxhfMf4ZNrQb/4lNfaPKvQ3uEID+SUnJpbuays3k45m?=
 =?us-ascii?Q?yGQeFajLV1f6qZYMybTQL6+mdJVZkCCM4koHt0MRZ7Kpr3pkkfXeb2PHdd9x?=
 =?us-ascii?Q?/gBIdcfc+g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404d6c4c-a21e-4dc8-0eb1-08dec05608ff
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:28.5080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m67u3pUsAOpx7h2zZ8jxPYukk0EydaXct2K+57TkHuPqfkx4VDvAavBLuMz2Mor1A1GmEgUoP8xzTWYII07tQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

Hopper and Blackwell use FSP instead of SEC2 for secure boot. The
driver must wait for FSP secure boot to complete before continuing
with GSP bring-up. Poll for boot success with a 5-second timeout, and
return the FSP interface only on success so that later Chain of Trust
operations cannot run before FSP is ready. The interface owns the FSP
falcon and the FMC firmware.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs    |  1 -
 drivers/gpu/nova-core/fsp.rs           | 73 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/fsp/hal.rs       | 27 ++++++++++
 drivers/gpu/nova-core/fsp/hal/gb202.rs | 23 ++++++++
 drivers/gpu/nova-core/fsp/hal/gh100.rs | 23 ++++++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs |  6 ++-
 drivers/gpu/nova-core/nova_core.rs     |  1 +
 drivers/gpu/nova-core/regs.rs          | 36 +++++++++++++
 8 files changed, 187 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index c4a9ce8a47f8..d9f87262e8b1 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -15,7 +15,6 @@
 };
 
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
-#[expect(dead_code)]
 pub(crate) struct Fsp(());
 
 impl RegisterBase<PFalconBase> for Fsp {
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
new file mode 100644
index 000000000000..f3524137d9f7
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! FSP (Foundation Security Processor) interface for Hopper/Blackwell GPUs.
+//!
+//! Hopper/Blackwell use a simplified firmware boot sequence: FMC, then FSP, then GSP.
+//! Unlike Turing/Ampere/Ada, there is no SEC2 (Security Engine 2) usage.
+//! FSP handles secure boot directly using FMC firmware and Chain of Trust.
+
+use kernel::{
+    device,
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta, //
+};
+
+use crate::{
+    driver::Bar0,
+    falcon::{
+        fsp::Fsp as FspEngine,
+        Falcon, //
+    },
+    firmware::fsp::FspFirmware,
+    gpu::Chipset,
+    regs, //
+};
+
+mod hal;
+
+/// FSP interface for Hopper/Blackwell GPUs.
+///
+/// An `Fsp` is produced by [`Fsp::wait_secure_boot`], which only returns once FSP secure boot
+/// has completed. It owns the FSP falcon and the FMC firmware, which are used for the subsequent
+/// Chain of Trust boot.
+pub(crate) struct Fsp {
+    #[expect(dead_code)]
+    falcon: Falcon<FspEngine>,
+    #[expect(dead_code)]
+    fsp_fw: FspFirmware,
+}
+
+impl Fsp {
+    /// Waits for FSP secure boot completion, then returns the [`Fsp`] interface.
+    ///
+    /// Polls the thermal scratch register until FSP signals boot completion or the timeout
+    /// elapses. Returning an [`Fsp`] only on success guarantees, at the API level, that the
+    /// interface is not used before secure boot has completed.
+    pub(crate) fn wait_secure_boot(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        fsp_fw: FspFirmware,
+    ) -> Result<Fsp> {
+        /// FSP secure boot completion timeout in milliseconds.
+        const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 5000;
+
+        let hal = hal::fsp_hal(chipset).ok_or(ENOTSUPP)?;
+        let falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+
+        read_poll_timeout(
+            || Ok(hal.fsp_boot_status(bar)),
+            |&status| status == regs::NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_SUCCESS,
+            Delta::from_millis(10),
+            Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS),
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP secure boot completion timeout\n");
+            ETIMEDOUT
+        })?;
+
+        Ok(Fsp { falcon, fsp_fw })
+    }
+}
diff --git a/drivers/gpu/nova-core/fsp/hal.rs b/drivers/gpu/nova-core/fsp/hal.rs
new file mode 100644
index 000000000000..83d1e7daa998
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp/hal.rs
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use crate::{
+    driver::Bar0,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+};
+
+mod gb202;
+mod gh100;
+
+pub(super) trait FspHal {
+    /// Returns the secure boot status from the architecture-specific `NV_THERM_I2CS_SCRATCH` register.
+    fn fsp_boot_status(&self, bar: &Bar0) -> u32;
+}
+
+/// Returns the FSP HAL, or `None` if the architecture doesn't support FSP.
+pub(crate) fn fsp_hal(chipset: Chipset) -> Option<&'static dyn FspHal> {
+    match chipset.arch() {
+        Architecture::Turing | Architecture::Ampere | Architecture::Ada => None,
+        Architecture::Hopper | Architecture::BlackwellGB10x => Some(gh100::GH100_HAL),
+        Architecture::BlackwellGB20x => Some(gb202::GB202_HAL),
+    }
+}
diff --git a/drivers/gpu/nova-core/fsp/hal/gb202.rs b/drivers/gpu/nova-core/fsp/hal/gb202.rs
new file mode 100644
index 000000000000..2f08b6c9f308
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp/hal/gb202.rs
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::io::Io;
+
+use crate::{
+    driver::Bar0,
+    fsp::hal::FspHal,
+    regs, //
+};
+
+struct Gb202;
+
+impl FspHal for Gb202 {
+    fn fsp_boot_status(&self, bar: &Bar0) -> u32 {
+        bar.read(regs::gb202::NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE)
+            .fsp_boot_complete()
+            .into()
+    }
+}
+
+const GB202: Gb202 = Gb202;
+pub(super) const GB202_HAL: &dyn FspHal = &GB202;
diff --git a/drivers/gpu/nova-core/fsp/hal/gh100.rs b/drivers/gpu/nova-core/fsp/hal/gh100.rs
new file mode 100644
index 000000000000..290fb55a81da
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp/hal/gh100.rs
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::io::Io;
+
+use crate::{
+    driver::Bar0,
+    fsp::hal::FspHal,
+    regs, //
+};
+
+struct Gh100;
+
+impl FspHal for Gh100 {
+    fn fsp_boot_status(&self, bar: &Bar0) -> u32 {
+        bar.read(regs::gh100::NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE)
+            .fsp_boot_complete()
+            .into()
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn FspHal = &GH100;
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 9681f9a73e86..b25970dd4561 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -20,6 +20,7 @@
         fsp::FspFirmware,
         FIRMWARE_VERSION, //
     },
+    fsp::Fsp,
     gpu::Chipset,
     gsp::{
         boot::BootUnloadGuard,
@@ -40,14 +41,15 @@ fn boot<'a>(
         &self,
         _gsp: &'a Gsp,
         dev: &'a device::Device<device::Bound>,
-        _bar: &'a Bar0,
+        bar: &'a Bar0,
         chipset: Chipset,
         _fb_layout: &FbLayout,
         _wpr_meta: &Coherent<GspFwWprMeta>,
         _gsp_falcon: &'a Falcon<GspEngine>,
         _sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
-        let _fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+        let _fsp = Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
 
         Err(ENOTSUPP)
     }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 5a260062295f..7b6c331da10e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,6 +17,7 @@
 mod falcon;
 mod fb;
 mod firmware;
+mod fsp;
 mod gpu;
 mod gsp;
 #[macro_use]
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b39647684dd1..2cb1f02f35a4 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -587,3 +587,39 @@ pub(crate) mod ga100 {
         }
     }
 }
+
+pub(crate) const NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_SUCCESS: u32 = 0xff;
+
+pub(crate) mod gh100 {
+    use kernel::io::register;
+
+    // PTHERM
+
+    register! {
+        pub(crate) NV_THERM_I2CS_SCRATCH(u32) @ 0x000200bc {
+            31:0    data;
+        }
+
+        // Alias to `NV_THERM_I2CS_SCRATCH` when used to check for FSP boot completion.
+        pub(crate) NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE(u32) => NV_THERM_I2CS_SCRATCH {
+            31:0    fsp_boot_complete;
+        }
+    }
+}
+
+pub(crate) mod gb202 {
+    use kernel::io::register;
+
+    // PTHERM
+
+    register! {
+        pub(crate) NV_THERM_I2CS_SCRATCH(u32) @ 0x00ad00bc {
+            31:0    data;
+        }
+
+        // Alias to `NV_THERM_I2CS_SCRATCH` when used to check for FSP boot completion.
+        pub(crate) NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE(u32) => NV_THERM_I2CS_SCRATCH {
+            31:0    fsp_boot_complete;
+        }
+    }
+}
-- 
2.54.0

