Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649893806BD
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693664; cv=fail; b=i6Eun73F4bb805rXaYuXQNqdo3Hc2pNqclGNqiSzb8blG2KGJPsNlcSu51YT5nv7kLSYyhm4x12AE8XbvlpL8cAr0QdGae6gx/GlerdCeE6XA++B7TcQFuC1tIXDHlipUc03RGInxBHQF8+75XU91keSddiSfXFAZGMES9hhQyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693664; c=relaxed/simple;
	bh=oXATDssxHKqwN3OyQ6nYmGFusgK/0ouOedcY3kA/rps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oF2ge1zZs6uDnP8H+IRQWAZaGGZIh8l+mU9nR/O/ZeOvdhXa3k08+jbk7oVLQ2UlGOGBjUZKbHFVi5mYcetTTUI+zOGouFxNF1AbekynGbxDWVNlz+mkwF7GsP97E8g3jVFa5HyCDmCz7/2/MVLn6scSLf4o8MQlcp0obcTmY6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rL8LApYQ; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rL8LApYQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRPNTv64VuDHyMz48c/Q5Q7J78yFamqMtB8iTGFyFDhJYfTCadbrC6VES8vUuMrwyQvjTW3cEshBCQ12/WW5D0kE/cOJdTehI5iHg7M1QKR1ebVAm+Hvv1D4zQcS9AKg8uwsZLeCviJwJqv8sXO8rIuGgJdcn5F7zqk6Q8ENAq4jYITdFgxb5o0/ME+0LbyH93S8jlFLtKB95AQ67+tmUyhqpBwMIiPMMxQ2LA3IqUE+3mXEFwn+Geqlu+VdiFKFz0sm03askR5tgQgyJkZnEoiab8/g6sNbLHxZsNlzhbk/iGQtd973Tga8JjbSmxT6+yj+eEkBV5iSk9x/XHsXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10Rll0e2TDjBMhWLV9SOfupiBWvojYVFZiPg5JqvP24=;
 b=sQoBqxP0zZZENr7kSQA0Izn7CLz1e0JhcqXHT5X2lhSpasD/Toe1ZCv1o4Z2lFlT2mJlClQsaJE7bmW/Es2URg+InIcZ83tysEhfq7zdhqhmN3kM0BFsJRZWMtlqb5QwMy+VTCho4wCR0mkgJXA58Qq9/S8s2Ew4Flm9/dyLlK1HQYHFHymeJq7XVYR+avlSZUNIxrL3mKcPbEN7N/PVVPVvuP6arb4LMT7eTSednpPDgZFj73E8vcAAVtd7PDWFKBX+opls8DXpz59M0GOHQA10EY/nWMaHDMUg+sLqY3DSkPiFBO9BrTrQWshe+2cYoLTRu5X0iyaHs8Tv9miFDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10Rll0e2TDjBMhWLV9SOfupiBWvojYVFZiPg5JqvP24=;
 b=rL8LApYQjOeQFolkBbx7uUMgyQmApe/tPNVUjyTfTp9f1Y67SF0DxAY1HL1H6URa65kbwp8fHEI9nzgpMssHtM9tVk7zjgv8e++tUZ11lR4vujF4nNcBEHHwiqIelD0SHHhI5y3Y7Fyn49rGlDbV9/kmSJY3XAuorkoeXMdwO+8Ka9uyOmks15IBQ6eUEqUUj7FP1vsN2uk3f9fTrn4JpcxUhluyrRgFYpUdRdta3Y3OZ3uS/7/EGbYLxLm0FX30XyZe1F3A71/RR/IRsx3t/va5q1W2kQwU0vHIddKkkBK3aSnhRYOUK78m8q4w/MkcLQDK9nW94Clc0F4t0BzEEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:28 +0000
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
Subject: [PATCH v3 03/33] gpu: nova-core: gsp: give the command queue its own BAR0 mapping
Date: Thu, 17 Sep 2026 18:06:49 -0700
Message-ID: <20260918010719.1176945-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 59926374-7888-43f5-bb0e-08df15213523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|5023799004|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kh2ZbnwkyQ/cJBS4AEMHeugQOVnH2J/7BkGQjL58VR7n23D9d3fggyCmo5V6iohCR3ZTAmIwcyKgaq7jAhg6mHGpI01FCj1fmIrCsMZtT+ZrJeRWVLOULOtlIfBEHjnI3bDMWeQegcg5oQBza+X+DaFHPQUTQJbAvIJpjXnwn5HAj3lfqpebKTMa79HhlQAKKkv7nCRN4sOrkXlqlk73moS8zJ+y3/etrGoe7J+UuQ/QvhfmJDepYVTwDwcfhhoxn3X9j6sY18dJbpNRfix+xbNis4LfsixFzD24O5oN+KAMS3keq14aOKvCB7+O1//7e3Z0VsFJySo4F1TYV12s/B/VCf4gUQYEjqQhxes/9PAXEnCxiOp10jI3jbwDQ/eExsTE56uFjg/zU5Ls2t26bI5bkdJJ3KrpbTupG4yXtv9uWBFgD7lyKufMYjqcq8ww0RdSVmJl9Es+zo3m4+BstKIbpoKp5LBDIBJ71LDDA85gEfU+RHWDDQsZo5KUQXX1YO4ZTr4RnGa9wM9//tUlHkB4tPf0LTa17cuq6nQRFRX3p/RBJ3cimNTaIIZiCidzdyfaUfV3+cybuIwG4eIAyH4pseZBlaDpOJS++D6wEnxXsw3qvf/mrGalDbcxQ28pZaViZHLY9AxIHcjnmFwoO5F+9q276qnS5UHbbox1CJg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(5023799004)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BwT89+VnV0IPC8rB/O0yH0RAVxZegAbmbB80NTOp/ma43whnC6dK518QQZG7?=
 =?us-ascii?Q?PwG+W1fwLaDEcXo76BYvnWZtKFsQICECNpR28OiUf4z/hkLQNbP7FvmUvmnq?=
 =?us-ascii?Q?uas4whXLdTGbM984BdsVvOKs53KoXqaftlPHD8tI9h2/x49UMwGaYUXUdFJJ?=
 =?us-ascii?Q?HSIShYfvt3Nvdt5mtd+ttEPd1hb5E/lkiOC73JL+yEzZxkLc001B1a+9tavW?=
 =?us-ascii?Q?GzZLe2N5qZVnfUkfeWqUP/kgbVtylplDn9bX+6vrcZ5nI1JcYaw2ZM/nyVCI?=
 =?us-ascii?Q?ji9yRFcm0U/QqCy/puR7R1EoeXAFXc23KatCHw7HsnqHhUSZD11qT8PRLdkH?=
 =?us-ascii?Q?84DAnVRNwyVtnUqWy2O1SccGvJBjTfVpjWq0gHMOkIFPd/9VSnS5fCuUrcjy?=
 =?us-ascii?Q?T2DUE3X5Oq3cipG7K3eJj1piF5Aue/EGr5i2nSujrfRhMkF/uR8tz5TecvtO?=
 =?us-ascii?Q?ZKT5OVZAWUVMAobcirYq6fTe4US1X+RbCUmilv3dbOUfkPEYw2RfJSg8IWCw?=
 =?us-ascii?Q?DJ4WFTcIR+zMPwqdLR1a/B/f10Q2ldLxoM4nSESO+mR6wkGIKLMy408E2wxx?=
 =?us-ascii?Q?NmgCax5ILe25RaSwuoQ2j67RAVGQzWY//vjJrp5NkiW2PZ5S+4BEhQJKf7P6?=
 =?us-ascii?Q?rnBgjTOJdUfC5Tdicws13JGxb/9wOZ+WO6f9CTrHO9L/5x8k888woek4C9Ts?=
 =?us-ascii?Q?E67XQH4dn6glUNcmW/4mFTJHqONS9jTqZ/bHqg87uF+QJRwjRguKRCKAhFR9?=
 =?us-ascii?Q?3/MGD3P7OpQHG+4FVTSQbFrZDiZEtpg6YRzk9//goO9uxv7CyeSwDnPkxTIJ?=
 =?us-ascii?Q?aRRIgkOcUZ2oHYaelw6mK7Iw4U79ItO1RdM6lUNDBtPce0hy16Z/l99TIcwG?=
 =?us-ascii?Q?BqZ8ReGtZsjVCbq6DRhFyShxJkFXkZT14XK/5wfASAQgGKnbo+ppG7o9BfjK?=
 =?us-ascii?Q?l80BHX46oLOHyRaMnbFupC2QzD3u6s6V1CjPKzXsMrg4A6ACoFyF/QxoF4hY?=
 =?us-ascii?Q?jGUnc0cMSZy0GuEgw3odG/Ci43ZsLoxm1HQCLp3eIzSe+ZF9lY369S/Em0Du?=
 =?us-ascii?Q?2+8ZmWS4ReyaW8Scy1qv9FnuQ/+FK36721FutIBJ7Uu4upZyiKqxYRNfuRtk?=
 =?us-ascii?Q?sZA/N7dsjeKd94CaEYP/4PwdnlFDvJWJXM78jLoykgjIU1Yur1INUPCwuMkF?=
 =?us-ascii?Q?uRF7IYYaax0A+WRicWOW4Y8TjANTlRUpjGQcFTWmmYUmygCLRgN6uarDCLYc?=
 =?us-ascii?Q?EyTuUgGg0nesT8G5bnm1GQScOPi979yssrATGyAI+vw7dHSBSLDzf4H+6arI?=
 =?us-ascii?Q?OMmxw8DFON9EO/iCs3Z8W34wgpJO264d5xQ1tyHBckOLuFI+Wl9s64yPKBND?=
 =?us-ascii?Q?so6bH1kA4yT6JvorRwfKRynBXaU0y9bCXxS6mvp1oSj8g0RGQOSkzb+jZWjN?=
 =?us-ascii?Q?1Zi5+qOVhdHiN9yViXHOa9NXSdOoW/XP/K1D2CL0S91+rZuyFuH0C1HPLVES?=
 =?us-ascii?Q?Jl5dR8bTAQaGA75Uk5tdqrPf78iEVb87y4SeMBqjGdgOBntJ2D3RXEakuzy7?=
 =?us-ascii?Q?I+bOsJj+c69TMqNf0dy5+dApWoc0Ozl208xHh3LwtsgBkQA3v4bcTgFl5g1s?=
 =?us-ascii?Q?KiJSUi0ay4RXrThcrjuUUR3O+47XtxweAPpjWWEi56vjFi0rZmnqZHkpsQ3A?=
 =?us-ascii?Q?GUkopekY301kOptcKwIcTJFYa9Qow4nrk3HSInH3VDk9qGhHzsMKAhh0lXyE?=
 =?us-ascii?Q?xAZF0DdCFA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59926374-7888-43f5-bb0e-08df15213523
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:28.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSHxGT1reMajC6QWkrKmNdVOlX9+2yzJyXNi5uUGVCumstTlntdDwHpTxzcAkjxMBZh31ANbRSMcRni2Vqw5pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

Sending a command to the GSP ends by writing the GSP doorbell, a BAR0
register, so every send path through the command queue needs the BAR0
mapping. A command too large for one queue element goes out as a first
element followed by continuation records, so the send path has four
functions.

Nova-core passed the mapping down from the caller as an argument, which
was threaded through all four functions, and every caller of a send had
to carry it as well.

Store the mapping in the command queue and drop the argument. The queue
lives exactly as long as the mapping does, since both belong to the
bound device.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs      |  4 ++--
 drivers/gpu/nova-core/gsp.rs      | 11 +++++++----
 drivers/gpu/nova-core/gsp/boot.rs | 10 +++-------
 drivers/gpu/nova-core/gsp/cmdq.rs | 24 ++++++++++++++----------
 4 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index d1e0da7b8682..9e0570e97cfe 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -414,7 +414,7 @@ pub(crate) fn new<'a>(
 
                 vgpu: VgpuManager::new(pdev, spec.chipset, fsp.as_mut()),
 
-                gsp <- Gsp::new(pdev),
+                gsp <- Gsp::new(pdev, bar),
 
                 // This member must be initialized last, so the `UnloadBundle` can never be dropped
                 // from outside of the constructed `GspResources`, ensuring that the unload sequence
@@ -456,7 +456,7 @@ pub(crate) fn new<'a>(
 
             gsp_static_info: {
                 // Obtain and display basic GPU information.
-                let info = gsp_resources.gsp.get_static_info(bar)?;
+                let info = gsp_resources.gsp.get_static_info()?;
                 match info.gpu_name() {
                     Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
                     Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index b85e0b6475f0..c9b7498639b7 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -162,7 +162,10 @@ pub(crate) struct Gsp<'gsp> {
 
 impl<'gsp> Gsp<'gsp> {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
-    pub(crate) fn new(pdev: &'gsp pci::Device<device::Bound>) -> impl PinInit<Self, Error> + 'gsp {
+    pub(crate) fn new(
+        pdev: &'gsp pci::Device<device::Bound>,
+        bar: Bar0<'gsp>,
+    ) -> impl PinInit<Self, Error> + 'gsp {
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
@@ -174,7 +177,7 @@ pub(crate) fn new(pdev: &'gsp pci::Device<device::Bound>) -> impl PinInit<Self,
             // _kgspInitLibosLoggingStructures (allocates memory for buffers)
             // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
             Ok(try_pin_init!(Self {
-                cmdq <- Cmdq::new(dev),
+                cmdq <- Cmdq::new(dev, bar),
                 rmargs: Coherent::init(dev, GFP_KERNEL, GspArgumentsPadded::new(&cmdq))?,
                 libos: {
                     let mut libos = CoherentBox::zeroed_slice(
@@ -218,8 +221,8 @@ pub(crate) fn new(pdev: &'gsp pci::Device<device::Bound>) -> impl PinInit<Self,
     }
 
     /// Query the GSP for the static GPU information.
-    pub(crate) fn get_static_info(&self, bar: Bar0<'_>) -> Result<commands::GetGspStaticInfoReply> {
-        self.cmdq.send_command(bar, commands::GetGspStaticInfo)
+    pub(crate) fn get_static_info(&self) -> Result<commands::GetGspStaticInfoReply> {
+        self.cmdq.send_command(commands::GetGspStaticInfo)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 60bed3dc2f5a..4fb1b69ac9d5 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -10,7 +10,6 @@
 };
 
 use crate::{
-    driver::Bar0,
     falcon::{
         gsp::Gsp,
         Falcon, //
@@ -36,7 +35,6 @@ pub(crate) fn boot(
         mut ctx: super::GspBootContext<'_, 'gsp>,
     ) -> Result<Option<super::UnloadBundle<'gsp>>> {
         let pdev = ctx.pdev;
-        let bar = ctx.bar;
         let chipset = ctx.chipset;
         let gsp_falcon = ctx.gsp_falcon;
         let dev = pdev.as_ref();
@@ -45,9 +43,9 @@ pub(crate) fn boot(
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset), GFP_KERNEL)?;
 
         self.cmdq
-            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+            .send_command_no_wait(commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq
-            .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vgpu.state())?)?;
+            .send_command_no_wait(commands::SetRegistry::new(ctx.vgpu.state())?)?;
 
         // Perform the chipset-specific boot sequence, and retrieve the unload bundle.
         let unload_bundle = hal.boot(&self, &mut ctx, &gsp_fw)?.or_else(|| {
@@ -89,12 +87,11 @@ pub(crate) fn boot(
     /// Shut down the GSP and wait until it is offline.
     fn shutdown_gsp(
         cmdq: &Cmdq<'_>,
-        bar: Bar0<'_>,
         gsp_falcon: &Falcon<'_, Gsp>,
         mode: commands::PowerStateLevel,
     ) -> Result {
         // Command to shut the GSP down.
-        cmdq.send_command(bar, commands::UnloadingGuestDriver::new(mode))?;
+        cmdq.send_command(commands::UnloadingGuestDriver::new(mode))?;
 
         // Wait until GSP signals it is suspended.
         const LIBOS_INTERRUPT_PROCESSOR_SUSPENDED: u32 = bits::bit_u32(31);
@@ -120,7 +117,6 @@ pub(crate) fn unload(
         // Shut down the GSP. Keep going even in case of error.
         let mut res = Self::shutdown_gsp(
             &self.cmdq,
-            ctx.bar,
             ctx.gsp_falcon,
             commands::PowerStateLevel::Level0,
         )
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f1231569aa33..9250d596a3e4 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -532,6 +532,7 @@ impl<'cmdq> Cmdq<'cmdq> {
     /// Creates a new command queue for `dev`.
     pub(crate) fn new(
         dev: &'cmdq device::Device<device::Bound>,
+        bar: Bar0<'cmdq>,
     ) -> impl PinInit<Self, Error> + 'cmdq {
         pin_init_scope(move || {
             let gsp_mem = DmaGspMem::new(dev)?;
@@ -540,6 +541,7 @@ pub(crate) fn new(
                 dma_addr: gsp_mem.0.dma_address(),
                 inner <- new_mutex!(CmdqInner {
                     dev,
+                    bar,
                     gsp_mem,
                     seq: 0,
                     poisoned: Cell::new(false),
@@ -582,7 +584,7 @@ fn notify_gsp(bar: Bar0<'_>) {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command and reply initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&self, bar: Bar0<'_>, command: M) -> Result<M::Reply>
+    pub(crate) fn send_command<M>(&self, command: M) -> Result<M::Reply>
     where
         M: CommandToGsp,
         M::Reply: MessageFromGsp,
@@ -590,7 +592,7 @@ pub(crate) fn send_command<M>(&self, bar: Bar0<'_>, command: M) -> Result<M::Rep
         Error: From<<M::Reply as MessageFromGsp>::InitError>,
     {
         let mut inner = self.inner.lock();
-        inner.send_command(bar, command)?;
+        inner.send_command(command)?;
 
         inner.await_msg()
     }
@@ -604,12 +606,12 @@ pub(crate) fn send_command<M>(&self, bar: Bar0<'_>, command: M) -> Result<M::Rep
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command_no_wait<M>(&self, bar: Bar0<'_>, command: M) -> Result
+    pub(crate) fn send_command_no_wait<M>(&self, command: M) -> Result
     where
         M: CommandToGsp<Reply = NoReply>,
         Error: From<M::InitError>,
     {
-        self.inner.lock().send_command(bar, command)
+        self.inner.lock().send_command(command)
     }
 
     /// Waits for an unsolicited GSP event of type `M`. Events that arrive before it are logged and
@@ -652,6 +654,8 @@ pub(crate) fn drain(&self) -> Result {
 struct CmdqInner<'a> {
     /// Device this command queue belongs to.
     dev: &'a device::Device,
+    /// MMIO mapping of PCI BAR0, for writing the GSP doorbell.
+    bar: Bar0<'a>,
     /// Current command sequence number.
     seq: u32,
     /// Set once a message fails framing or checksum validation. Every later receive fails, since
@@ -678,7 +682,7 @@ impl CmdqInner<'_> {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
+    fn send_single_command<M>(&mut self, command: M) -> Result
     where
         M: CommandToGsp,
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
@@ -732,7 +736,7 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
         let elem_count = dst.header.element_count();
         self.seq += 1;
         self.gsp_mem.advance_cpu_write_ptr(elem_count);
-        Cmdq::notify_gsp(bar);
+        Cmdq::notify_gsp(self.bar);
 
         Ok(())
     }
@@ -748,19 +752,19 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result
+    fn send_command<M>(&mut self, command: M) -> Result
     where
         M: CommandToGsp,
         Error: From<M::InitError>,
     {
         match SplitState::new(command)? {
-            SplitState::Single(command) => self.send_single_command(bar, command),
+            SplitState::Single(command) => self.send_single_command(command),
             SplitState::Split(command, mut continuations) => {
-                self.send_single_command(bar, command)?;
+                self.send_single_command(command)?;
 
                 while let Some(continuation) = continuations.next() {
                     // Turbofish needed because the compiler cannot infer M here.
-                    self.send_single_command::<ContinuationRecord<'_>>(bar, continuation)?;
+                    self.send_single_command::<ContinuationRecord<'_>>(continuation)?;
                 }
 
                 Ok(())
-- 
2.55.0

