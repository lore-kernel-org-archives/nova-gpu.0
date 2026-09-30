Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED548399357
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 03:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739806; cv=fail; b=JAV5yuj7LZrulinjD3cUA8W09VVdTXY4/dwkC91ringC7+68J3tnM/Ct9oEilwq2bDpeuR/S1Je80lRfeh8RK/vsVeLUBEQHsZpxVYgRZqEf/wYhm473HEKPKM1Pg4Uqi7D4swOCq54ZaZgm2lsoe1k/TNWLoF8ukTSwU+7Vpdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739806; c=relaxed/simple;
	bh=NmqoAzNSjQUC017ASwQ2K9aU/m98/3WCsXGFWbaqMsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FmS9bO9utpPzLYpG0948eBGnUgYlbZ7dOPOB/vorCOfAe8X/+Z3GKzCg1v4xvJRl0CB2c6XK/sivmQwN5fCldS9S2Fiiusqu/9LByQehtkMm6ZA/MMci8WlI4Uk7kEquELdftCMsRrxOgmQewT80JdVS9p8M5hY3bf4UBjhd2jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cZFpwC8A; arc=fail smtp.client-ip=40.93.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZFpwC8A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tny98AZKgTxwoNvtbQtoksPbYK74Rw2C3mkZn3pccbjT3hsDh3YefVvq/b7TSzVQN6VKl9IXMgWT1oFiv8ua1ij7bv1oKrk6m0smnEvWoIAw/k+6OxmtMXmJFVm/yMMPn4U7i4PLW/K+FZGyCC5G0XdJdR1JQQ9ndsP9VYrplFJoiFVJ57VAc++eLoL0s9gNrqf8mntPBCOGZozwNqErhAhIswTkDTMXaotJUjvZpJXZCjqjA+Vpdgu3MJaiyWccbdWFHK66d7q5m6akTwtFocQaNHTz2cQThSzqkhb/qUdPfoIz17ES5VW0RKxLUGDzi4ex27LrhNTWj6go6NecSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0klTTmThqfnq1g1zv0tLNexSPgZha8ALAFLSHWh8aU=;
 b=SoW13k1UetpOuAR3wzOVWql0of25bi4GBhFXJN07ipIHMVrBkbccwQCROhNAFcqr8C3RZc6le7eH4//7PqtoeP3NnMn/QGCnPcF11bz5YfE1r0iOxmTO05jTDOWrRFB9OFDHjV2XSBayy0tvbkHpo2z+G2zOzFSy/BBW62V0Bn7F/hFIT2Lq3etL5jSXLwO+1yumsH0/bwxT0Se8f3LwSIsIST508xDmlm0/TLEHD8Xm+mZWUcFTzjHyyye/nAK03WKl9Hpb/eDkx6ebFKdohbtUoCXOT2fc+35DlYKstJ4c2CIyLmerTm9cD4+WJpPlicPdm6qz6wAm5YCMkaUOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0klTTmThqfnq1g1zv0tLNexSPgZha8ALAFLSHWh8aU=;
 b=cZFpwC8ADTaPMxIRyCJ9d1LWg8oQ2tQ4vRQzqVyo9hDhmAYO1YUk8I7gPusWwN7nZgPMy5TEjxM4c9N5d3kwwDW3vbVmhOhpXqEQCWlt6v+6t87WVrzTL3KiP/r5KIIFiO9e3biPmV6KPgZP5hHdQ+/iAC3XfmqKW5jFNH6jgiwepWLA7COvdhf33fOr6+bptTvhlmOjFtI6gMwI9/t7gpKgFhu5v/G+6eQlnKkdd9P5SrAp8Q8swSSKDGln80NK15RnQEcFtWztKGxQzXjE/J3tJe5EM47O2g2w34l1CjJ5msm9r+xfXfDpq5D51VGK9A6PD9K4zQqUGp2cSyG79g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6248.namprd12.prod.outlook.com (2603:10b6:208:3c0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 30 Sep 2026 03:42:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 03:42:27 +0000
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
Subject: [PATCH v5 13/15] gpu: nova-core: service GSP events from the SWGEN0 interrupt
Date: Tue, 29 Sep 2026 20:41:46 -0700
Message-ID: <20260930034148.590687-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930034148.590687-1-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0066.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ae6b18-c916-4ddf-a672-08df1ea4d88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|56012099006|5023799004|11063799006|6133799003|3023799007|7136999003|18002099003|22082099003|11062099010;
X-Microsoft-Antispam-Message-Info:
	+3vx4ivud89NXt0O7D5QWAV5UWs0hs6mC1P+XF+cjYCuV4n6CKgkFL0n89uah4/2TwrBIYIZrxHGhOSxGfcazYdGnmxIK/G2HTVfv4Jgcb5ITYzHxGrULTr5H2bGKYNkl7fdENpdbPwy8mPHUoKbp22ll4LtWk3mKRRoPbpwicRcmQuNxQ4mF9T/zo2t7rCAnPqFcIUO0bgp4UFGT8fWhHYjL/LzN9ZiP5F5G0M3rEEKtLZMLM3ze6toXuayAtDLUM0ewdOx5ft/Gs/W4PZSoE31ZLoEaK+tdhqz6t0sytbUhOm1ZNZF510UV96NhOiq97/T1z1jfTswsbw+stKjT1GHTw6WIU6qFEdXK6up1OGni8sxUT2HG5yrHBUjZaqk7D9OIp8YrXFGBbeT4zIwt+J8skMpKG3xr/6gahCGBwnQI4EbT094IbWNkf3hTKo5a5sYxmuW7m2dvxHrIl3erG7hjCEGl80p+Vb/bBRcuudO9mtADEMIz/BiFhE20EaWHSfYn6cA4bvmTo/sdDk8kYy5Pp2m8mJz0QzSPoTRFHBIn0GXYAxtbdUqAUam6+owwPNIMBuCRl33YB+4uii7A2VbYyHIZic0QCPO+R6G2BdeWoB7fLn4t+Qv/nlUeGTI67DAWwU6xNqEzA2gKotEo2RI6sf33DmNzGefWIBwyBA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(3023799007)(7136999003)(18002099003)(22082099003)(11062099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ggQpyb1g0+9V+lfF151t4nUHPQMIjgFgrrLjZL4fwbKZDBeEwJBTgn7zjO3G?=
 =?us-ascii?Q?63JDM6G2S9G6vKBuTHnJEQ+yo1IkmWxQAmqJ6wVXUHnPf6RrwK4XbEWBxUyg?=
 =?us-ascii?Q?PGhY5ShOqYGTIvk8NBeb34j5d+6TtFHngOFi6tiVS+vZ4cK2/GdEPkXRuyrk?=
 =?us-ascii?Q?QwTH/IWw5M5Z7smQa7Ebez8kZ1OZccvRNPZ25+ugrjBkrOXf+8pbcrcZKY6p?=
 =?us-ascii?Q?Ya5sXUWp8XbVuLvwgLUv8+PWqGHhGX4X3FmhfEkgvtAtyj94wWrfTJ0xb0Tx?=
 =?us-ascii?Q?se9sCUDgBy7/uraRvBSeHX2g2DkbmtLXEOvdK2pKpYsp04+cVtzkDL15Idw9?=
 =?us-ascii?Q?0HvOktfnuBp2G3u0RacsddoAmda8u4zq1uJ8G0OA2LOAD1wSMruUnY1ErVcD?=
 =?us-ascii?Q?CteEUwDWL3SOOL4GhQMnjQqW9sfIdvfTv5SN6IM+odoxVMQTB0SuG8PssB7s?=
 =?us-ascii?Q?u02D6ZKjMy+yT16Bpz5204XHbOcEw4/usNPTbaxMOZZ7fHXQ+jWyiLwGMop4?=
 =?us-ascii?Q?Lwm+8mGdrOe07Mr23XLNt+oidd+Ukh3jUk10p8NMpYr1U151WrAeO/aSIbv/?=
 =?us-ascii?Q?1HCL2GVRBMgLB5G0hgunPn7MRxd1K354BLK0aoxXIadeoH3VnD4nd9HGnjSj?=
 =?us-ascii?Q?4WWBc6xZFLbFq9fJGhiBZwqdvVmRqwMucg1szGO8WiR3Z7DDamLVFUHRLsDS?=
 =?us-ascii?Q?3+C5gLLkDsqSqbJf3g0E6r/vuckiyKX8MhDKFjqHcGV9KHKkkowQ2uulyMeI?=
 =?us-ascii?Q?U/NE4Y24pv3AV8uO905s2pwWEruWA3if880oA/zR4F5I9VwEJgsTVG7yDstp?=
 =?us-ascii?Q?QBBzaGQC8rqreYcf+7HxXcggKkHwIsTTHktsaFG0M044IrJoVJQDzW+rHZru?=
 =?us-ascii?Q?lCNiJq7OekJgk2S2icevE4+8/mJFqrHuB/13Ep4D4sIdal5Nqhhy2h+kWuUM?=
 =?us-ascii?Q?p6iD7/0XYuU4eDdF4B6gUyfx0IwPRsDFwfQgLalPD+Fee5aT9dN9SFkkNE0f?=
 =?us-ascii?Q?zZvbKBYIR4QMA5VOpEydDM1haZlHJbfOKkFjjm+mIPKWjcDtwQ32hqCX6PiI?=
 =?us-ascii?Q?xxV6TWRZpNe0Lt18eI/Lb2y9IjKk5xoAMr4/xpy2b9VCsek615HjO+mVMJ7/?=
 =?us-ascii?Q?M3HZ5I1bp3bRcm5D5IhuB/dTweX32JkkEVQIUMFtQw4X2eRp+/oii+uAJuE5?=
 =?us-ascii?Q?ItYu3tVlKDFiN6D2ng9+lQJDyc/fXTY3IK8TmbUuZGDq3ci/9xvzyAuZgjAA?=
 =?us-ascii?Q?+ZMFyZsU/nn5VkW+YiHefGaQb6S25uw5PwIkBhJjqwU0Oc/DVe0JhkXzAcS1?=
 =?us-ascii?Q?3bQ2GatJduDL6gNjKrpPj+HU6SC3CDsB8o8Dke0CUCr036wD2HxC+TMmmeol?=
 =?us-ascii?Q?GTCnHaH9B+3L2FDT4C4G6x+KK2KiHJXMH3me0k6asRl6f42kM0XNyZesinTv?=
 =?us-ascii?Q?2iKCxIlb0DL8ww+FEkaydZ9uL02yF+aPmw/wDDvb8hH6i/x6E6EipxJx23fX?=
 =?us-ascii?Q?ad9HirXE6FcDh10ysP/JukeBL4TuCZVl1JU0NMDFcOhj8rKbyLwRMmE3kt4r?=
 =?us-ascii?Q?TMiSpz9ZPFVEJ4//aexli4LXT2kLf5AVJd/tLZt/dPJu/gFOKTtgQhOFAoJi?=
 =?us-ascii?Q?NLxtd5s6D/wZe992Ee3Qpnk66r42oY11uh6jLGKNBfGNmGc1Avb6f5HzW0g4?=
 =?us-ascii?Q?dAG4O8PD6e64in6cf0fAC4xPhO0BYlarZVX6/K/+s4sOFczJXFZ68H14ba8t?=
 =?us-ascii?Q?uk81vQ8YHg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ae6b18-c916-4ddf-a672-08df1ea4d88a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:42:26.8035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4tjzL8ueeuGShgaWT55n/u7EU4PCjPBlZwc51teUQqTJoMzVe8dPzVEc+MoQlfaULV936QcUhHriCsxAU0WNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6248

The GSP posts each message for the CPU to the GSP-to-CPU queue and then
raises SWGEN0, a software-generated interrupt cause of its falcon. GIN
delivers SWGEN0 to the CPU on vector 155.

A thread waiting for a command reply was the only reader of the queue,
so an event posted between commands stayed unread until the next
command was sent.

Register a threaded handler on the GSP vector. Draining the queue takes
the command-queue mutex, which can sleep, so the top half reads and
writes only registers and wakes the IRQ thread to drain the queue.
Every existing read of the queue asks for one message type and waits on
a deadline, so add a drain that logs and consumes whatever the GSP has
already posted and returns at once.

When a falcon cause other than SWGEN0 stays set after its latch is
cleared, as the Blackwell fault-containment and ECC causes do, disable
the GSP vector rather than retrigger the falcon. A retrigger would
re-emit the cause at once, and the CPU would take the same interrupt
again and again.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs         |  47 ++++-
 drivers/gpu/nova-core/falcon/hal.rs         |   2 -
 drivers/gpu/nova-core/falcon/hal/tu102.rs   |   2 -
 drivers/gpu/nova-core/gpu.rs                |  96 +++++++++-
 drivers/gpu/nova-core/gsp/cmdq.rs           |  40 ++++
 drivers/gpu/nova-core/irq.rs                |   1 +
 drivers/gpu/nova-core/irq/gsp.rs            | 196 ++++++++++++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs |   3 +
 drivers/gpu/nova-core/nova_core.rs          |   1 -
 9 files changed, 375 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/nova-core/irq/gsp.rs

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index 4c96ae325fda..1faefaede9fe 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -47,13 +47,56 @@ fn pfalcon2(io: Bar0<'_>) -> Mmio<'_, super::PFalcon2Registers> {
 }
 
 impl<'a> Falcon<'a, Gsp> {
-    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
-    /// allow GSP to signal CPU for processing new messages in message queue.
+    /// Clears the SWGEN0 latch in the GSP falcon.
+    ///
+    /// While the latch is set, no later message signals the tree, so a caller that consumed a
+    /// notification by polling must clear it.
     pub(crate) fn clear_swgen0_intr(&self) {
         self.pfalcon
             .write_reg(regs::NV_PFALCON_FALCON_IRQSCLR::zeroed().with_swgen0(true));
     }
 
+    /// Reads the GSP falcon causes that are routed to the host, without clearing any latch.
+    ///
+    /// Every one of them other than SWGEN0 reports a GSP fault.
+    pub(crate) fn read_host_intr(&self) -> regs::NV_PFALCON_FALCON_IRQSTAT {
+        let latched = self.pfalcon.read(regs::NV_PFALCON_FALCON_IRQSTAT);
+
+        self.hal.host_routed_causes(self, latched)
+    }
+
+    /// Reads the host-routed causes and clears the SWGEN0 latch if it was set.
+    ///
+    /// Returns the causes as read, before the clear. No other latch changes.
+    pub(crate) fn take_host_intr(&self) -> regs::NV_PFALCON_FALCON_IRQSTAT {
+        let status = self.read_host_intr();
+
+        if status.swgen0() {
+            self.clear_swgen0_intr();
+        }
+
+        status
+    }
+
+    /// Clears the latch of every interrupt cause set in `status`.
+    ///
+    /// A cause driven from outside the falcon is still set on return, and
+    /// [`Self::read_host_intr`] reports the causes that remain.
+    pub(crate) fn clear_intr(&self, status: regs::NV_PFALCON_FALCON_IRQSTAT) {
+        self.pfalcon
+            .write_reg(regs::NV_PFALCON_FALCON_IRQSCLR::from(status.into_raw()));
+    }
+
+    /// Retriggers the GSP falcon, which then re-emits its host-routed causes into the tree.
+    ///
+    /// Call this only once every host cause is clear. A cause still set is re-emitted at once, and
+    /// its vector arrives again as soon as delivery is rearmed.
+    ///
+    /// Does nothing on Turing, whose falcons have no retrigger register.
+    pub(crate) fn retrigger_intr(&self) {
+        self.hal.retrigger(self);
+    }
+
     /// Checks if GSP reload/resume has completed during the boot process.
     pub(crate) fn check_reload_completed(&self, timeout: Delta) -> Result<bool> {
         read_poll_timeout(
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 2f02da52334e..2643a677caad 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -77,7 +77,6 @@ fn signature_reg_fuse_version(
     ///
     /// The causes routed to the core belong to the firmware running on it, and the host does not
     /// service them.
-    #[expect(dead_code)]
     fn host_routed_causes(
         &self,
         falcon: &Falcon<'_, E>,
@@ -87,7 +86,6 @@ fn host_routed_causes(
     /// Retriggers the falcon, which then re-emits its host-routed causes into the interrupt tree.
     ///
     /// Turing falcons have no retrigger register, so on Turing this does nothing.
-    #[expect(dead_code)]
     fn retrigger(&self, falcon: &Falcon<'_, E>);
 }
 
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index bd66b7759ea6..b25ac645a648 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -28,7 +28,6 @@
 /// retrigger register.
 pub(super) struct Tu102<E: FalconEngine> {
     /// If `true`, the falcons have `NV_PFALCON_FALCON_INTR_RETRIGGER`.
-    #[expect(dead_code)]
     has_intr_retrigger: bool,
     _engine: PhantomData<E>,
 }
@@ -52,7 +51,6 @@ pub(super) fn ga100() -> Self {
 }
 
 /// Writes `NV_PFALCON_FALCON_INTR_RETRIGGER`.
-#[expect(dead_code)]
 pub(super) fn retrigger_ga100<E: FalconEngine>(falcon: &Falcon<'_, E>) {
     falcon.pfalcon.write(
         Array::at(0),
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 65715f906030..b042d68bec1e 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -34,10 +34,19 @@
     fsp::Fsp,
     gsp::{
         self,
+        cmdq::Cmdq,
         commands::GetGspStaticInfoReply,
         Gsp,
         GspBootContext, //
     },
+    irq::{
+        self,
+        gsp::GspIrq,
+        interrupt_tree::{
+            TopEnableGuard,
+            Tree, //
+        }, //
+    },
     mm::{
         bar_user::BarUser,
         pagetable::MmuVersion,
@@ -331,10 +340,53 @@ struct GspResources<'gpu> {
     unload_bundle: Option<gsp::UnloadBundle<'gpu>>,
 }
 
+/// The GSP event handler's registration and the enable of its subtree at `TOP`.
+///
+/// The two drop as a unit, the handler first, on the drop of [`Gpu`] and on the error path of
+/// its constructor alike, so that the subtree is disabled only after the handler is freed.
+#[pin_data]
+struct GspSubtree<'a> {
+    #[pin]
+    irq: GspIrq<'a>,
+    /// Must be kept declared *after* `irq`. A handler still in flight enables the subtree again
+    /// through its rearm.
+    _top: TopEnableGuard<'a>,
+}
+
+impl<'a> GspSubtree<'a> {
+    /// Returns an initializer that registers the GSP event handler and then enables its subtree at
+    /// `TOP`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must not `mem::forget()` the initialized `GspSubtree` or otherwise prevent its
+    /// [`Drop`] implementation, which runs `free_irq`, from running.
+    unsafe fn new(
+        pdev: &'a pci::Device<device::Bound>,
+        tree: &'a Tree<'a>,
+        falcon: &'a Falcon<'a, GspFalcon>,
+        cmdq: &'a Cmdq<'a>,
+    ) -> impl PinInit<Self, Error> + 'a {
+        try_pin_init!(Self {
+            // SAFETY: this function's caller must not leak the `GspSubtree` that owns this
+            // registration, so the registration's `Drop` runs.
+            irq <- unsafe { GspIrq::new(pdev, tree, falcon, cmdq) },
+            _top: tree.enable_top_guarded(),
+        })
+    }
+}
+
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
     pub(crate) spec: Spec,
+    /// GSP event interrupt registration, and the enable of its subtree.
+    ///
+    /// Must be kept declared *before* `gsp_resources`, so that the handler is unregistered, and
+    /// any in-flight run of it has finished, before the command queue that it drains and the
+    /// falcon that it reads are freed, and before the GSP is unloaded.
+    #[pin]
+    _gsp_subtree: GspSubtree<'gpu>,
     /// Static GPU information as provided by the GSP.
     pub(crate) gsp_static_info: GetGspStaticInfoReply,
     /// GPU memory manager owning memory management resources.
@@ -354,6 +406,14 @@ pub(crate) struct Gpu<'gpu> {
     /// Must be kept declared *after* `gsp_resources`, as the latter's `PinnedDrop` implementation
     /// requires the sysmem flush page to be in place.
     sysmem_flush: SysmemFlush<'gpu>,
+    /// Borrow of `tree` that `_gsp_subtree` holds. A field that borrows a sibling field is
+    /// self-referential, which `pin_init` cannot express, so the borrow is taken by hand.
+    tree_ref: &'gpu Tree<'gpu>,
+    /// The GIN CPU interrupt tree and the PCI vectors that deliver it.
+    ///
+    /// Must be kept declared *after* `_gsp_subtree`, which holds a borrow of it.
+    #[pin]
+    tree: Tree<'gpu>,
 }
 
 #[pinned_drop]
@@ -397,6 +457,12 @@ pub(crate) fn new<'a>(
                 dev_info!(dev,"NVIDIA ({})\n", spec);
             })?,
 
+            tree: Tree::new(pdev, bar, spec.chipset, irq::gsp::GSP_SUBTREE.into())?,
+
+            // SAFETY: `tree` is initialized above, is pinned at a stable address, and is dropped
+            // after every field that uses `tree_ref` (struct field drop order).
+            tree_ref: unsafe { &*core::ptr::from_ref(tree.as_ref().get_ref()) },
+
             _: {
                 let dma_mask = hal::gpu_hal(spec.chipset).dma_mask();
 
@@ -422,12 +488,7 @@ pub(crate) fn new<'a>(
 
                 bar,
 
-                gsp_falcon: Falcon::new(
-                    dev,
-                    spec.chipset,
-                    bar
-                )
-                .inspect(|falcon| falcon.clear_swgen0_intr())?,
+                gsp_falcon: Falcon::new(dev, spec.chipset, bar)?,
 
                 sec2_falcon: Falcon::new(dev, spec.chipset, bar)?,
 
@@ -451,6 +512,29 @@ pub(crate) fn new<'a>(
                 })?,
             }),
 
+            _: {
+                irq::gsp::quiesce(tree_ref, &gsp_resources.gsp_falcon);
+            },
+
+            // SAFETY: the GSP falcon and the command queue are fields of `gsp_resources`, which
+            // is initialized above and pinned, so both references outlive the registration. The
+            // registration is a field of `Gpu` and is never leaked, so its `Drop` runs, and field
+            // drop order runs it before either is freed.
+            _gsp_subtree <- unsafe {
+                GspSubtree::new(
+                    pdev,
+                    tree_ref,
+                    &*core::ptr::from_ref(&gsp_resources.gsp_falcon),
+                    &*core::ptr::from_ref(&gsp_resources.gsp.cmdq),
+                )
+            },
+
+            // No interrupt announces the messages that the GSP posted during boot, before the
+            // SWGEN0 latch was cleared.
+            _: {
+                gsp_resources.gsp.cmdq.drain()?;
+            },
+
             gsp_static_info: {
                 // Obtain and display basic GPU information.
                 let info = gsp_resources.gsp.get_static_info()?;
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index ae3808de44e2..1b2f346a237f 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -629,6 +629,20 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
     {
         self.inner.lock().await_msg()
     }
+
+    /// Logs and consumes every message the GSP has already posted, and returns without waiting for
+    /// more.
+    ///
+    /// No caller is waiting for a reply while this holds the queue mutex, so every message is
+    /// logged as an event. See "Draining the GSP-to-CPU queue" in
+    /// `Documentation/gpu/nova/core/interrupts.rst`.
+    ///
+    /// # Errors
+    ///
+    /// `EIO` if a message fails framing or checksum validation.
+    pub(crate) fn drain(&self) -> Result {
+        self.inner.lock().drain()
+    }
 }
 
 /// Inner mutex protected state of [`Cmdq`].
@@ -941,4 +955,30 @@ fn log_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
             }
         }
     }
+
+    /// Logs and consumes every message the queue holds.
+    ///
+    /// # Errors
+    ///
+    /// `EIO` if a message fails framing or checksum validation, or if a message's page count
+    /// overflows a `u32`.
+    fn drain(&mut self) -> Result {
+        while !self.gsp_mem.driver_read_area().0.is_empty() {
+            // A message is available, so this returns without waiting.
+            let msg = self.wait_for_msg(Delta::ZERO)?;
+
+            let pages =
+                u32::try_from(msg.header.length().div_ceil(GSP_PAGE_SIZE)).map_err(|_| {
+                    dev_err!(&self.dev, "GSP drain: message length overflow\n");
+                    EIO
+                })?;
+            let function = msg.header.function();
+            let seq = msg.header.sequence();
+
+            self.gsp_mem.advance_cpu_read_ptr(pages);
+            self.log_event(function, seq);
+        }
+
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index ff8b00a82442..02f9bd84dd19 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -11,6 +11,7 @@
 
 #[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
 pub(crate) mod doorbell_test;
+pub(crate) mod gsp;
 mod hal;
 pub(crate) mod interrupt_tree;
 mod regs;
diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq/gsp.rs
new file mode 100644
index 000000000000..bb504e104bb8
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/gsp.rs
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! The GSP event interrupt.
+//!
+//! The GSP posts messages to the GSP-to-CPU queue and raises SWGEN0, a software-generated cause
+//! of its falcon. A threaded handler services it: the top half clears the tree and falcon state,
+//! and the IRQ thread drains the queue.
+//!
+//! See "The GSP event" in `Documentation/gpu/nova/core/interrupts.rst`.
+
+use kernel::{
+    device,
+    irq,
+    pci,
+    prelude::*, //
+};
+
+use super::interrupt_tree::{
+    GinVector,
+    LeafEnableGuard,
+    Subtree,
+    Tree, //
+};
+use crate::{
+    falcon::{
+        gsp::Gsp as GspFalcon,
+        Falcon, //
+    },
+    gsp::cmdq::Cmdq,
+    regs, //
+};
+
+/// The GSP event vector, which has the same number on every supported GPU.
+const GSP_INTR_0_VECTOR: GinVector = GinVector::new::<155>();
+
+/// The GSP event's subtree, the only one that nova-core services.
+pub(crate) const GSP_SUBTREE: Subtree = GSP_INTR_0_VECTOR.subtree();
+
+/// Clears the tree and falcon interrupt state that GSP boot leaves behind, and rearms PCI
+/// interrupt delivery.
+///
+/// On return, no vector is enabled at its leaf, the serviced subtrees are disabled at `TOP`, and
+/// the SWGEN0 latch is clear, so the next message that the GSP posts signals the tree.
+pub(crate) fn quiesce(tree: &Tree<'_>, falcon: &Falcon<'_, GspFalcon>) {
+    tree.reset();
+    // The latch is cleared after the tree reset. The other order can leave the latch set with its
+    // leaf bit cleared. See "Enabling the GSP event" in interrupts.rst.
+    falcon.clear_swgen0_intr();
+}
+
+/// Threaded IRQ handler for the GSP event.
+pub(crate) struct GspInterrupt<'a> {
+    falcon: &'a Falcon<'a, GspFalcon>,
+    cmdq: &'a Cmdq<'a>,
+    tree: &'a Tree<'a>,
+    /// For logging. The command queue's device reference is behind its mutex, which the top half
+    /// cannot take.
+    dev: &'a device::Device,
+}
+
+impl GspInterrupt<'_> {
+    /// Clears the latch of every host-routed cause in `status` other than SWGEN0, and logs them.
+    ///
+    /// Returns the causes still set after the clear. A cause driven from outside the falcon stays
+    /// set, and only a device reset ends it.
+    fn clear_faults(
+        &self,
+        status: regs::NV_PFALCON_FALCON_IRQSTAT,
+    ) -> regs::NV_PFALCON_FALCON_IRQSTAT {
+        let faults = status.with_swgen0(false);
+        if faults.into_raw() == 0 {
+            return faults;
+        }
+
+        dev_err!(
+            &self.dev,
+            "unserviceable GSP falcon interrupt, IRQSTAT {:#x}\n",
+            status.into_raw()
+        );
+        self.falcon.clear_intr(faults);
+
+        self.falcon.read_host_intr().with_swgen0(false)
+    }
+}
+
+impl irq::ThreadedHandler for GspInterrupt<'_> {
+    /// Top half, in hard interrupt context. Services the GSP vector only, so another vector
+    /// pending in the same leaf stays pending.
+    fn handle(&self) -> irq::ThreadedIrqReturn {
+        let leaf = self.tree.read_pending(GSP_INTR_0_VECTOR.leaf_index());
+        if !leaf.vectors().contains(GSP_INTR_0_VECTOR.leaf_mask()) {
+            self.tree.rearm_pci_irq(GSP_SUBTREE);
+            return irq::ThreadedIrqReturn::None;
+        }
+        leaf.clear_vectors(GSP_INTR_0_VECTOR.leaf_mask());
+
+        let status = self.falcon.take_host_intr();
+
+        let remaining_faults = self.clear_faults(status);
+        if remaining_faults.into_raw() == 0 {
+            self.falcon.retrigger_intr();
+        } else {
+            // Disabling the vector loses no notification: the falcon signals nothing further
+            // while a cause stays set. See "Retriggering a falcon" in interrupts.rst.
+            self.tree.disable_leaf(
+                GSP_INTR_0_VECTOR.leaf_index(),
+                GSP_INTR_0_VECTOR.leaf_mask(),
+            );
+            dev_err!(
+                &self.dev,
+                "GSP falcon cause {:#x} needs a device reset, GSP events are no longer serviced\n",
+                remaining_faults.into_raw()
+            );
+        }
+
+        self.tree.rearm_pci_irq(GSP_SUBTREE);
+
+        if status.swgen0() {
+            irq::ThreadedIrqReturn::WakeThread
+        } else {
+            irq::ThreadedIrqReturn::Handled
+        }
+    }
+
+    /// IRQ thread. Drains the GSP-to-CPU queue, which may sleep.
+    fn handle_threaded(&self) -> irq::IrqReturn {
+        if let Err(e) = self.cmdq.drain() {
+            // The failed message stays at the queue head, so every later drain fails the same way.
+            self.tree.disable_leaf(
+                GSP_INTR_0_VECTOR.leaf_index(),
+                GSP_INTR_0_VECTOR.leaf_mask(),
+            );
+            dev_err!(
+                &self.dev,
+                "GSP event drain failed ({:?}), the message queue is no longer serviced\n",
+                e
+            );
+        }
+        irq::IrqReturn::Handled
+    }
+}
+
+/// The registered GSP event handler and the enable of its vector.
+///
+/// The declaration order is the drop order, and it is required: the vector is disabled before
+/// `free_irq` runs. See "Enabling the GSP event" in `Documentation/gpu/nova/core/interrupts.rst`.
+#[pin_data]
+pub(crate) struct GspIrq<'a> {
+    _leaf_guard: LeafEnableGuard<'a>,
+    #[pin]
+    reg: irq::ThreadedRegistration<'a, GspInterrupt<'a>>,
+}
+
+impl<'a> GspIrq<'a> {
+    /// Returns an initializer that registers the threaded handler and then enables the GSP
+    /// vector at its leaf.
+    ///
+    /// An event that latched while the vector was disabled is delivered as soon as the GSP
+    /// subtree is enabled at `TOP`.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `tree` does not service the GSP subtree. Otherwise the error from
+    /// `request_threaded_irq`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must not `mem::forget()` the initialized `GspIrq` or otherwise prevent its [`Drop`]
+    /// implementation, which runs `free_irq`, from running.
+    pub(crate) unsafe fn new(
+        pdev: &'a pci::Device<device::Bound>,
+        tree: &'a Tree<'a>,
+        falcon: &'a Falcon<'a, GspFalcon>,
+        cmdq: &'a Cmdq<'a>,
+    ) -> impl PinInit<Self, Error> + 'a {
+        let dev = pdev.as_ref();
+
+        try_pin_init!(Self {
+            // SAFETY: this function's caller must not leak the `GspIrq` that owns this
+            // registration, so the registration's `Drop` runs.
+            reg <- unsafe {
+                irq::ThreadedRegistration::new(
+                    tree.request_for(GSP_SUBTREE)?,
+                    irq::Flags::TRIGGER_NONE,
+                    c"nova-core",
+                    Ok(GspInterrupt { falcon, cmdq, tree, dev }),
+                )
+            },
+            _leaf_guard: tree.enable_leaf_guarded(
+                GSP_INTR_0_VECTOR.leaf_index(),
+                GSP_INTR_0_VECTOR.leaf_mask(),
+            ),
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 4bb27cc8b6cd..90d4d11e8ba3 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -124,10 +124,12 @@ pub(super) const fn all() -> Self {
         Self(u32::MAX)
     }
 
+    #[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
     pub(super) const fn from_raw(raw: u32) -> Self {
         Self(raw)
     }
 
+    #[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
     pub(super) const fn into_raw(self) -> u32 {
         self.0
     }
@@ -240,6 +242,7 @@ pub(super) const fn new<const VECTOR: u32>() -> Self {
         Self(Bounded::<u32, VECTOR_BITS>::new::<VECTOR>())
     }
 
+    #[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
     pub(super) const fn into_raw(self) -> u32 {
         self.0.get()
     }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 8c0761dedda4..a8f6dc22057b 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -18,7 +18,6 @@
 mod fsp;
 mod gpu;
 mod gsp;
-#[cfg_attr(not(CONFIG_NOVA_CORE_SELFTESTS), expect(dead_code))]
 mod irq;
 mod mctp;
 mod mm;
-- 
2.55.0

