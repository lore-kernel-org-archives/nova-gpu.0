Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012023.outbound.protection.outlook.com [52.101.48.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C71376A10
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405349; cv=fail; b=k4bgo15FqilqNPvrqnmIsKxyYAUBN6x+8X4R8yJSSviZzGHCyWNSgLhHv+GqIZJWxWgvVwMLtBhIG2auC/WFadRvhhVfy19dV3TBL6zFDkyoFLwqT4hu9vc/5PJt2Dio6aTAvJNbsg6Bts8LsCdSAEmARVoPaBos0PtfWFDhgKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405349; c=relaxed/simple;
	bh=U+wHtTOC4hfWPJd9F3XxCne+U69GM3vAKETLl/A0yag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=agufPPGx69X28Q+/cxE84BusjG4bRVzfpX+pbXGRPNFXN0P/4lk4ddEzXFYm88tayEVs6IeaQqDWatpKsDeiDEeo4vxnWXZPdGC+sEGZ4DFrsBus/Q3nZb6ffOfaA6j+YBLOlHaCQJi/Ex8Zm753wmCDbxdUr/MM046mfMH5CWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a3q+nQEd; arc=fail smtp.client-ip=52.101.48.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a3q+nQEd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzHAuDmVNWXSQpx1vqdbJWDUl5whCdwW4RM3hqc9CrIRvCDPhJ/XtsCbDatLhGEpoCtnKjOzh+uAHmbm3h37e0sn2rTV6gGaBiwWOsqm+nk9Ftx3RZCQVtvU9SwlKMiDTaSjetZh2t2KyFTz2JM9biKIA98J91Y6czsePoyq4KXOfZAmQTXhdEV/IbTjRatixwFE97tR8TuEmSAQufjuQ69ehSx8t4HC+FSVptq862SB/gx97pp9xSNAe1scXxktcxFCc58f3VdLUMcOKNqlcsCNRPonkyOJiwo87zH+iFUiIb5N4aoLmLykPmc7W/4bINMAKvZx61aYeb+Mpf3K/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bQvXNg+iaIzRghNyNScEIEHBPbjRI+YVJ1lgAf86D0=;
 b=Q/wDl9kvnWQpu7PYdIZW4u1s+y5qEipK7vW+4qrVH2y31EOMYvoBE8KNh1xBgXqIYl13fcCbe9BGIr92/0SB+BK+1GG0HyI1W4/IVD0OjuBah0i25omK5Mz0Gj7667tlUFtSrd2Yv/NoA0P9nhlqmnaoHFoHFiR+mvi18u+Z4mOU92Sxlqef7WQbKQOgV8qxyw1Sj1jA0V27obCuVWV+JIpHTIVQLKhUGZfiTcdjtGziHZYHgOJI+Qsv5ud6idzaimExp/aJDrOtx3Tpoj8vyEi+dpAoeS5yEbl6F4miAppNrSOG+dkEwHQpAVg1nwIunkJjd3DXDG1bn8tRRBuOhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bQvXNg+iaIzRghNyNScEIEHBPbjRI+YVJ1lgAf86D0=;
 b=a3q+nQEdF/Bzf3lNGaJj7XPu5ekjehLHWy2vLNXn18TAH+pH5e4NbISQU36RPOTloxtbtA6RkRH84DGXClDu87wOmtne8HS48sv/Lsv/Ui5onvTrRSDL3Josgb8uag8b+fPEof9TTTvauCDqZbB4b3aVV6QT1VLKB5XSjwMYwc+zbCPPA7zq19sUv6O1KMN9xL1VR7f11E20eqPSxY8SC2y4iRpnDmyNPzv1DmBi8ekknaQrhgu44p8n9ldGuiiaqYeG8RvdZfFnq60cix9JPBA40vdIVs4hLiKGMFWNlmOZrZu/OvyxQz4NMy5KVCMK/M4RD12V9vAlRVClN1m3uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:34 +0000
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
Subject: [PATCH v3 12/14] gpu: nova-core: drive GSP events with the SWGEN0 interrupt
Date: Wed,  2 Sep 2026 20:15:11 -0700
Message-ID: <20260903031514.1515905-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 530501a5-464a-4185-732e-08df09699d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|11062099010|56012099006|3023799007|7136999003|10067099003|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	3QNg27IyVJIGdUPtEVb/ua0SJ2XMgCSje/vmqp4qGyFWfKIpVpDppI5vlgY8X4PYg+9uubFEP0p5vWrXz9ghA0mdoHYFIVfsLN8wXfe4fQB5POqIxh4rwtAt0Jl55LC0wRn8ABNXnBkCkzgtz8SdGf68RiTI0JBWKJA3qzrJXxMcX/w8PoBeqBRkVxI9F8vgPKpzglQFr7lHTY4xe+x2E8knzJPPdvJST9350eiEy8o/oUvCBf8ayRbhDLtDaat3c6A/JM/0T2LbI0znlMxh15AKP9g5O2BUdcDJKjL2k7TPgBj/UwXHcaCYhUsFc3kgmqsdYImzl3yW39OE5M9szvSpMdcbXTgQtj32YfXv7HI+P5xxD5Wm623zEAvpnVui2t1QuqqUefMyWtvqL5j06GauNvgpnnO7gWWEQMIgLomeR7aMpcBlg0RnFKSHXpCHLYh0hy7Z6eUa2ao9KODABfjOjkKfUaP48f5G7EO8ufsSvF5hioJqKT/lJmmxPcIBDiwj1ZvpJ44vnWG2mWrbnMXxH7jniv4PU94C03NsMJusF9013Spek/r6PdhfBbCQIVd7QDIZDl9GuqIleuuZu8KRIwsRdNgVLgK4UJcFazvQyx44HXUFuKgsbC5KJcVVYDOsDWnX1FOJoB/F/T7cVrQnl/lhZWKu2UuWt2N7IBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(11062099010)(56012099006)(3023799007)(7136999003)(10067099003)(6133799003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8sDIyT1+Fm7CCT1SWpkz8e86dFo8a/hEjcl394cDRPYxMGGEBThg8GT0ugOx?=
 =?us-ascii?Q?0onEeBqZF12c94rOa6jnXWeTmfW0vNkIiOxvgIwFl2O7Q1Bqy6+iG0M5W8OI?=
 =?us-ascii?Q?xo3ZyUTM34bGdTXk7HlH3n55l4pPjri3YOmi6R2tIKPbAgIhshf4Rnf31mpu?=
 =?us-ascii?Q?kdQluzmyaq499DjDPn5a4KkNmuU2pL98TLAvuL0V76FNu8Nhbtxa9JPsnXfm?=
 =?us-ascii?Q?/spFDhLVXV/ksYWTLZdPLE3HMaS9tanzo72642qNNqHfcikpg8qrhIEl2P8n?=
 =?us-ascii?Q?y5JY2LWHsJIADCICxib/ig2u8FnTCVueOxmB9QdqAg5w17/oZ3Sgs1NQmAGg?=
 =?us-ascii?Q?+mGeGpoNGQNtYZzu+UK+eRpnwdHLuXInTv8TW2xg6pqFDpqeyNGitCtw3req?=
 =?us-ascii?Q?5O/8Vf3XQTf7oTCpv9wCHqgUVTa5cUhcbc5nlhI1aIm71HiZ1+oU7ENbeUUA?=
 =?us-ascii?Q?0D+AmtEuiZhqiv74lJCanF8HY893GyS5YkvWqQhAZ1inGeFn0WvNctmNszcO?=
 =?us-ascii?Q?rMMkQ4GcWxvfat/PBFJxD8wulcygcYJmfH3Bs1TqjwXnX8AVSzlBabxxDV+8?=
 =?us-ascii?Q?Y6V/BMyrC9KV13RvKEd3h9hIGBsNTw/VWimYaE8BzfnpEeGqi+90Kh7p0JM4?=
 =?us-ascii?Q?+HM8CwDXuxOnTXqFo6pcOCg9fzauj4hIY0p8YeW9xABW9vZu2BqrlczBMA5K?=
 =?us-ascii?Q?cZRYk5YTsSwjyAwiYRvH/Wan/WwFM5vikJ/z0FEUNQmd7uDFuC5dDRok3c7M?=
 =?us-ascii?Q?8KSrWZnmszeNSTtgPllJEYrfkQxDFZcMaZWO4ywvA1VxrZktLp+cv6wpM6ww?=
 =?us-ascii?Q?ytUyUCKFLPkTIQr/O62GOXk7lFaQBHpkry+peMHvxQVt1xINOqq+l7+PNcbt?=
 =?us-ascii?Q?vRe573j8lvaqzwkvYTgnONMjE3xASHHP+VstTYL/KpI27N5wHvC5VT6d97A9?=
 =?us-ascii?Q?5ig9vOr8J+9uTCDcE2Ys7R0I7nkI9iOw6aDMfLBO8SRKa7Lmkj8Dtzj2oijt?=
 =?us-ascii?Q?ol7lCBO12qLBFlGbHy1aNtvppLLbqj6rZk1IGr6Tg0Spha+ig+V0ckEstRa5?=
 =?us-ascii?Q?5PR6RF/siqCAh8vMsnViM/LYMfWheU5AjzX4Oai/i4fGEU9oUDkowdaWzZMl?=
 =?us-ascii?Q?Dz/o/j/LFZgi33aMZmHjz5v42kXlRfTM2WCqRB80fCVabtojwIvLrxEp4i/B?=
 =?us-ascii?Q?YtQAw9KM0K52qnRCraxokHqqIzczF4E3fVCKSF6dDx/LqWWjFo17gH+vq0tg?=
 =?us-ascii?Q?BeS+DQm8IYgkweT3alyJIhw6bIxCYWI465ATEh+sH+XG+s36jiwyNbHHG5K8?=
 =?us-ascii?Q?GrTYdGo2X340W5/G83DhEQ3nZAp8659kpb3/kFiJW0815W5vGdVNHQmw1cOa?=
 =?us-ascii?Q?/JfuavJBb5Qh+BVwf+bjSUdhW4tj7MAfhK9sGZU7haj6xX99WSf/jJiHoVQO?=
 =?us-ascii?Q?NpPovcvQKKg7wfsiXMLh6wgnQkrFwzg9KFgTuMDzNE0rhQPuR7WvlZ5PiTYc?=
 =?us-ascii?Q?WAldhL5ks8cihuKXHiPDUabRD3xVyIg9pxOUbj5trOPhY1scLqUuzzWHAiIK?=
 =?us-ascii?Q?PmwPgefr68LXuGw/0oonIMUpnezYIVsrvMnBUdxXPNQLTSa8UjOO+axIjYpB?=
 =?us-ascii?Q?0QZjR0b1DmkasPynx8S0Gbpnez3J77sz38Nx8sZtCizP4DfZCjDtFGaeX+AL?=
 =?us-ascii?Q?rI0obarlVcu969jD9tjAYsHFJXl5tMFwaPY1FwHWTIXI5piAzhsdF+5twN2Y?=
 =?us-ascii?Q?re1fB9dVfw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530501a5-464a-4185-732e-08df09699d62
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:32.8319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lgmt9faq3tfIm1BUlLPIVwmqCoCAB924/FjzmlH83Rg1BqWnqW1sd7Hy6OUYq7WkKqhxdR/B3OmsKXyeNglDwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

The GSP posts events, logs and error records to the GSP-to-CPU queue and
raises the falcon SWGEN0 output. A falcon signals the interrupt tree
only on a transition of the causes it routes to the host, and IRQSTAT
also reports the causes the falcon keeps for its own RISC-V core. GSP
boot polls for its own notifications, so it leaves the SWGEN0 latch set
and leaves pending bits behind in the tree.

nova-core drained the queue only while polling for a command reply, so
an event sat unread until the next command was sent.

Service the queue from a threaded handler on the GSP notification
vector. The top half runs in hard interrupt context and touches only
registers: it clears the GIN leaf, takes the causes pending for the
host, writes INTR_RETRIGGER so that a cause arriving while the top half
runs still signals the tree, and rearms PCI delivery. Draining the queue
takes the command-queue mutex, which can sleep, so the top half wakes
the IRQ thread to do it.

Intersect IRQSTAT with the RISC-V routing registers the way Open RM
does, so the firmware's own causes are left alone. Clear the latch of a
host cause that is not a posted message, since nova-core has no recovery
path for one and the retrigger would raise it again.

Put the interrupt setup on the GPU rather than in the driver's probe.
The handler is then torn down before the queue it drains is freed, and
before the GSP is unloaded. Quiesce the tree and clear the latch before
registering, so no boot state reaches the handler, and keep the subtree
enabled at TOP for as long as the handler is registered. Quiescing
disables the subtree, and under pre-Hopper MSI the rearm is a
configuration-space write that never enables it again.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs         |  71 +++++-
 drivers/gpu/nova-core/falcon/hal.rs         |  49 +++-
 drivers/gpu/nova-core/gpu.rs                |  47 +++-
 drivers/gpu/nova-core/gsp.rs                |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs           |  41 ++++
 drivers/gpu/nova-core/irq.rs                |  51 ++++-
 drivers/gpu/nova-core/irq/gsp.rs            | 239 ++++++++++++++++++++
 drivers/gpu/nova-core/irq/interrupt_tree.rs |   8 +
 drivers/gpu/nova-core/nova_core.rs          |   1 -
 9 files changed, 483 insertions(+), 26 deletions(-)
 create mode 100644 drivers/gpu/nova-core/irq/gsp.rs

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index ae32f401aeb0..9e7d332fa77c 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -14,12 +14,15 @@
 };
 
 use crate::{
+    driver::Bar0,
     falcon::{
+        hal,
         Falcon,
         FalconEngine,
         PFalcon2Base,
         PFalconBase, //
     },
+    gpu::Chipset,
     regs,
 };
 
@@ -36,16 +39,72 @@ impl RegisterBase<PFalcon2Base> for Gsp {
 
 impl FalconEngine for Gsp {}
 
-impl<'a> Falcon<'a, Gsp> {
-    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
-    /// allow GSP to signal CPU for processing new messages in message queue.
-    pub(crate) fn clear_swgen0_intr(&self) {
-        self.bar.write(
-            WithBase::of::<Gsp>(),
+impl Gsp {
+    /// Clears the GSP falcon SWGEN0 interrupt latch.
+    ///
+    /// The latch holds until it is cleared, and the GSP drives no new edge into the interrupt
+    /// tree while it is set, so a caller that consumed a notification by any means other than the
+    /// interrupt handler must clear it or no further notification is delivered.
+    pub(crate) fn clear_swgen0_intr(bar: Bar0<'_>) {
+        bar.write(
+            WithBase::of::<Self>(),
             regs::NV_PFALCON_FALCON_IRQSCLR::zeroed().with_swgen0(true),
         );
     }
 
+    /// Reads the GSP falcon interrupt causes pending for the host, clearing the SWGEN0 latch if
+    /// it was set.
+    ///
+    /// Returns the causes as they were read, before the clear. The GSP raises SWGEN0 when it has
+    /// posted messages in the GSP-to-CPU queue, so any other cause here is something else, for
+    /// example a HALT from a GSP crash. Causes the falcon routes to its own RISC-V core belong to
+    /// the firmware and are excluded.
+    pub(crate) fn take_host_intr(
+        bar: Bar0<'_>,
+        chipset: Chipset,
+    ) -> regs::NV_PFALCON_FALCON_IRQSTAT {
+        let latched = bar.read(regs::NV_PFALCON_FALCON_IRQSTAT::of::<Self>());
+        let status = regs::NV_PFALCON_FALCON_IRQSTAT::from(
+            latched.into_raw() & hal::host_intr_routing::<Self>(bar, chipset),
+        );
+
+        if status.swgen0() {
+            Self::clear_swgen0_intr(bar);
+        }
+
+        status
+    }
+
+    /// Clears the latch of every interrupt cause set in `status`.
+    ///
+    /// A cause left latched holds the falcon's host-routed set non-empty, and the falcon signals
+    /// the tree only on a transition of that set.
+    pub(crate) fn clear_intr(bar: Bar0<'_>, status: regs::NV_PFALCON_FALCON_IRQSTAT) {
+        bar.write(
+            WithBase::of::<Self>(),
+            regs::NV_PFALCON_FALCON_IRQSCLR::from(status.into_raw()),
+        );
+    }
+
+    /// Re-emits the falcon's host-routed interrupt causes into the interrupt tree.
+    ///
+    /// The falcon signals the tree on a transition of those causes, so clearing the tree leaf
+    /// while a cause is still latched leaves no transition and no further vector.
+    ///
+    /// Does nothing on Turing, whose falcons do not implement the register.
+    pub(crate) fn retrigger_intr(bar: Bar0<'_>, chipset: Chipset) {
+        if !hal::has_intr_retrigger(chipset) {
+            return;
+        }
+
+        bar.write(
+            WithBase::of::<Self>().at(0),
+            regs::NV_PFALCON_FALCON_INTR_RETRIGGER::zeroed().with_trigger(true),
+        );
+    }
+}
+
+impl<'a> Falcon<'a, Gsp> {
     /// Checks if GSP reload/resume has completed during the boot process.
     pub(crate) fn check_reload_completed(&self, timeout: Delta) -> Result<bool> {
         read_poll_timeout(
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 7e532889a1f4..5272b3b63ae4 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -1,8 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+use kernel::{
+    io::{
+        register::WithBase,
+        Io, //
+    },
+    prelude::*, //
+};
 
 use crate::{
+    driver::Bar0,
     falcon::{
         Falcon,
         FalconBromParams,
@@ -12,6 +19,7 @@
         Architecture,
         Chipset, //
     },
+    regs,
 };
 
 mod ga102;
@@ -72,6 +80,45 @@ fn signature_reg_fuse_version(
     fn load_method(&self) -> LoadMethod;
 }
 
+/// Returns whether `chipset`'s falcons implement `NV_PFALCON_FALCON_INTR_RETRIGGER`.
+///
+/// Turing falcons do not. Ampere and later do, including GA100, whose falcon otherwise uses the
+/// Turing HAL, so this is keyed on the architecture rather than provided through [`FalconHal`].
+pub(crate) fn has_intr_retrigger(chipset: Chipset) -> bool {
+    !matches!(chipset.arch(), Architecture::Turing)
+}
+
+/// Returns whether `chipset` carries the RISC-V interrupt routing registers at the Turing
+/// offsets.
+///
+/// GA102 moved `NV_PRISCV_RISCV_IRQMASK` and `NV_PRISCV_RISCV_IRQDEST`, and GA100 kept the Turing
+/// offsets, which is also why [`falcon_hal`] gives GA100 the Turing HAL.
+fn has_turing_riscv_routing(chipset: Chipset) -> bool {
+    matches!(chipset.arch(), Architecture::Turing) || chipset == Chipset::GA100
+}
+
+/// Returns the interrupt causes a RISC-V falcon on `chipset` routes to the host, in the layout of
+/// `NV_PFALCON_FALCON_IRQSTAT`.
+///
+/// A cause reaches the host only if the RISC-V core both enables it and directs it there, which
+/// `NV_PRISCV_RISCV_IRQMASK` and `NV_PRISCV_RISCV_IRQDEST` say. Every other latched cause belongs
+/// to the firmware running on the core.
+pub(crate) fn host_intr_routing<E: FalconEngine>(bar: Bar0<'_>, chipset: Chipset) -> u32 {
+    if has_turing_riscv_routing(chipset) {
+        bar.read(regs::tu102::NV_PRISCV_RISCV_IRQMASK::of::<E>())
+            .value()
+            & bar
+                .read(regs::tu102::NV_PRISCV_RISCV_IRQDEST::of::<E>())
+                .value()
+    } else {
+        bar.read(regs::ga102::NV_PRISCV_RISCV_IRQMASK::of::<E>())
+            .value()
+            & bar
+                .read(regs::ga102::NV_PRISCV_RISCV_IRQDEST::of::<E>())
+                .value()
+    }
+}
+
 /// Returns a boxed falcon HAL adequate for `chipset`.
 ///
 /// We use a heap-allocated trait object instead of a statically defined one because the
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8a9bc4baf9ac..763f1b633d32 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -29,7 +29,10 @@
         Gsp,
         GspBootContext, //
     },
-    irq::SubtreeVectors,
+    irq::{
+        gsp::GspIrq,
+        SubtreeVectors, //
+    },
     vgpu::VgpuManager, //
 };
 
@@ -282,6 +285,12 @@ struct GspResources<'gpu> {
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
     spec: Spec,
+    /// GSP event interrupt registration.
+    ///
+    /// Declared before `gsp_resources` so it is dropped first: `free_irq` runs, waiting out any
+    /// in-flight handler, before the queue it drains goes away and before the GSP is unloaded.
+    #[pin]
+    _gsp_irq: GspIrq<'gpu>,
     /// Static GPU information as provided by the GSP.
     gsp_static_info: GetGspStaticInfoReply,
     /// GSP and its resources.
@@ -337,7 +346,7 @@ pub(crate) fn new<'a>(
         let dev = pdev.as_ref();
 
         try_pin_init!(Self {
-            vectors: crate::irq::alloc_vectors(pdev, crate::irq::SERVICED_SUBTREE.into())?,
+            vectors: crate::irq::alloc_vectors(pdev, crate::irq::gsp::GSP_SUBTREE.into())?,
 
             // SAFETY: `vectors` is initialized above, lives at a pinned stable address, and is
             // dropped after every field that uses `vectors_ref` (struct field drop order).
@@ -382,12 +391,7 @@ pub(crate) fn new<'a>(
 
                 bar,
 
-                gsp_falcon: Falcon::new(
-                    dev,
-                    spec.chipset,
-                    bar
-                )
-                .inspect(|falcon| falcon.clear_swgen0_intr())?,
+                gsp_falcon: Falcon::new(dev, spec.chipset, bar)?,
 
                 sec2_falcon: Falcon::new(dev, spec.chipset, bar)?,
 
@@ -411,6 +415,33 @@ pub(crate) fn new<'a>(
                 })?,
             }),
 
+            // Clear the interrupt state GSP boot left behind, before registering the handler
+            // below.
+            _: {
+                crate::irq::gsp::quiesce(bar, gsp_resources.spec.chipset, vectors_ref)?;
+            },
+
+            // Register the permanent GSP SWGEN0 handler, which enables the interrupt.
+            //
+            // SAFETY: the command queue lives in `gsp_resources`, which is initialized above and
+            // pinned. `_gsp_irq` is declared before `gsp_resources` and `vectors`, so it is
+            // dropped first, ensuring `free_irq` runs before either the queue or the vectors go
+            // away. The registration is stored in `Gpu` and never leaked.
+            _gsp_irq <- unsafe {
+                GspIrq::new(
+                    pdev,
+                    vectors_ref,
+                    bar,
+                    &*core::ptr::from_ref(&gsp_resources.gsp.cmdq),
+                    gsp_resources.spec.chipset,
+                )
+            },
+
+            // Drain the messages the GSP posted during boot, before relying on the interrupt.
+            _: {
+                gsp_resources.gsp.cmdq.drain()?;
+            },
+
             gsp_static_info: {
                 // Obtain and display basic GPU information.
                 let info = gsp_resources.gsp.get_static_info(bar)?;
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 13f361406a6c..47dfea78175d 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -152,7 +152,7 @@ pub(crate) struct Gsp {
     /// Log buffers, optionally exposed via debugfs.
     #[pin]
     logs: debugfs::Scope<LogBuffers>,
-    /// Command queue.
+    /// Command queue, borrowed by the GSP event interrupt handler.
     #[pin]
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index a0f995faaee5..ec254d6fe2c0 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -655,6 +655,18 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
             }
         }
     }
+
+    /// Drains every message currently pending in the GSP-to-CPU queue.
+    ///
+    /// Logs each message the GSP has already posted according to its function code, and returns
+    /// without waiting for more.
+    ///
+    /// # Errors
+    ///
+    /// Propagates a receive error, in particular the `EIO` of a queue poisoned by corrupt framing.
+    pub(crate) fn drain(&self) -> Result {
+        self.inner.lock().drain()
+    }
 }
 
 /// Inner mutex protected state of [`Cmdq`].
@@ -970,4 +982,33 @@ fn classify_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
             }
         }
     }
+
+    /// Drains all messages currently pending in the GSP-to-CPU queue.
+    ///
+    /// Reads whatever the GSP has already posted and stops once the queue is empty. There is no
+    /// awaited reply during a drain, so every message goes to [`Self::classify_event`].
+    ///
+    /// # Errors
+    ///
+    /// Returns the receive error that stopped the drain, in particular the `EIO` of a queue
+    /// poisoned by corrupt framing (see [`Self::wait_for_msg`]).
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
+            self.classify_event(function, seq);
+        }
+
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index f44897692b74..50d8abb735c1 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -10,6 +10,7 @@
 
 #[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
 pub(crate) mod doorbell_test;
+pub(crate) mod gsp;
 mod hal;
 mod interrupt_tree;
 mod regs;
@@ -24,20 +25,18 @@
     prelude::*, //
 };
 
-use crate::num;
+use crate::{
+    driver::Bar0,
+    gpu::Chipset,
+    num, //
+};
 
 use interrupt_tree::{
-    GinVector,
     Subtree,
-    SubtreeSet, //
+    SubtreeSet,
+    Tree, //
 };
 
-/// The subtree nova-core allocates PCI vectors for.
-///
-/// Every source nova-core services latches in this one subtree, so a single allocation covers all
-/// of them.
-pub(crate) const SERVICED_SUBTREE: Subtree = GinVector::new::<129>().subtree();
-
 /// The message-signaled interrupt type a vector allocation obtained.
 ///
 /// nova-core allocates MSI-X or MSI and nothing else, so the level-triggered INTx that
@@ -70,6 +69,40 @@ pub(crate) fn msi_type(&self) -> MsiType {
         self.msi_type
     }
 
+    /// Returns the interrupt tree these vectors deliver, as `chipset` implements it.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if this architecture does not implement a subtree these vectors service.
+    fn tree<'b>(&self, bar: Bar0<'b>, chipset: Chipset) -> Result<Tree<'b>> {
+        Tree::new(bar, chipset, self.msi_type, self.serviced)
+    }
+
+    /// Resets the interrupt tree these vectors deliver.
+    ///
+    /// Disables every vector in every implemented leaf, clears every pending bit, and rearms PCI
+    /// interrupt delivery. On return no vector is enabled, so the tree delivers nothing.
+    ///
+    /// The rearm covers pre-Hopper MSI, where an interrupt delivered before probe leaves delivery
+    /// un-armed with no handler to have rearmed it.
+    ///
+    /// Call this only during probe. It must not run concurrently with an interrupt handler.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if this architecture does not implement a subtree these vectors service.
+    pub(crate) fn reset_tree(&self, bar: Bar0<'_>, chipset: Chipset) -> Result {
+        let tree = self.tree(bar, chipset)?;
+
+        tree.disable_all_leaves();
+        tree.drain();
+        for subtree in self.serviced.iter() {
+            tree.rearm_pci_irq(subtree);
+        }
+
+        Ok(())
+    }
+
     /// Returns an [`irq::IrqRequest`] for the vector that delivers `subtree`.
     ///
     /// MSI-X gives subtree `N` its own table entry `N`. MSI raises its one message from every
diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq/gsp.rs
new file mode 100644
index 000000000000..174488565f79
--- /dev/null
+++ b/drivers/gpu/nova-core/irq/gsp.rs
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! GSP event (SWGEN0) interrupt handling.
+//!
+//! The GSP firmware raises SWGEN0 when it has posted messages in the GSP-to-CPU queue. That
+//! signal reaches the CPU as a PCI interrupt through the GIN tree. This module provides the
+//! threaded IRQ handler for it. The top half services the GIN leaf and the falcon's latched
+//! causes, and the IRQ thread drains the message queue.
+//!
+//! See `Documentation/gpu/nova/core/interrupts.rst`.
+
+use kernel::{
+    device,
+    irq,
+    pci,
+    prelude::*, //
+};
+
+use super::{
+    interrupt_tree::{
+        GinVector,
+        LeafEnableGuard,
+        Subtree,
+        TopEnableGuard,
+        Tree, //
+    },
+    SubtreeVectors, //
+};
+use crate::{
+    driver::Bar0,
+    falcon::gsp::Gsp as GspFalcon,
+    gpu::Chipset,
+    gsp::cmdq::Cmdq, //
+};
+
+/// Fixed GSP notification vector.
+///
+/// GSP-RM pins the GSP SWGEN0 notification to this vector on every supported chip, so nova-core
+/// uses the constant directly instead of discovering it at runtime. The leaf and bit serviced by
+/// the handler are derived from it.
+const GSP_INTR_0_VECTOR: GinVector = GinVector::new::<155>();
+
+/// Subtree carrying the GSP notification vector, and the only subtree nova-core services.
+///
+/// Probe allocates PCI vectors for this subtree, and the GSP handler names it as the subtree it
+/// serves, both when it takes its vector and when it rearms.
+pub(crate) const GSP_SUBTREE: Subtree = GSP_INTR_0_VECTOR.subtree();
+
+/// Clears the interrupt state that GSP boot left behind.
+///
+/// Resets the tree `vectors` covers, then clears the falcon's SWGEN0 latch. On return no vector
+/// is enabled, so the tree delivers nothing.
+///
+/// # Errors
+///
+/// `EINVAL` if this architecture does not implement a subtree `vectors` services.
+pub(crate) fn quiesce(bar: Bar0<'_>, chipset: Chipset, vectors: &SubtreeVectors<'_>) -> Result {
+    vectors.reset_tree(bar, chipset)?;
+    // GSP boot consumes its notifications by polling the queue, which leaves SWGEN0 latched, and
+    // the GSP drives no new signal while it is set. The clear comes after the tree reset, which
+    // erases every leaf bit and would erase the one a message posted since the clear had set.
+    GspFalcon::clear_swgen0_intr(bar);
+
+    Ok(())
+}
+
+/// Threaded IRQ handler for the GSP SWGEN0 event.
+///
+/// The top half clears the GIN leaf and takes the falcon causes pending for the host. The IRQ
+/// thread drains the GSP-to-CPU message queue, which takes the command-queue lock.
+pub(crate) struct GspInterrupt<'a> {
+    /// Borrowed BAR0, for falcon register access from interrupt context.
+    bar: Bar0<'a>,
+    /// The GSP command queue, drained by the IRQ thread.
+    cmdq: &'a Cmdq,
+    /// The GIN interrupt tree for this chipset.
+    tree: Tree<'a>,
+    /// Chipset, for the falcon retrigger and the routing registers, which both differ by
+    /// architecture.
+    chipset: Chipset,
+    /// Device, for logging from interrupt context without taking the command-queue lock.
+    dev: &'a device::Device,
+}
+
+impl<'a> GspInterrupt<'a> {
+    /// Creates the handler for `chipset`, borrowing `bar` and `cmdq` from the rest of the driver.
+    fn new(
+        bar: Bar0<'a>,
+        cmdq: &'a Cmdq,
+        tree: Tree<'a>,
+        chipset: Chipset,
+        dev: &'a device::Device,
+    ) -> Self {
+        Self {
+            bar,
+            cmdq,
+            tree,
+            chipset,
+            dev,
+        }
+    }
+}
+
+impl irq::ThreadedHandler for GspInterrupt<'_> {
+    /// Top half: clears the GIN leaf, takes every falcon cause pending for the host, and rearms
+    /// PCI interrupt delivery.
+    fn handle(&self) -> irq::ThreadedIrqReturn {
+        let bar = self.bar;
+
+        // Only service our own vector: require the GSP bit in the leaf and clear just that bit, so
+        // a co-pending vector in the same leaf stays pending for whoever services it. The subtree
+        // stays enabled, so there is no whole-tree disable and enable.
+        let leaf = self.tree.read_pending(GSP_INTR_0_VECTOR.leaf_index());
+        if !leaf.vectors().contains(GSP_INTR_0_VECTOR.leaf_mask()) {
+            // Nothing to service, but nova-core is the only consumer of this PCI interrupt, so
+            // skipping the rearm here would silence every later interrupt as well.
+            self.tree.rearm_pci_irq(GSP_SUBTREE);
+            return irq::ThreadedIrqReturn::None;
+        }
+        leaf.clear_vectors(GSP_INTR_0_VECTOR.leaf_mask());
+
+        let status = GspFalcon::take_host_intr(bar, self.chipset);
+
+        // A cause left latched holds the falcon's host-routed set non-empty, and the falcon
+        // signals the tree only on a transition of that set, so no later SWGEN0 would signal.
+        let unserviceable = status.with_swgen0(false);
+        if unserviceable.into_raw() != 0 {
+            // nova-core has no recovery path for a cause other than a posted message, for example
+            // a HALT from a GSP crash, so report it rather than discarding it.
+            dev_err!(
+                &self.dev,
+                "unserviceable GSP falcon interrupt, IRQSTAT {:#x}\n",
+                status.into_raw()
+            );
+            GspFalcon::clear_intr(bar, unserviceable);
+        }
+
+        // The leaf clear above consumed the tree's record of this interrupt, and the falcon signals
+        // the tree only on a transition of its host-routed causes, so a cause that arrived while
+        // this handler ran would never reach the CPU. Re-emit to supply that transition.
+        GspFalcon::retrigger_intr(bar, self.chipset);
+
+        // Delivery resumes only after this, so it must happen on every path that services the
+        // vector, including the fault path above.
+        self.tree.rearm_pci_irq(GSP_SUBTREE);
+
+        // SWGEN0 is the message-queue notification, so wake the IRQ thread to drain it.
+        if status.swgen0() {
+            irq::ThreadedIrqReturn::WakeThread
+        } else {
+            irq::ThreadedIrqReturn::Handled
+        }
+    }
+
+    /// IRQ thread: drains the GSP-to-CPU message queue.
+    fn handle_threaded(&self) -> irq::IrqReturn {
+        if let Err(e) = self.cmdq.drain() {
+            // A queue that fails to drain cannot advance past the message that failed, so every
+            // later notification would repeat this failure. Disable the source instead.
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
+/// The registered GSP event interrupt.
+///
+/// The fields tear down in declaration order, which is the order this needs: disabling the leaf
+/// stops new deliveries, `free_irq` then waits for a handler still in flight, and only then is
+/// the subtree disabled at `TOP`, so a late handler cannot rearm it.
+#[pin_data]
+pub(crate) struct GspIrq<'a> {
+    _leaf_guard: LeafEnableGuard<'a>,
+    #[pin]
+    reg: irq::ThreadedRegistration<'a, GspInterrupt<'a>>,
+    _top_guard: TopEnableGuard<'a>,
+}
+
+impl<'a> GspIrq<'a> {
+    /// Registers the GSP SWGEN0 threaded handler for the GSP subtree in `vectors`, then enables
+    /// the subtree and the GSP notification vector.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if this architecture does not implement the subtree carrying the GSP
+    /// notification, or if `vectors` does not service it.
+    ///
+    /// # Safety
+    ///
+    /// The caller must not leak the returned value: its [`Drop`] runs `free_irq`.
+    pub(crate) unsafe fn new(
+        pdev: &'a pci::Device<device::Bound>,
+        vectors: &'a SubtreeVectors<'a>,
+        bar: Bar0<'a>,
+        cmdq: &'a Cmdq,
+        chipset: Chipset,
+    ) -> impl PinInit<Self, Error> + 'a {
+        let dev = pdev.as_ref();
+
+        // The fields below are initialized in the opposite order to the one they are declared in,
+        // so that the handler is registered before anything it serves is enabled.
+        try_pin_init!(Self {
+            // SAFETY: the caller guarantees the returned `GspIrq` is not leaked, so this
+            // registration's `Drop` (`free_irq`) always runs.
+            reg <- unsafe {
+                irq::ThreadedRegistration::new(
+                    vectors.request_for(GSP_SUBTREE)?,
+                    irq::Flags::TRIGGER_NONE,
+                    c"nova-core",
+                    Ok(GspInterrupt::new(
+                        bar,
+                        cmdq,
+                        vectors.tree(bar, chipset)?,
+                        chipset,
+                        dev,
+                    )),
+                )
+            },
+            // Under pre-Hopper MSI the rearm is a configuration-space write, so nothing else
+            // restores the `TOP` enables that the tree reset cleared.
+            _top_guard: reg.handler().tree.enable_top_guarded(),
+            // A message posted during `quiesce` latches this leaf bit while the vector is still
+            // disabled, so enabling it raises that interrupt rather than losing the message.
+            _leaf_guard: reg.handler().tree.enable_leaf_guarded(
+                GSP_INTR_0_VECTOR.leaf_index(),
+                GSP_INTR_0_VECTOR.leaf_mask(),
+            ),
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index f27f0137dffe..62c0bbda61b2 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -178,6 +178,14 @@ pub(super) const fn intersection(self, other: Self) -> Self {
     pub(super) const fn span(self) -> u32 {
         u32::BITS - self.0.leading_zeros()
     }
+
+    /// Returns the subtrees of this set, lowest index first.
+    pub(super) fn iter(self) -> impl Iterator<Item = Subtree> {
+        // INVARIANT: a shift of `1` leaves exactly one bit set.
+        (0..u32::BITS)
+            .map(|index| Subtree(1 << index))
+            .filter(move |subtree| self.contains(*subtree))
+    }
 }
 
 impl From<Subtree> for SubtreeSet {
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 65ce547bd44e..68b5abfe494d 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,7 +17,6 @@
 mod fsp;
 mod gpu;
 mod gsp;
-#[cfg_attr(not(CONFIG_NOVA_CORE_IRQ_SELFTEST), expect(dead_code))]
 mod irq;
 mod mctp;
 #[macro_use]
-- 
2.55.0

