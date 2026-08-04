Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010064.outbound.protection.outlook.com [52.101.193.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13EE48165B
	for <nova-gpu@lists.linux.dev>; Tue,  4 Aug 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785862901; cv=fail; b=OUo3agdXKGFKE4PdMo17an9zcEWvIaInMWuanRMG+TbtdfLglzMq5oIE1TLPQlGwDteF0pxU0iQHltlhowxl5ZBw+Ecs82aE04sx0hNfT9klZ2zCj+Wlmekx7ohPHBVrV5xB2tQRhWhsqUQnPl60Kgtz3WhBpAW9bJc7opPi2Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785862901; c=relaxed/simple;
	bh=BO93/aCFfaKLu544JzAGP4Pj8W61pWvWDGS5yQpeUiU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qS0LiChZ5fShK8bXKI/3dTz2LebXQqvmvnh0pDq9p08dpSuZ3wmwleyjtWgD5tB4PFYlCunSVntLeRUhujZyE/Nddaxzt4XJ1wC6C7lea3l5Sr9BJBvxNL9AQUaNT7zTeYhK6nC2yY7C3gP9GgKaVPc4EEhG+j5r96NSTIse+z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ey7W7eoQ; arc=fail smtp.client-ip=52.101.193.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ey7W7eoQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/E4Xpkaz2P4LoYwmMPX1V9BrjsnS4aPz4ey9wv9KnthVdaf6XU+Q1WjVg4V//0jgIc+fFlx302zbgfPknNWYrrfB9xemwyv6DqxR/tPTY7AWb6eqhOyI+BsmJAdXYTn6oor1Zm9jUglI5doRgWxDFVgXidy9eLFXe0fciLM701ExSZ+zIPtt/q6/INS/Ab6neOhs19wzAgpOvKuCxu+Ic61e9N196w63RJiALq/kATYq3k9lijkyMhUNnHvIBTPmNVbN0MrTJPghzoXV+v6NUgCvsz+NvlLcxozqSMz6ODYtN+VYvbzkGqgsuZ5DvVy6aP6pVutxhG2sMBFenLhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meoBmRCZS+whfxdxnJF83pVdhm7+xEisvBJAb54y7xw=;
 b=Tw9v/6tZ1lOs6XxU/OMM6cYPHtRBoRiGodJre5z9tqbnLDqcGhOSV+WuBiNYp4EAhdQJNe425zEJW8RcyCefV+6gSiGf6AogZnOiKnmdIGmGmivwEGeW9VSUJaZVb2iD+wnyESqT/V7Q15CSk18m363PApVGRK+ghdRJjDL9abz8AibdoHz6jRQLAHdkCvyXEUOCkc/iaTfKBAeRj5qWtfT34kRgWIAkoAFRNPLU3oqzM6mUoHeoyc3xSxCprknJ7LsSSFgXVZeXI4Gxjf7isL6Ab3hOHxhL0tDW3znpe57KlfRlnt+Wa9h9xs9lKKuXGNwy5IN8isQlHGIju3CPVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meoBmRCZS+whfxdxnJF83pVdhm7+xEisvBJAb54y7xw=;
 b=Ey7W7eoQYnTPimso0sFln+n9iqalPEL4kl/xBnHav31K6Yuxgo0vfITyP851CvHQLqdKbaRQswfuN3Y8/6ZOUtwwsfNFZGtDMB/LFmSGFRYA6hczRmtyS3BxouHBBDqDbF0KnbYzLSSWieWV8TgHIzgI1aGRPUttfsvqwqcWv9TReVVqFo84WVTQW96MKPouKLJ5s4DqXsWSUNGeeFST7/CspXoZ5EBLu+ZaaDKSWSdh7E4JTsgsDSzDWzaS2CBMk9dKOwR0YgAzjZG3iNYZYMmHqjyek8Q/jEY8xQbxelsY/FlSHGYtHnOeVYUGIcWcGo3/evhfR770NQY/b2OOpg==
Received: from BLAPR05CA0019.namprd05.prod.outlook.com (2603:10b6:208:36e::24)
 by CY8PR12MB7659.namprd12.prod.outlook.com (2603:10b6:930:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 17:01:26 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:36e:cafe::4d) by BLAPR05CA0019.outlook.office365.com
 (2603:10b6:208:36e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 17:01:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 17:01:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 4 Aug
 2026 10:00:55 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Aug
 2026 10:00:55 -0700
Received: from inno-dell.home (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Tue, 4 Aug
 2026 10:00:46 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
	<ecourtney@nvidia.com>, <joelagnelf@nvidia.com>, <apopple@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v2 0/1] gpu: nova-core: populate GSP_VF_INFO for vGPU
Date: Tue, 4 Aug 2026 20:00:44 +0300
Message-ID: <20260804170045.902069-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|CY8PR12MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 020493cc-f67c-4ea5-87ad-08def24a03be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|1800799024|36860700016|56012099006|11063799006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	W2YehztQ3eueh+IyL+Q8cUbBtzB4Lt3fzWNhM9pMCqemis8Ppt/JG/U/kjFOrZCLnJDlmHwsJybTJIRpMd2qFIVKWYfKFLSy1lwg/3GYQbuFgfvBExYvy0bMG8Ftlq0OlASv2SbyleaT6flItZ22vBjj2HHsrLbIT7V7SsL5Iu/PvGNXsUSjNSXqWV4OQx0fRfGZEJ0+k4AWSYGy3TLCgJPUM3EZLlYkTCN/xofMF8HhQz8SIvnINcu9UCNGvJsMhqO9vSJrlF0isiOjZLZ1zIeaRrhLW4+nhqCtGzmlLYGRGCayrjLtoaGMRzddJdnCgJH+hnZd41fMqE/DnVqLFIVci9tROKvhdKiulJUNSOpier+ggDZ2it10wI40VsexNJuNrVe22hywDBL7QM423y+0yi0H8kMvJwXROo25bdfUr8yA+RCPfnDqjRafskbUeWu9GzIvlXkjZWs2R7VMpmcf4U5pJGxpjN8GyhzdhVR1In3JkxJ8v2Z0Kj8TBrjgdJ3eazF6WTBFpUcIyf0tMkdz+5bY7tGqH5GazdZNqlrTkoP7FVz/1nNwwx8lPmxd8TGsuii5mSARWYqZfA0NCdMGWmLBUuNKTnt/FS33OMd2FSb+UPWYOVyGraO3brJ6b/5Rk5G0kSXnCiTSazljVryMBK1j+7V4pZIj6MxDdHxxlx7DhApKFFVMKAT4kyri6HOoqfPWyKGO7Ypl7q7oDQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(1800799024)(36860700016)(56012099006)(11063799006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kXt2U5pjFU80OhG5zzL7pH9lxeULg5P4nXsKOsdTGM/JFLMihgDTVg2puaERQYZHXc1446igCIXSkV+9qs2Dh37XDxEHlP5Hn1V10gWLzbFWyZHnjGTK2d/TTVhp+U6F43zQbINcXM/kgIcQsPH/VDqhochijtz9OCCGlMXvNiRGNBqwiM3mjxd/osKt+p4CLJIEtWV0frwMpOyf51wrAKjGQjrLxOBDb6t4dDkZbrs7FW2AxOrFhzoRNoR2Vs/ROa62Tg7iZTX0uUpOKtsKCUGAfokomBx2IKJfdiIxvZ7rvNfc/OTPYha8Tpk4kNCcXL3KV4p6Y0zPpbW38oLTcpzLW8xjdf41vZ+kZMOhyJnorYH3pEAqTjlumEhhOFApDAvLdhx+yZnB13Sf+WcDsXJ4LTN2FWRaXnU13ktWqtO73yTNsccSdzWs1t+0VKPm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 17:01:23.5585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 020493cc-f67c-4ea5-87ad-08def24a03be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7659

This is v2 of a follow-up to the "Boot GSP with vGPU enabled" series
[1]. It provides GSP-RM with the VF topology required for per-VF
interrupt and doorbell event routing.

When vGPU mode is enabled, GspSetSystemInfo reads the SR-IOV topology
through the typed Rust PCI capability API and fills the embedded
GSP_VF_INFO. When vGPU mode is disabled, the structure remains zeroed.

This series depends on the separately posted "[PATCH v7 0/1] Rust PCI
capability infrastructure and SR-IOV support" series [3], which provides
the capability finder and VF BAR iterator used here. The prerequisite
patch ID below identifies the exact dependency used to prepare this
version.

Changes since v1 [2]:
- Adapted to the v7 Rust PCI API by handling the optional capability
  result and consuming the logical VF BAR iterator. (Zhi)
- Made the VF information builder an associated function of
  GspSetSystemInfo. (Danilo [4])
- Removed the unrelated GpuacctPerfmonUtilSamples registration. (Zhi)
- Rebased onto the latest drm-rust-next. (Zhi)

[1] https://lore.kernel.org/nova-gpu/20260709150206.1046839-1-zhiw@nvidia.com/
[2] https://lore.kernel.org/nova-gpu/20260730181404.776028-1-zhiw@nvidia.com/
[3] https://lore.kernel.org/rust-for-linux/20260804161612.776752-1-zhiw@nvidia.com/
[4] https://lore.kernel.org/nova-gpu/DKC83N1YHAGM.3BRAAMYUVIL4Y@kernel.org/

Zhi Wang (1):
  gpu: nova-core: populate GSP_VF_INFO when vGPU is enabled

 drivers/gpu/nova-core/gsp/boot.rs        |  6 ++--
 drivers/gpu/nova-core/gsp/commands.rs    | 15 ++++++++--
 drivers/gpu/nova-core/gsp/fw/commands.rs | 37 +++++++++++++++++++++++-
 3 files changed, 52 insertions(+), 6 deletions(-)


base-commit: 44e7e7f7cffb10a93bb88e7cb59b7b8b3e2deb1c
prerequisite-patch-id: 4ff67e7d1ab069e291277346b23a5a195e751cff
-- 
2.53.0
