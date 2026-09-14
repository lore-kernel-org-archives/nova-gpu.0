Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1703E5ED5
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372209; cv=fail; b=WfyVLiDL9alZ53jRlLrO/uGZoAVNbcnhFJbcjgB3tcuBAzOTfeKa2s7xib0NceMZjZdjQq032nKKKlBGczqwtj5kErukmCWWvmQ1aN3luq1b5iAWYGey+2GAh8u7Y9cswwM8uOj6GlBQB5lKqdUTEE5cxGPYfQKvmLtSnYp5MwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372209; c=relaxed/simple;
	bh=D2w9ieCOwpSl+y3ev7W94+UIu77HrVazFiz8Jw9YIE4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ramZn390tqxLf1vxailsgLQIUSYK+TGnFKMijJav85yYM3FKNKvcmmqtuGNc+pDXLN9zOmfa2wlWmcg1thLk0RMqj2b4Y82j0zcGYLAK5IoM8aVeuuZIiEOfyMFEqmHVtO6VzwN7tAz9kcfN7XUNDgAYXKjwlo+EtGV9P6O81CE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gB1axsCb; arc=fail smtp.client-ip=40.93.194.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gB1axsCb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhOe+mj6FyZKq5ZDPLC2IP4LnbX3c4eYPt0VoNstL1UT/pWpkyUa1UAH0Q/98YxNLgMHI6dks3vUD4BSlHy6R+62p8iyYHn7lo5ckvf+OiRGq13p0ZmHfJwWwDjetPlrT5D3T9hpwpO6T0wIHgkJf+82v9ZzXkERIKXVpOznC36gMk5kloXHmCZnrVU7Zl8TYOWi2qkJsnawPyXVrLWu/lF+SzuqEb+tRt/PvaP7EIh5vHj0w3bJtARCaq+kWonst0XKtcfN+VdPVxMiZX7fZW2N+d0e1tcRF9XzQ4U7ugZdlKSJlSevGtJ1qYy+S6I2n4xC8M7jxDoAX2AjkOKGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZlFnjAUY+DdfCQTQhKq5jvB6TEg8jM4bUKSbJQ+2+g=;
 b=WFsd0rs3ZGwyH7yBNO75xWfz+Gr1mASq1kWk5OC5dyHP92kOK1+5OIsk1GCrNFBTluqwsEUK3myM71dO6bF7gPW802RrGpRhb6A8JFW/NQyNQR2YtkmaJ+Oi7pC8BLClrBVcN0JrcRmFzqSR64PYUaOdDXtv4DN2JiDgzpj7tRpPUbboy32Vd3J8qDyrNkNZckY0O9is1hp5lf7cdbaSAHbuRLKLSL+IuMxu8K5N1GqP1JgTmgOLR1p5Ss9+SYsd5K04RHPE2V49VEKi3tPBaTKi/bboOvtRxiiGyM94giZnDYfhI3ePTGk1L/woAueqX0MauPx6OITDW4o31JCh/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZlFnjAUY+DdfCQTQhKq5jvB6TEg8jM4bUKSbJQ+2+g=;
 b=gB1axsCbx5hQMa5OsqipPLvR+QYg91lKnSyWTjkj91x4gngDmgrLDjl7lj0hs9aPCqdmiFXoefC39Css5rcbnHm+cwcWrUfotLqPnvzFpIkj+qQdXKGnZgQYhHzI6Mlqu885UobsFjV4Tm0oQ/ci+mhulEfsoctKiBSc/vD7RmeTozxHBAVNrWrL+INNF+NuJgckGyjRTuQW5syEazc9N8UZewDVLlg9ATgRYnJamQkDG2HRyx8LsYPxXD0/1by5Jew1HxBcek7QflX6891iqZZQt/NQ40FhBWD8GOIBDesmR8qAgk/32UuRiSJXhpb3Kbu3CBaQI41PJnMDNDDPYw==
Received: from BN0PR03CA0039.namprd03.prod.outlook.com (2603:10b6:408:e7::14)
 by SA3PR12MB8047.namprd12.prod.outlook.com (2603:10b6:806:31b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:50:02 +0000
Received: from BN3PEPF00022BCD.namprd03.prod.outlook.com
 (2603:10b6:408:e7:cafe::c) by BN0PR03CA0039.outlook.office365.com
 (2603:10b6:408:e7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:50:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BCD.mail.protection.outlook.com (10.167.248.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:50:01 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:49:46 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:49:45 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:49:37 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v2 03/32] gpu: nova-core: vgpu: detect boot state independently
Date: Mon, 14 Sep 2026 10:48:38 +0300
Message-ID: <20260914074907.1399629-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914074907.1399629-1-zhiw@nvidia.com>
References: <20260914074907.1399629-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCD:EE_|SA3PR12MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e469415-ee56-4949-9740-08df1234c87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|23010399003|36860700016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	y/hlWy0pKUgJ3oNMH2KYOWNKyjzuORmDeUrX/8BKxsuI8V1dYY5z3bXNPpPT7IrwtrcF8UyWORwX1slrZJg6eC90sePT6LkW4t961qL2MbNjrAMJdfQFzanu/kTox2xkZjoTCew2guS34LUzMPwaFACANurZxDvpcZj/bTVV+aErRRVl8JoBZyYjKxcSCYqWdeQCVyJdhUHs4nB6z3hRko3Kdbk9gNn9+kwZBUuM/GsI+OKGxRYurvjjUzqQxh+nnjX04dGbfeuTv37LrAcpVJ07JIJXa3gynwOsmPt+JEVaXvto8HVN6GTXe84zCJJZT+Gdnvm/9fUMz3W/YzMEh3bLxuTTar2SRrhNzVVb1XWHriyTaGzaomU/2b0wBCrujuQYbpEnGhqwu1HNSsvOUajNzH4zM2Hyaau0A1qhDNTs6Gbkpr3FI2eMuTIFjbtNXmufp/29/FCW/EFEn/6m6hJYJnfCsWU/vb8bF2cyUGXCnU8jvdy69pSVAPwfcDXHAAtjW5MmaPGBji2VdajLdHhUxqWkoMIwnKz/cGK55dxxNkzeohiRQqnPHbSP2PGdZvShdn+TkZMdQ3H37vr7vnyj+7wqQlivkusY2CTFha+vQAXr8G2MZ+YjEMtXZcAwMFTK25qod1K/3bWQltKN4cG0CX+jLRg5GKyQlPul8yFZZG7+VZxwvPZ567c8NHM5GP/+NtsEqmjiJTHBx3PQhA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UR0tr5E9frRfTghyM7jN07yuLRCk6q5HpOMDFqiiuCo8/SZ5y/h7XfIIC4hIvZfj5cJvJ+8Fd16rpehX59+qjAfAO8Dp+1LzSK0zX6QbysyHurwDrCT0Xo5B0rnxKKnVCak5xi0UyIb1Y1TekQEKejd/0JCFESL/Ai6JJ9jPxx/korjd6LBaxqtcBDuug1EGdKIVnPwYVpJRFmoFgob9g91dQVSN3RnyBe2Y3dWWu/NR8WIyC9Cw2v/O+pwZTZzZitsPvDB3R18Z8Gi0ye9RCSOdls2z3g5SUhsJo97Rpbut4p/oPhyquz2upPPxKRCxmougZvd3zJCDSpbna705HFh8MQqtO3UfhosTGzowPGqsJqj/yN5C2Bw38UgVyLBddvB2X3yoXN+h5y9Vjpa/eZq8J7akkBidb4GQtwyqegJPS5fJTZkdHKtOKIlhhkp2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:50:01.9291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e469415-ee56-4949-9740-08df1234c87d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8047

The vGPU manager currently contains only the detected boot mode. Its
construction couples mode detection to an object with no runtime
management responsibilities.

Firmware setup needs the mode before allocating GSP resources, even
when vGPU is disabled. Keeping that value with GspResources also makes
it available throughout the firmware lifecycle without a manager.

Move detection to VgpuState and store its result in GspResources.
Borrow it directly when constructing the boot and unload contexts, and
remove the state-only manager wrapper. Preserve the FSP query order,
existing diagnostics and disabled fallback.

No functional change is intended.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 11 +++++------
 drivers/gpu/nova-core/vgpu.rs | 25 ++++++++-----------------
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index cf24c0d00173..39e9e4ab0be6 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -48,7 +48,7 @@
         GpuMm,
         VramAddress, //
     },
-    vgpu::VgpuManager, //
+    vgpu::VgpuState, //
 };
 
 #[cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
@@ -294,8 +294,7 @@ struct GspResources<'gpu> {
     // TODO: use different resource types for each boot method, and make the relevant Gsp methods
     // generic against them.
     fsp: Option<Fsp<'gpu>>,
-    /// vGPU state detected before GSP boot.
-    vgpu: VgpuManager,
+    vgpu_state: VgpuState,
     /// GSP runtime data.
     #[pin]
     gsp: Gsp<'gpu>,
@@ -359,7 +358,7 @@ fn drop(self: Pin<&mut Self>) {
                     gsp_falcon: &*this.gsp_falcon,
                     sec2_falcon: &*this.sec2_falcon,
                     fsp: this.fsp.as_mut(),
-                    vgpu_state: this.vgpu.state(),
+                    vgpu_state: this.vgpu_state,
                 },
                 bundle,
             )
@@ -410,7 +409,7 @@ pub(crate) fn new<'a>(
 
                 fsp: Fsp::try_new(dev, bar, spec.chipset)?,
 
-                vgpu: VgpuManager::new(pdev, spec.chipset, fsp.as_mut()),
+                vgpu_state: VgpuState::detect(pdev, spec.chipset, fsp.as_mut()),
 
                 gsp <- Gsp::new(pdev, bar),
 
@@ -424,7 +423,7 @@ pub(crate) fn new<'a>(
                     gsp_falcon,
                     sec2_falcon,
                     fsp: fsp.as_mut(),
-                    vgpu_state: vgpu.state(),
+                    vgpu_state,
                 })?,
             }),
 
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 905b3a7331fd..b405ba49c490 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -30,19 +30,16 @@ pub(crate) enum VgpuState {
     },
 }
 
-/// vGPU state manager.
-pub(crate) struct VgpuManager {
-    state: VgpuState,
-}
-
-impl VgpuManager {
-    /// Creates a vGPU manager by querying SR-IOV and the FSP PRC vGPU knob.
-    pub(crate) fn new(
+impl VgpuState {
+    /// Detects the boot mode, falling back to disabled if querying the device fails.
+    ///
+    /// Call after creating the FSP and before allocating GSP firmware resources.
+    pub(crate) fn detect(
         pdev: &pci::Device<device::Core<'_>>,
         chipset: Chipset,
         fsp: Option<&mut Fsp<'_>>,
     ) -> Self {
-        let state = Self::detect_state(pdev, chipset, fsp).unwrap_or_else(|e| {
+        let state = Self::query_state(pdev, chipset, fsp).unwrap_or_else(|e| {
             dev_warn!(
                 pdev,
                 "vGPU state detection failed: {:?}; disabling vGPU\n",
@@ -51,12 +48,11 @@ pub(crate) fn new(
             VgpuState::Disabled
         });
         dev_dbg!(pdev, "vGPU state: {:?}\n", state);
-
-        Self { state }
+        state
     }
 
     /// Detects the vGPU state from the chipset, SR-IOV capability and FSP PRC knob.
-    fn detect_state(
+    fn query_state(
         pdev: &pci::Device<device::Core<'_>>,
         chipset: Chipset,
         fsp: Option<&mut Fsp<'_>>,
@@ -83,9 +79,4 @@ fn detect_state(
             VgpuMode::Disabled => Ok(VgpuState::Disabled),
         }
     }
-
-    /// Returns the detected vGPU state for this boot.
-    pub(crate) fn state(&self) -> &VgpuState {
-        &self.state
-    }
 }
