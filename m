Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9724437474
	for <nova-gpu@lists.linux.dev>; Mon, 10 Aug 2026 18:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385603; cv=fail; b=nnWuerD1L2ks/uN8KtqN1aeoAh31uLi6RxTqTMXCinoBJb7uw1fPoBlA0RkON9FLDRyPsBgb8GebwxVIYIGCqm6qYgO+htqqT/t6E41d6V6U31W4p/iAS2Sle3q32IO1mT9ihFC8vBv+TC09h7MM09v3zz5yPgh9BbxywNFdnR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385603; c=relaxed/simple;
	bh=OBjfrLhmdzeuohkJTcpaUhyWrgbmQtlz007iGqFxMdQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bUwyBUgJ1/LpBcOygo2eh+f3g89O6x1B2rugLTIAnlOe6nuGEC7kdjty4PzcBRUr3RpmYvnqLBJz1ltURgSlkxOW1mHNnijx4a4xY7mOkVmu70CxlY7nL4gU1uTl0UWBQ0Ke/e5b5+SAcGOewTT5X76q+dbPUjdXlsFGMfUaThw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fhnrLNur; arc=fail smtp.client-ip=40.93.196.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fhnrLNur"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ln6fS1JYRQX/0eCYQOvgJ+X0mrJQud9ppkYyine0/BicGs+S3tOCy8xet/jiAn14EK3cS1zmrYZR1mMSFDyisfBAn5sAAC1Sjj63mO7RTe1EQjultg7P1WNLOnowFA/m/AfMdo5F/afIe1FTO/WKMUgfXjB79gJCCt/9I4qzwAcx4lNhWaKdjRYJw+3f3d0hHXX/ygEhpAEGJtlA67l4X5Cg27tp+PdX4Ol80sxRkwTGCyaICnyu/5VldDA2oXtHx5WQPuGCOAHw3GnqsyyeHZlL6oNXroyLKsNwOJsuTjOzHRIFeajiUBOQ8kdLvI46n8sAIFDpjBAX5EDVqMug7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4HkvDrehhN9FxCpf8SSFRs2+/33Ntvh/ZpGe2gvFbk=;
 b=epQY4fSujtJafgImuOCZPNllb1i/xCbC5/5wywI8gEO/a1iSRXZTsLN2gYQBe6DdjanMXenjJFMxDmyNQx8cEVPQMyTP17gsQKUPdrmH5EZnCP6PiqhRRawFLouW4Tp4m6lAQh5NprlQi9obE3LsxAbEcYGKFC2z5eke6niTEJJH4CVKBBJnotmIv8H0AeRiKx3LeVLCF41foFvByT4k720zykhe0S6AEPpZhvHIU1k7kprPra/A7xGgNVVX3Sh4xLenWDng3xRsiCj8LP9Ko2UgT6VRTxgDN/S78V5g0XLfhOwbEZinKqHOenjnUKm7226tsMDq5mFCjvMvPNqWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4HkvDrehhN9FxCpf8SSFRs2+/33Ntvh/ZpGe2gvFbk=;
 b=fhnrLNurUHi84x5dcHEN69O6PCZVnR+8UZKW2UZoPXCTKDhUtG31OdBVEgKj9fyFL9pos59QHxpKbUb0CcoH+QteT1RhkdKfjk4by3oXAA9zK4dOga/oXYNNJRw4DhBod4XNU1SquOMAbythYQH9Pfakx+J0awGnjWcYcWFXzSB6XfU/9p3kQe8BIM3G27Tcx0qYC3py3qeW8307dJTbTw927TcPaoMUGObMiGmhKLZz1MDlx7tLmj7dh4UOkKlLRm6gprtyjYl3y8qhIUSBMAmwTB7qL0PuF+TPF3qdaOjgF8R63iT0C4wMzb2+RGperUgym6S0NU5a5J9CA3EGQQ==
Received: from MW4PR03CA0357.namprd03.prod.outlook.com (2603:10b6:303:dc::32)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:13:14 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:303:dc:cafe::9c) by MW4PR03CA0357.outlook.office365.com
 (2603:10b6:303:dc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 18:13:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 18:13:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 11:12:52 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Aug
 2026 11:12:52 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<nova-gpu@lists.linux.dev>
Subject: [PATCH] gpu: nova-core: write initial RPCs before booting GSP-RM
Date: Mon, 10 Aug 2026 13:12:43 -0500
Message-ID: <20260810181243.3036669-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: f897c948-0c72-4fbd-9020-08def70b0b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|56012099006|11063799006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	nTQf1g12dFWomE3RMFUBWO5vbzZy4JUkBFtRNbaoOeDfyANsipFmvWSY0rB/KjtHwR+04I9n1Ig9xesohJ3ojfoUQfqsdipTU0N50iSLtcBOXfbB9UvqXSn5v2bkdzT5BbFfNI1uBqTMW6CahEgefcE/RwepOYOmT4NPw1C8Yj1KZJyhzxCwDocuU1HFO2TEzeC0J+iUN5V++ruVDhwHx9MS293vTfSPMZ1RdIGBAvTk577u+U7QWiURR/Lf8JxtrUPx1mrjFR1xA7Jg+nFvga7xxFclcfAAusiIhx0thCY9Kgo46Bi3LzoyBsXsk92MVfBQYJuvRa4natIjVDiBWsbrQcnq1KNofx4DF9MkDTxEgJx30TMSymCg1Xmz+fyUHFG8WrFZsw0pGAtdEJN4IRERsHE5rw0zFe4efU91TbaOjgqnRUlfZOq3oe+W75uZXybZsdFbANl3HO+fNaSlrIQHZC/CEKCcvIKXrir9fSbwUuD9hS6K5pYSHxNCc10P2QtA1XbRqyHcqfIrYzpF7ZZCXxNOLqcz9UmxwGJ4F/cgVaw5IVfuzCmRi2/TEeuC6NoEsdPTT8maRsPLALFtUwEFMaKKMtZ0N08Jegc4GCghhlWyUVdkDlKbH/UEX2neUAGeciBldq8nfCevIqCj0HEIL/HeLc1hz/JVDIJzv7B9HL0gJAO02qgEuVTqpgSiC1vsJ+CY2S1DpbJgzXBtYQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	anhOp1rXTK/4sw0aE19yXYcVJAR+AqMnoYbq6zgOYHWzzm5pnxEPtoYrw5Boi59l+GO1XL2dsW9CSx2xfNR0dPyu2b0T71vixgBvcbbWOpQyWI1kstMjZ8BgdTO2xKqJE9w4q5edvCYRfNDhdHCpsCZLVMi3/qzLTDAoPEyXqniPYIq2Wtt8HqCVw2v9geILhOvL9VJVwwoXd+/bIeq+sawQ5QqQvAL/yR97w5jrfYgh1zrg5DYTsyLfvNqyk6h4aexWuLF693negvY5EXMJtt8UaTZ+sG9fCn8hiPDxSqKiupkNjGwX51o6NVfKN9gJkng01nhaanz9HlFKLBobU2SUmVgF1rfzCpShiPDlubZKwMLMsXdp1KMuJeVjhWoKtCywyEhU9o3rNsfa/Q2gVmfdeSpdn0KqPL33tP3gw5MtBU3++NHmTu588s2JL6I5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:13:14.0496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f897c948-0c72-4fbd-9020-08def70b0b6d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Make sure that the two setup RPCs, SetSystemInfo and SetRegistry, are in
the command queue before booting GSP-RM.  These message are expected to
already be present, because GSP-RM will process the queue early in boot
but will silently ignore the error if absent.  GSP-RM then continues
booting, but since the registry is not set up, it fails to initialize.

Fixes: 0e42ec83d46a ("gpu: nova-core: gsp: shuffle boot code a bit to keep chipset-specific parts close")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index e03700ee7bea..874f6e9499f0 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -44,6 +44,11 @@ pub(crate) fn boot(
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset), GFP_KERNEL)?;
 
+        self.cmdq
+            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
+        self.cmdq
+            .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vgpu.state())?)?;
+
         // Perform the chipset-specific boot sequence, and retrieve the unload bundle.
         let unload_bundle = hal.boot(&self, &mut ctx, &gsp_fw)?.or_else(|| {
             dev_warn!(dev, "The GSP won't be able to unload properly on unbind.\n");
@@ -73,11 +78,6 @@ pub(crate) fn boot(
 
         dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(),);
 
-        self.cmdq
-            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
-        self.cmdq
-            .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vgpu.state())?)?;
-
         hal.post_boot(&self, ctx, &gsp_fw)?;
 
         // Wait until GSP is fully initialized.
-- 
2.54.0

