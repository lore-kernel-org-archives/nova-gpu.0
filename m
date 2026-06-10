Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA23346A0D
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781113821; cv=fail; b=QQJoLzrg3S8GA+HXUlfO/xr8xQMnJiJnCeG0otyDwZL56gZr5L4iCYNXkZ6XFHIz4LdNkusOF/c5R7m/F7Gck1CgyC6/0P38KjGibbnrUnPk1T3j3u6ufj2saOVaUTtb+TeXAN+Fy8QVu2e4ztARKapBHErpIV42phbD+nGXjtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781113821; c=relaxed/simple;
	bh=qU+fdlQBgNRIvPyCoc/yhUeOUq+KXNKWUQRAEVK2LxA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbr23O1C9zYmu+IarKOsekHZNBVFcddZblpa3mRLVV7jhk7iID8q/sqWEDWnMA/sob334UgT1RbCcJDABex10Dtw21LtKejWpXdc8klgnqzNQ/8zzQ/drIr09v0SJWdmz5inrHtsSLKBzV4untsaDAvXtzSpZWqGc3XBsB31uJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PNNO/Q2D; arc=fail smtp.client-ip=52.101.46.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PNNO/Q2D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjanZG3kgzRpjxpO1aNkV4H+iyWAkztNUm6b7bLYxJDMY98Y35leZMiElMPPE7H4EY3O9g1j0vBtxEXOnoF5rNqPdWs9AF2PBAajUKpAuIB0VPzmvSnpzpQidrDCzo6+PBv/DFaLRnM5ueqhTA2pvDXeL7+BmfPVqr3z7GTF40bHY4M0srteEjbgIWwDIocvaPewsU5Im+UmOwLZcRR967A24RI6sUGHRtQntDsN248gfVAwhPtq9zu+Y+zBhSvb3N+003pASxJEpWpza0JwX5JsOghcfrmsj1rrnvnL6/ZyvE5wPPk6cpDHnA9NgMHMHuiZqloBJrYGmuLJeECcjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kl015ofsdmoWd3pTZpglETRgQah6w4PMPiTSbqnicvc=;
 b=Vz5Z09DAJnovUJQg9Ec/4OOBH1Kyh2CBmfK7g4Se3aHY35OnE2OZb6wQ7z5EZwYXrgJcfLlhfLIiixW6l+ptlbca2pODgoNP2ksAMNjvGFGtTp3s9Df4RkKUw3JwYxhSnLp+f+EjkHbY3DqlS6BHEESgOjbUT0XLEAoym1oZhHRvBbn8lmYNh2ZcdzPFQ77c4y2S6YBDdkmFGKgnQ2PZwcBUtA2I5lgs9y9jHdF8+mOZPQuP5jWrbgzT79ufldzLZ8CjRf+dJkMBXqG6odJyOC1bxqdGbzkmJvuUU+k676odMUj9QdUfLovn8csRulw7kD41jBbd9zm5dv5tgF4c3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kl015ofsdmoWd3pTZpglETRgQah6w4PMPiTSbqnicvc=;
 b=PNNO/Q2DYU3c2S0kjCqVnQEqc2dFxGJ5qiS9htHbKIz1m6VrKHBfhcgJ4UIafCd14quB4VaT9OLH9rBIUqwy/dO+HrtFm+NptMGIfobtyJXhgw+1F8vllDicbyUOEsbcBc1cRk5EL2qzqgpLXlhdABnoFifg7Evq8rts7q7oX5Rpdrwygowbwlc2XCq1NOQoYD+Pri58t2mSLRTxnCNo9n45sW60QbAmrivcqpkuaD/U/rIxsu6m8hcNWEPYaJhurNWXAARS3sVfTwX1PosYaF5c+S6EpqxJq5q1hSI0Od/Fnfao2pYMMZNwdJhdgKBnFY6IpPegd6SITgN8XoiaBQ==
Received: from BN0PR04CA0044.namprd04.prod.outlook.com (2603:10b6:408:e8::19)
 by SJ5PPFA5F0E981D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 17:50:15 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::48) by BN0PR04CA0044.outlook.office365.com
 (2603:10b6:408:e8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 17:50:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 17:50:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:51 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:49 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	"Alexandre Courbot" <acourbot@nvidia.com>, <nova-gpu@lists.linux.dev>, Eliot
 Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>
Subject: [PATCH 8/8] gpu: nova-core: update firmware module info for TLV images
Date: Wed, 10 Jun 2026 12:49:29 -0500
Message-ID: <20260610174929.744477-9-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610174929.744477-1-ttabi@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|SJ5PPFA5F0E981D:EE_
X-MS-Office365-Filtering-Correlation-Id: b6723670-10b7-4f61-81fd-08dec718b9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6y5p7Txp8FmgD84U9ZnccTIJUaU7OdHmbbTmuFFbUdeWuA2N9nFj1f4RFwlSewgdd+o5XiZIVsTvYSMU/oOXHSIitdxK9XzwgdtaAzYyif0l2Isok8AeWF+CbgffUtNW3tk/W+5bBFmVPZeZdVAbM5jUNfvvkRE6mOAftVVxcK/r1lJAZHf+5FdFy1v1FQkYCA234mJwFoTLP0XwtJ6cw9dxeXgxQnOUH3sa1qPtt3SK6DaWLvO8kmnPBWqACky3TS0oLM+qPlvvgpYbitOEb8TC2GPhHqdwPXQZhpcok1AY5EsLBkD40fHOM7F0Sf9IplzlcHxCOljLX30mx90LTq3JK8TNOW/Ejlul+wHnFuocQH+AY28cTR/YtbvgE/OuGlyE3I9wH/ECPLAXv7PWv1xvE2i6WoJ4Xs5jaeZpA8WH6I4TAe2vjQOiQYbdKRxnjnqrtx9ITHCko8dCuD+7qfHyt7jQc8JN+X8cfx9ViWF5OEyUJzRPkEUTHawLBzA64XipER5LfP2P5+sVBw6BUf2NPmNl90xfnMA1oWXdJYhvs53BV6nOgGxE42Cref28ZDitBYC+Gk92+MdTW0EWUm5VxOJmYbAcO4mzWeKHXyM304I+t9MzBz/FBW3Ism66LqWQGbyTfN/PtSBZx9jeWovdfP4SmmV31YRLLIbHRBhGVm1pPCYX4CzlvDXUGY6aHJWFVkjzIoi3LWIZ70IBSRonoP5itun5H1h6cSHyYSA=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DDm6r575I3zd3rEWDCYvzfp08LvKR0y4xU4YdaUI6rUQhzQ/C2C7pwb8Hoi3WQNec0a06OoJw/MaBYC46IE43On4fpf5Mro3zGP8eWOFQQwrLUop/YsYIOPbvyBGIgwYaKgq7lparDGAZWGt+CP2IWX465+WZO1dewuFjupzpi+XCXeYE02H15CnB2yQUC0xYDFQVDNSnEsg4NM/4R1PA5LSAGfj4H6X4MOcgzBiNaRS6W5XNlJ2PjNR8JAVa5yPDPkSohYRomS4wIGbj5oTaO70h4uPm82cu8JrczA3duNyqNulV6lQjOF2AvuyhUjn0ooPYr0OaoOfql/D5kJRouXiDBlY9tLbG2X2L3B+SisHJBN0dDL7Ws/kd47J5XtAJHeQKQYJi5WBL8S/jQ5fvrJ5sHWEB8RRO01FCqcRaPh+xQPFzEEdkUborVuvML1x
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 17:50:14.4841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6723670-10b7-4f61-81fd-08dec718b9fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA5F0E981D

Now that nova-core loads the TLV firmware images, update the firmware
module info to specify those files.

Also remove FIRMWARE_VERSION and request_firmware() as they are no
longer used.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 35 +++++++------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 354945cafda2..1149ef0730e9 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -30,23 +30,6 @@
 pub(crate) mod gsp;
 pub(crate) mod riscv;
 
-#[allow(unused)]
-pub(crate) const FIRMWARE_VERSION: &str = "570.144";
-
-/// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
-#[allow(unused)]
-fn request_firmware(
-    dev: &device::Device,
-    chipset: gpu::Chipset,
-    name: &str,
-    ver: &str,
-) -> Result<firmware::Firmware> {
-    let chip_name = chipset.name();
-
-    CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}-{ver}.bin"))
-        .and_then(|path| firmware::Firmware::request(&path, dev))
-}
-
 /// Requests the GPU firmware TLV `name` suitable for `chipset`.
 #[allow(unused)]
 fn request_tlv(
@@ -376,10 +359,7 @@ const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
                 .push("nvidia/")
                 .push(chipset)
                 .push("/gsp/")
-                .push(fw)
-                .push("-")
-                .push(FIRMWARE_VERSION)
-                .push(".bin"),
+                .push(fw),
         )
     }
 
@@ -387,20 +367,21 @@ const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
         let name = chipset.name();
 
         let this = self
-            .make_entry_file(name, "bootloader")
-            .make_entry_file(name, "gsp");
+            .make_entry_file(name, "booter_load.tlv")
+            .make_entry_file(name, "gsp.tlv")
+            .make_entry_file(name, "gsp.bin");
 
         // FSP-based chipsets (Hopper, Blackwell and later) boot the GSP via the FMC image loaded by
         // FSP. Older chipsets use the SEC2 booter instead.
         let this = if chipset.uses_fsp() {
-            this.make_entry_file(name, "fmc")
+            this.make_entry_file(name, "fmc.tlv")
         } else {
-            this.make_entry_file(name, "booter_load")
-                .make_entry_file(name, "booter_unload")
+            this.make_entry_file(name, "booter_load.tlv")
+                .make_entry_file(name, "booter_unload.tlv")
         };
 
         if chipset.needs_fwsec_bootloader() {
-            this.make_entry_file(name, "gen_bootloader")
+            this.make_entry_file(name, "gen_bootloader.tlv")
         } else {
             this
         }
-- 
2.54.0

