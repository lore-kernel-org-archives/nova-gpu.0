Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D434F382295
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158703; cv=fail; b=STONejEhuw+7NgjBPBYwDqNsgPRE42cmY3SX3e+P9zeVX2yROo6ABLLY6T7J6asRls+rIe3xkEifxjilA83GJlR2A8DdVCi8FybPD3pgRIgHN9CHg5UhnfpUE8qn3ABxLdcBjP5mITyhVT59+86OyVx3g0IIIeh8BSHDb3zBZ+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158703; c=relaxed/simple;
	bh=8KCF724iRLYCWGSoe2Ym3arkjE/Gr3YnmPjaObwKHd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LJMlG4I2ArekEwl6BLpZANxab5gtEsewhL5VTkR9yVpvNo8HJlbefd588BSrO6dSuf6F7tJjNgmaX1IElQIYG7R7QDB0pxEBHlABga+SFBjAr20shXF78tVieO8pgbNwgJURePeOsyOawTa39b2gjdQ2TQJeZz+hciNetkRc1aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J3D0sL14; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J3D0sL14"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4VRYHU8xPMDfaG6BYIgEhDD9XxNcMKNL2nq3tsi3Xil+3m01019lwAFtkIKYka/oKv2a+CAOtNwdA3lgxsmu/3aBA0SFbLcFR+99FzQ8Ga5NxS4EMgbdeXeg+smSrh2As9mBXMMajnwUQM+2IiWF4EU7KvsTh0tfz7YbhlstJoW3qoHQpbZtU350UV+pMSCG3UT96z+aGjSAmBoAtYw0cLeuFnZ64o+4iZ+AM3k2VliTRuufrFYqQ1CphTLtFj85FB4nrBNzTbffTgpNICmad6Nw6wiuK3kwOwggUXyc37tkGtiCbKdho97sgVu0spSWkUTFRkrSM6pLDx00a7P0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEwJM9Ej0oH8QMzktQxFkZB128Wrrk3AsPVSGFUtTak=;
 b=TrpK63eY53+9AiWPNpPzh4zhsbfsKyKPdfEmg/yX/UE5TQAcgPpHfZl6ic7PEU7FGf4xvpnti0Bil6Xz2CdnTXtjLKGVWQ8Foo2JighFZ7CsFNRjGVLyrtoi089RG5PdvtVChvxUsbe/DTNIGhuEfHrtKK6FKHnQAB4KOCRHdODxDkEiQsU8QnVce7uJFpGUsp9tOb/zVIYvwtxxlkOeZERFFrohofssjB8RnlESktDMVG10W9dqBEb/TgNorTHEyEaOPXU8PAgac9ck8M9xqS0Te2mROWnQOKR7pberEXBK6LWei2OC89ClRNEhc4eBeNhthjkkYX8SIfZ/74xscw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEwJM9Ej0oH8QMzktQxFkZB128Wrrk3AsPVSGFUtTak=;
 b=J3D0sL14O91Bec6pRuTnhQFoKDI5iQaM9fOSrhZPTi7QPmEjqSch8UOT8LixkjEwFWQCGkxa85JJXUxVdbyqfN2yXG2RY5PeWY2BmJNp8ityXnhw9Lb5QV2fmPzWaW7Pe7gdTQTpCQarD1rqDGsZ4fdDeS6PFrqYEfPPqVpIRCRrgw3KtWr8BMKYuCmIeIRkRzcSDpLUts5PCDdeZXnBsDDoLcECXdRj9x8PG19P8b7kqilgpFsItiJOJIy3uO01yyKw+5iM6CdXFM55Crq185pqDLewtVSDhN0Aujl1UYbewcT9lbUzVmlz0iVIn6bw4bdLl36UDYeF3it4AMo7BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:31 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
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
	John Hubbard <jhubbard@nvidia.com>,
	Will Pierce <wpierce@nvidia.com>
Subject: [PATCH 08/17] gpu: nova-core: allocate interrupt vectors for the serviced subtrees
Date: Fri,  7 Aug 2026 20:11:10 -0700
Message-ID: <20260808031120.363869-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: ea37f320-0ea8-495b-d6ea-08def4fabef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	N45K2Z6t+lSVQYBdGxycDinDBakjpcTe7sAhElIeOlNL2hm9BKLIvV97gNn6T3WPq0K1HMtb5QJDSX7YqFdIWuZ6gQoG68FoCfEf+TDTBJjAKJU5yvZmYJdEPipzjOnqAbe4WxxRVIcsa1ZOGePe2i3L7kB/3x7sSMn1q4UV1DaUj8LbbzF164HzvqltBgzhdzYCZ6fblHBB+W7G0qOTGUT2nktZcNsYMJXfF/WqWWPpRrOi9n7aHz+GmMSDyCvzDiloBPflmAOr2vwlLDejbJXvtKMdmbLXvN8NtFnzNjm/WmFTGYZ3A+J6dIO0WAziTHRptUTC34Z1I0kqPGdjCT6ZEMki3350ETD/9jXiyxhVsYMMe0+kwYhC3d+t+nkKs8vXyXOx597NJaaUuSWDd9kdVZfYXMU23+CG8MOis4z1riDNDoS92dH6TkVB7KX22bK6gqH4fZ2k40Ep5yzDs7wgU/Z/M5amyTTOdfJvwM9c35Ks1SaLMUGkV7qQfNXnm8IaLZ+fsvFFqN6UjSKym5MPkBFrlw2LsL9hNob38YpW1iVvxA/dCQ/fOeyZRg2c/EzgnEWjeS+UtHiCXy+M8U91B4E4yk8fTop60cvbBQ9K0OcPxfw1AHGWeM9duC9VVFGftufxXcppj1OnIXVzwb/6lrDrX6vd06mCS9JwVck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kxxW1c7GIg1RFC6EkYvgHXXyGra2ZBtntX31zKAxjEWqc9ZzCtQFcS+sb+Bv?=
 =?us-ascii?Q?Mn4kLNa38OhXdd8EVn75LS1vg2VIOMGhkl29GxzN+Ue9mJyTfdHI8rlHqRCO?=
 =?us-ascii?Q?H4ynXEFFlReX3ZVPHe1H8nvWNYlBOtIXauVhlDvzZ78trhR1Lmp5SjVe+sPI?=
 =?us-ascii?Q?Gwgah/jtfD7fhFMQx2W0Q/FqPsP11qrmH2u1pPVSZddJbHkYXv+9DMRPtaZ8?=
 =?us-ascii?Q?IOwYvVQkTE8JtapMcZUSrtVW3N376M7xSBWJnjMOHrxTBkxG0Ib+5826k9d3?=
 =?us-ascii?Q?f9r59+4y+kheLmA+QyV5huffR6ElYbzRqoASvM02BTLkNkt79bX5JDy0LHI+?=
 =?us-ascii?Q?yErxGYcHNbq2iH1fsuDWeIg3+xvcidqBrGSZ9pqAdgnMCRug+B5dSecN7fCT?=
 =?us-ascii?Q?8vDD6w8qG82Ult9LjtNu8icy3oEHmg7GeTnEb0LMDLoWF6dXOdYqfvd7QeV0?=
 =?us-ascii?Q?d9pMTp1XXVqCF0dCFMhjllEa8f7kFCzJqgrqoltciiZhJU4NCS/oLLssCVAQ?=
 =?us-ascii?Q?GOXlxJ3dyaRbyPFqzMV0sUS6fB6aP9km8jMbVDTiVloGu+YGzKV1DsVYxX7k?=
 =?us-ascii?Q?RynZrYNEK+qEqYIAAK0CS5QHtdi7t+HAxZWX3eAueYpZOe84DfQ7VCkl+EJL?=
 =?us-ascii?Q?si7S9YMMjuegf2Y13yq6qRyf7r8XZRXoc+4tqUK63MFHCZxxkzYgaPEu2bdF?=
 =?us-ascii?Q?iO8lFCGFQ5LJNkOZthXt+LX9uGN7rAXE3fU/eLTUtp54dqNrMW/Hc9WZrMv5?=
 =?us-ascii?Q?RPIJnANM/N2UQf/GnVc8SV6RAupO5uJwD7VJnuqIhlK6eN4Flay1bXtugGCe?=
 =?us-ascii?Q?Am5XM15yJXnxhMDKAYViZthfefiQnO5fsDObnumitvYQKJkgsOHg8v2Dmb/s?=
 =?us-ascii?Q?k5fQy4YxTcCFPMaBAeXaztZV1lvHxXkLWk6w2CYa2++++yhXkXb75jh/9RwS?=
 =?us-ascii?Q?iRgqXELI0oz8TKdVZZiMXwTTlSoaBsi/bKQp7xCEwwisg58VXg1NOd6BgJiL?=
 =?us-ascii?Q?rokFBSt3C6VDQB2XvKaB28PApzRj14YNF4TFhgj1VdVaVQLbKy8FQRMNmAjT?=
 =?us-ascii?Q?3yeTJKSa2JR9qnpCFSMq9PNxSzz/8pzsq6ExNhdKUsF/vZTle3SKOiTeUupK?=
 =?us-ascii?Q?dyQ+1m6pcMfmJRpuZv1HurqxuPC0nc3uiQ8erZ5xfrlBrWhCZex3JAkfeT1w?=
 =?us-ascii?Q?+5AfEbCrkqFJVpeVx5AlV749dPfW09AXGeB0MEC7RK23niybbrvwi9u0rJ8K?=
 =?us-ascii?Q?ZfcYkM30RUbhdFyvIP0c/V41iHm50YSuKRy+rp6CdWeDDxJe4qhUZCaSnlcl?=
 =?us-ascii?Q?BI7Gd4+IoDGZYkB6Jb/mo2TfqpGaMgTR6g8pUZ8kqYFoQKUYp8gh85gu9Kpb?=
 =?us-ascii?Q?D5r6JEiVFYNr/TRHxUSKtIEL6Ij9z1PDt0GISiSEtMbjy1dd0X1BuqviZ8SR?=
 =?us-ascii?Q?PAgHqGbjkTq9984L/WNnt0nOh/gibXAp+4h1hrPWpTtBgzgh5xJb0dU5A0lH?=
 =?us-ascii?Q?145sgffpGQ27HBn0G6bJQfQ6vfp1xt0uV+Pk7StJ1tlqliP7c9mY1XTmdzic?=
 =?us-ascii?Q?euZEtzDXTGS4fbw8sbJlG1D8EqSy6j+5ilqSiVqeGt+h/59kbIaHqo8ZGjiT?=
 =?us-ascii?Q?EMmM04qj3NuGelDVlIYxFk88oucF4IzN5gzuouz5ECJ9g1vXCDLjN8uvbH//?=
 =?us-ascii?Q?6tkTeo03+Br0cs0PXWmcLmAk8vr5xbAIJTUaJG/1H7el8edd0ZV9TYJNkWvE?=
 =?us-ascii?Q?cL4jwiH68A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea37f320-0ea8-495b-d6ea-08def4fabef6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:31.8097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIcyze+djaMUyu26mHUlkyclZBAoLSUc3PAH7VhoiE7wilaE1D8/RQDXuwfanKKk0Tm7ka1Mc2XY8BxBAJzBDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

Every subtree nova-core enables at TOP needs an allocated PCI vector
with a handler on it. How many vectors that takes depends on the type
the PCI core grants. MSI has one message that every subtree raises,
so one vector serves the whole tree. MSI-X gives each subtree its own
table entry, and Linux masks every entry a driver does not allocate. A
serviced subtree with no entry of its own loses the interrupts it
raises, while its GIN leaf and TOP bits read pending and enabled.

nova-core allocated one vector at probe, and the tree enabled every
implemented subtree.

Size the allocation to the serviced set: MSI-X entries up to the highest
serviced subtree, falling back to a single MSI. Drop the INTx fallback,
since nova-core does not share a level-triggered line. Enable only
the serviced subtrees at TOP, and take the leaf count and the rearm
method from the interrupt HAL when the tree is built.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Will Pierce <wpierce@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs                |  6 --
 drivers/gpu/nova-core/irq.rs                | 78 ++++++++++++++++++---
 drivers/gpu/nova-core/irq/hal.rs            |  2 -
 drivers/gpu/nova-core/irq/interrupt_tree.rs | 68 +++++++++++-------
 4 files changed, 111 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5efeba056f1b..42a4cd7971fa 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -29,7 +29,6 @@
         Gsp,
         GspBootContext, //
     },
-    irq,
     regs,
     vgpu::VgpuManager, //
 };
@@ -387,11 +386,6 @@ pub(crate) fn new(
                 })?,
             }),
 
-            // Allocate a PCI interrupt vector.
-            _: {
-                let _irq_vector = irq::alloc_vector(pdev)?;
-            },
-
             gsp_static_info: {
                 // Obtain and display basic GPU information.
                 let info = gsp_resources.gsp.get_static_info(bar)?;
diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
index ef77066e0514..2f0e2644b9bd 100644
--- a/drivers/gpu/nova-core/irq.rs
+++ b/drivers/gpu/nova-core/irq.rs
@@ -21,16 +21,76 @@
     prelude::*,
 };
 
-pub(crate) fn alloc_vector(pdev: &pci::Device<Bound>) -> Result<pci::IrqVector<'_>> {
-    let msi_types = IrqTypes::default().with(IrqType::Msi).with(IrqType::MsiX);
-
-    let irq_vectors = match pdev.alloc_irq_vectors(1, 1, msi_types) {
-        Ok(vecs) => vecs,
-        Err(_) => {
-            dev_warn!(pdev.as_ref(), "MSI not available, falling back to INTx\n");
-            pdev.alloc_irq_vectors(1, 1, IrqTypes::default().with(IrqType::Intx))?
+/// The PCI interrupt vector that delivers each serviced subtree.
+///
+/// MSI-X raises a separate table entry per subtree, so subtree `N` arrives on entry `N`. MSI has a
+/// single message that every subtree raises, so all of them arrive on the one allocated entry.
+#[derive(Clone, Copy)]
+pub(crate) struct SubtreeVectors<'a> {
+    vectors: pci::IrqAllocation<'a>,
+    /// `TOP` bit of every subtree nova-core services.
+    serviced: u32,
+}
+
+impl<'a> SubtreeVectors<'a> {
+    /// Returns the interrupt type the PCI core selected for these vectors.
+    pub(crate) fn irq_type(&self) -> IrqType {
+        self.vectors.irq_type()
+    }
+
+    /// Returns the vector that delivers `subtree`, a single `TOP` bit of the form
+    /// `interrupt_tree::vector_subtree_mask` returns.
+    ///
+    /// # Errors
+    ///
+    /// `EINVAL` if `subtree` names anything other than a single subtree nova-core services.
+    pub(crate) fn vector_for(&self, subtree: u32) -> Result<pci::IrqVector<'a>> {
+        if subtree.count_ones() != 1 || subtree & self.serviced == 0 {
+            return Err(EINVAL);
         }
+
+        self.vectors.vector(entry_index(self.irq_type(), subtree))
+    }
+}
+
+/// Returns the index of the allocated entry that `subtree` raises.
+///
+/// MSI-X gives subtree `N` its own table entry `N`. MSI raises its one message from every subtree,
+/// and nova-core allocates a single entry for it. nova-core never allocates INTx.
+fn entry_index(irq_type: IrqType, subtree: u32) -> u32 {
+    match irq_type {
+        IrqType::MsiX => subtree.trailing_zeros(),
+        IrqType::Msi | IrqType::Intx => 0,
+    }
+}
+
+/// Allocates the interrupt vectors that the subtrees in `serviced` require.
+///
+/// Every subtree nova-core enables at `TOP` must have an allocated vector with a registered
+/// handler, or the interrupts it raises are lost. Linux masks every MSI-X entry a driver did not
+/// allocate, so the MSI-X request covers every entry up to the highest serviced subtree. A part
+/// whose MSI-X table is smaller than that falls back to a single MSI, which serves the whole tree.
+/// nova-core does not fall back to a shared INTx line.
+///
+/// # Errors
+///
+/// `EINVAL` if `serviced` is empty. The error from the MSI request if neither type can be
+/// allocated.
+pub(crate) fn alloc_vectors(
+    pdev: &pci::Device<Bound>,
+    serviced: u32,
+) -> Result<SubtreeVectors<'_>> {
+    // One entry per subtree up to and including the highest serviced one.
+    let msix_count = u32::BITS - serviced.leading_zeros();
+    if msix_count == 0 {
+        return Err(EINVAL);
+    }
+
+    let msix = IrqTypes::default().with(IrqType::MsiX);
+    let vectors = match pdev.alloc_irq_vectors(msix_count, msix_count, msix) {
+        Ok(vectors) => vectors,
+        Err(_) => pdev.alloc_irq_vectors(1, 1, IrqTypes::default().with(IrqType::Msi))?,
     };
 
-    irq_vectors.vector(0)
+    Ok(SubtreeVectors { vectors, serviced })
 }
diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq/hal.rs
index 8de2f6e536c2..cf2d1aa080fa 100644
--- a/drivers/gpu/nova-core/irq/hal.rs
+++ b/drivers/gpu/nova-core/irq/hal.rs
@@ -50,7 +50,6 @@ impl PciIrqRearmMethod {
     /// `serviced` holds the `TOP` bit of every subtree the driver services, and `subtree` holds
     /// the bit of the one subtree the calling handler serves. Each method uses whichever of the
     /// two its interrupt type delivers on, so both are required.
-    #[expect(dead_code)]
     pub(super) fn rearm(self, bar: Bar0<'_>, serviced: u32, subtree: u32) {
         let subtrees = match self {
             // The written value is ignored, so any write rearms delivery.
@@ -98,7 +97,6 @@ fn implemented_subtrees(&self) -> u32 {
     ///
     /// `None` means that `irq_type` needs no rearm write. That is the case for `INTx`, which is
     /// level-triggered, and which nova-core does not allocate.
-    #[expect(dead_code)]
     fn pci_irq_rearm_method(&self, irq_type: IrqType) -> Option<PciIrqRearmMethod>;
 }
 
diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/nova-core/irq/interrupt_tree.rs
index 9f6cfed89bec..51add9f33c89 100644
--- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
+++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
@@ -16,14 +16,16 @@
         Io, //
     },
     num::Bounded,
+    pci::IrqType,
     prelude::*,
 };
 
 use crate::{
     driver::Bar0,
-    gpu::{
-        Architecture,
-        Chipset, //
+    gpu::Chipset,
+    irq::hal::{
+        cpu_interrupt_hal,
+        PciIrqRearmMethod, //
     },
     regs::{
         NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF as CPU_INTR_LEAF,
@@ -82,31 +84,43 @@ impl Sealed for super::Pending {}
 pub(super) struct Tree {
     /// Number of implemented leaves in this tree, either 8 or 16.
     num_leaves: usize,
-    /// Mask of subtree bits the architecture implements.
-    subtree_mask: u32,
+    /// The subtrees this tree enables and services.
+    serviced_subtrees: u32,
+    /// Method that rearms PCI interrupt delivery, or `None` if the interrupt type needs no rearm
+    /// write.
+    rearm_method: Option<PciIrqRearmMethod>,
 }
 
 impl Tree {
-    /// Creates a `Tree` sized for `chipset`.
-    pub(super) fn new(chipset: Chipset) -> Self {
-        let num_leaves = match chipset.arch() {
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada => 8,
-            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
-                16
-            }
-        };
-
+    /// Creates a `Tree` for `chipset` covering `serviced_subtrees`, with the rearm method that
+    /// `irq_type` requires.
+    ///
+    /// Each serviced subtree must have an allocated PCI vector and a registered handler, which
+    /// [`super::alloc_vectors`] sizes the allocation for. Bits outside the subtrees the
+    /// architecture implements are dropped.
+    pub(super) fn new(chipset: Chipset, irq_type: IrqType, serviced_subtrees: u32) -> Self {
+        let hal = cpu_interrupt_hal(chipset);
         Self {
-            num_leaves,
-            // Each subtree covers two leaves, so one bit per pair of leaves.
-            subtree_mask: (1u32 << (num_leaves / 2)) - 1,
+            num_leaves: hal.num_leaves(),
+            serviced_subtrees: serviced_subtrees & hal.implemented_subtrees(),
+            rearm_method: hal.pci_irq_rearm_method(irq_type),
+        }
+    }
+
+    /// Rearms PCI interrupt delivery to the CPU after servicing `subtree`, the `TOP` bit of the
+    /// one subtree the calling handler serves.
+    ///
+    /// A handler must call this before it returns, or it receives no further interrupts.
+    pub(super) fn rearm_pci_irq(&self, bar: Bar0<'_>, subtree: u32) {
+        if let Some(method) = self.rearm_method {
+            method.rearm(bar, self.serviced_subtrees, subtree);
         }
     }
 
     /// Returns a [`Top`] handle for this tree.
     pub(super) fn top(&self) -> Top {
         Top {
-            subtree_mask: self.subtree_mask,
+            serviced_subtrees: self.serviced_subtrees,
         }
     }
 
@@ -131,9 +145,9 @@ pub(super) fn trigger(&self, bar: Bar0<'_>, vector: u32) -> Result {
 
     /// Clears every pending bit in every implemented leaf.
     ///
-    /// The walk runs with every implemented subtree disabled at `TOP`, and every implemented
-    /// subtree is enabled on return, whatever its state on entry. The leaves cleared and the
-    /// `TOP_EN` writes both reach subtrees the driver does not service.
+    /// Disables this tree's serviced subtrees at `TOP` across the walk, then enables them,
+    /// whatever their state on entry. The leaves cleared reach subtrees the driver does not
+    /// service, and the `TOP_EN` writes do not.
     ///
     /// Call `drain()` only during probe. It must not run concurrently with an interrupt handler.
     pub(super) fn drain(&self, bar: Bar0<'_>) {
@@ -152,19 +166,21 @@ pub(super) fn drain(&self, bar: Bar0<'_>) {
 }
 
 /// Top-level view of the interrupt tree, enabling and disabling whole subtrees.
+///
+/// Both writes cover the serviced subtrees alone, leaving the rest of the tree as it was.
 pub(super) struct Top {
-    subtree_mask: u32,
+    serviced_subtrees: u32,
 }
 
 impl Top {
-    /// Enables interrupt delivery for every implemented subtree (`TOP_EN_SET`).
+    /// Enables this tree's serviced subtrees (`TOP_EN_SET`).
     pub(super) fn enable(self, bar: Bar0<'_>) {
-        bar.write(CPU_INTR_TOP_EN_SET, self.subtree_mask.into());
+        bar.write(CPU_INTR_TOP_EN_SET, self.serviced_subtrees.into());
     }
 
-    /// Disables interrupt delivery for every implemented subtree (`TOP_EN_CLEAR`).
+    /// Disables this tree's serviced subtrees (`TOP_EN_CLEAR`).
     pub(super) fn disable(self, bar: Bar0<'_>) {
-        bar.write(CPU_INTR_TOP_EN_CLEAR, self.subtree_mask.into());
+        bar.write(CPU_INTR_TOP_EN_CLEAR, self.serviced_subtrees.into());
     }
 }
 
-- 
2.55.0

