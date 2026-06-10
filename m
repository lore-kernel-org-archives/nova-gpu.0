Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012014.outbound.protection.outlook.com [40.107.200.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E629D26B
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 17:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781113815; cv=fail; b=FMApTv8MYO/VNHFx8pOtdNRFVD1ykZ2ZpcR+lT56YI/Rb/hle0P5RhTzzBPrknvzLYo8PRxTHngJrC54A/jTr5x/cDcdUKmVGplP2kJUHYX8VRhqUrhaXyo4CANgNBbr+iKoFAj21SqwUtyGSGv1IYodIbGlpeqZWgjpDe+9CeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781113815; c=relaxed/simple;
	bh=MA5n1MwOzRGk0GqpwXo6SG8ZC0qIU6BQjeK1xTFv1kQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FNrsAlymPlRNaEO0+8pyIvkM9bD1TKS0pAgZ5NkLsAflTHKHnxPKqvWhyC68RBqzcZz7BP2lJJLuTImnbva7p0S/8ryJui93Z27lr/58MXozLxZbp8eJezeK262SStRuA/AjkDwaBBHtMJjxNacz7BO8CZ+Gbz2eLRyF9SLCVCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kw4NTG21; arc=fail smtp.client-ip=40.107.200.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kw4NTG21"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcJKlm8tzhjM+drrjeDMUy9Jo4NjYZnYGLPCYa1BzWhd6X2KdeGvA5lFZT2RyuHTPGuhgDqcJCQxM2dhXr7grDg8S7Y5ok3/UusIEVjWYMn+edcvaKzrvrNPiQEJbhIDYilQolY/HLQ8W/2cZ4g8vdwvo6VJFqK1jC73UceShEgcElK4NgzAzr9zM8Bw0JL+bjBQhQYoZuvtxk5t31IGb0mf5ivs0YhQkCKsgZ20yUj/CbsGxT1Zpbl+6sgQ6016ux4J3EYtPvzcKMl6Gj7oTMPIx9K6C/R9WM3QJhynNSx9ciW7xzUnbBKeeKbZA++tf4+apb152HFDPCAdh3zpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kprZpFDMX+dm6F/e2Df81T//yCKd4txssyFOGV9wX6U=;
 b=BykpilRm98Dr9vzHrOb4F+SN9vucWYmJaYhT5kGELCpKVa0SxhWjT3zO6lMf5N1M8DGOSLyEZLT6iZSmHkNNdR66gegcy+txUCGTXkoXcZoEnVXdQsKmCQqnPsnSprsbriyRXLBBhhIGOyqx+UcSRHwHKY004kQTrkaS46MLLE/vjHPupswjwO23ZIZyhbbLhOtG+UBzXsfG6BIBgP2M5mn43PrrMJyxbAUDJ/EVH854Nu2bPZNsrkW5r3PAoNx4Xlwaqzf4pNTD1T7ntFHe+HfMTzpdSnnR9guXY4DvEJLD2HuFggW99hZqtreMqxkTp3DnEye6rqJSwKIkQNi9LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kprZpFDMX+dm6F/e2Df81T//yCKd4txssyFOGV9wX6U=;
 b=kw4NTG21xpwVA/XzO+a4s+J9/CkKmRt4ZO2tWmM5nRPORAh7l5HoBSjtV7whkDjuL0mg9fwT6QSMstHhV+27B0Rdw/tFFiYuNzforLWNs5mH5c/xtzTg+TNdkq1a9OhL4+XyRRiE7BQsRKExkZ8rk4HFUZqFuk+kFY9gCUZS6kszT9GY2vKokb8kxOL4kwxMBgr42IWR4J76Dk+yW0X5/GxOd6jCRi4R+6XsPDHDIdEDl/xQx/y7D6NJHqLCEW6ES4/pcD+r4wmotT1Dx4Nlq9kKJfOahYJXzmkvZWIFj3+7JuqNW4/4/UBenRkGV0DyGZgGT2LDjRxdwOsT9NuKnQ==
Received: from CY5PR22CA0057.namprd22.prod.outlook.com (2603:10b6:930:1d::31)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 17:50:07 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:930:1d:cafe::6a) by CY5PR22CA0057.outlook.office365.com
 (2603:10b6:930:1d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 17:50:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 17:50:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:41 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Jun
 2026 10:49:40 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	"Alexandre Courbot" <acourbot@nvidia.com>, <nova-gpu@lists.linux.dev>, Eliot
 Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>
Subject: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
Date: Wed, 10 Jun 2026 12:49:23 -0500
Message-ID: <20260610174929.744477-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b2af45-3dac-40c3-cddf-08dec718b47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|22082099003|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	ZNGiINn2uXYb+Z9f7vM7NA3+MERblcwx5JulWDXljehGMkAKrgR8d/kiWxMHmX8XnuEofQ0U/VTv5SyhpDz2K54RGWlVpsCn7a9WlgBSaydGEBAW2IdizWUdvwZySh4CM58YaEqGBajWg32uRRLzkJrSayZ8f/q5JiZdsVYxcWW93LRe3VvZVIcd/90jgWqyhDAO+QHo8n1rMo9quW/y2UCq81COFOvEXVaUXInLNn43dW0fuk2DuLPxI0tUjKwjQzeButcPX49QGZVD8bljflXBoS3JUAFdsZd1l13SdbdByFb8WHXyXhULgfvNrLe5C5z7agAroKOaZZ2LW0FXNkcGbMkpqOHePNRzhFUnNKedX6R8cLMrCj4PFiUjjncLk/WM+8Aqix47LqSMz65yhdROOWK4egVX3k65tWgRreUIeDF+hzYLD/erSSPyFlL2rnvcWskveEAChOYIS+y8HrSMgiP75UOnW+oOs+fbCHlgEsjaCJdCoZ9kQXwFmSelfd8jeV2onK0H8oD3UrJyOf7aPKuNJ/7FndyCJ7f2xQudcqXTHgYII/kZxYQPuigag91w458x0ddfRuIHbgf5BsPOW2pT++Zyl3fwgBZsI5uumSr6Wh24IWc9JkTGbgBqA2jGcqXoTboaLFH5hqobR+PuFeUoKM+GkP2ze+i809RxqgsLXLk3vwIKXiS0khAJDHy3FZV42jPbFzy9WeRn/jTUwuhJpPHfkwMnAqPIm2g=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xTfuYPWPETfzuRXRovfvHIWQxEHQzpB6AjyPuo13gBHx2q6yVJHcorYEmJ/+QDyXQcCAjPxH8yVKiTKxqo0TcpkNYMQhnoEEBtiG/AiLwqyJ4CMzNH40kwRaijh0zcbKNvgLX1IGHoK5kzd2MyZNa9FuBBc0WdK8I6ICIZZlHrJk/HNHWSBNBbedD8IrW7hN2zMIxuo/vb5cmW1t9EJHI53QAPfPvWd6Gf3tGx9g61hwQowWnAWzgMQp24Q9sJnbJwjtyEkR6yyW7GHFEJuy+ixTDU6xpSAp5GudZnukUX13KJ6VozQMz1jjmylTdOoV+OzgwvEc5H2tWWZgVSOlBch5LVOVRjx1dgLpHIHCYTbSFWj75C0DZ3o4QJhvDIRq0IlfgdSLepT5nNFgwPUZURBmNBvLYJH7qeqBzB35GHlO3t7TdztV/iKEJ1deapzL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 17:50:05.2868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b2af45-3dac-40c3-cddf-08dec718b47c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407

Add function request_tlv() to load TLV firmware images.

TLV (type, length, value) files are the new image format used by Nova
to encapsulate firmware images and their metadata.  Unlike the firmware
files for previous versions of the firmware, TLV filenames are not
versioned, and they have a .tlv suffix.

Also add some #[allow(unused)] statements to two identifiers that will
soon be removed, to keep the patchset clean.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 279fbacd0b8e..2749c196416d 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -33,9 +33,11 @@
 pub(crate) mod gsp;
 pub(crate) mod riscv;
 
+#[allow(unused)]
 pub(crate) const FIRMWARE_VERSION: &str = "570.144";
 
 /// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
+#[allow(unused)]
 fn request_firmware(
     dev: &device::Device,
     chipset: gpu::Chipset,
@@ -48,6 +50,21 @@ fn request_firmware(
         .and_then(|path| firmware::Firmware::request(&path, dev))
 }
 
+/// Requests the GPU firmware TLV `name` suitable for `chipset`.
+#[allow(unused)]
+fn request_tlv(
+    dev: &device::Device,
+    chipset: gpu::Chipset,
+    name: &str,
+) -> Result<firmware::Firmware> {
+    let chip_name = chipset.name();
+
+    dev_info!(dev, "loading firmware image {}.tlv\n", name);
+
+    CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}.tlv"))
+        .and_then(|path| firmware::Firmware::request(&path, dev))
+}
+
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
-- 
2.54.0

