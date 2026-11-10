Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794352391;
	b=DZGSN44roIMn2kzGmaH1Kjo8FE+yWKfIo16PjnA/a3XBdZ+knV5zisCx2g7jFIRHMa8s
	 nG2ATy/8UAgy5E+30ZkMFBWqZ/CnVQspRT5yUtIgzaZIdK3gZTv4EryCVVh2d4q+40wZ/
	 g73Q5vaN4vBSWDzDqQJJAV6OKwBW9d6FYe6XWGWAI5Qb1P7kXUEdCR2Ee4htSHuDPtTbI
	 3AI9Pz0ZDT1A3Q5VYU0JcByqPZ1HApRR5r/GtVyP95t56GqLBj294WS2UqAD9jYJzyPe/
	 A6cojCJE2xFNmntVMi/ZN+bbdy2B+FxzmJD3sG/6rnki6ryeVKjOIWhMLUUTuEHSPAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352391;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 X-NVConfidentiality:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=M4EjJWfbj0llLcppoxzEBmaW4FEXdz6f5A63RJDq0S4=;
	b=sVNK0tJ2imY/GlK9iBdBvH41nzPf/sG7z7FoyuNqlxgd6wYAS4r7uZvW1eTsmTRPKOC0
	 89Q58dRFaVss84jUh/leSWtHPeCBtIwz1tWLMzUXGqmXmlYqnd1lJJJMqweDYa10zVyt6
	 SiH3iZuADUq1wL6v3jeZfvdd17Y2mouCBBty7NTQ/Z/HYzztAEgWeqXt1TbAHfsKS+iZi
	 du0oVX5bD3o7T+FeCHp7oZpBCdifXsTc8C20Qa+0U+0seoZs+d9IrfL0vDckQHLQGTY9C
	 J0P4xyAVrmUajhlldscFjcGOItFS3eAKf2wbbZqcQV3wd2rhzKrcbHTDE+uujvqzbiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lNwgr27f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.27
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012027.outbound.protection.outlook.com [52.101.53.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739D8606A31C
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 23:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 739D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lNwgr27f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mE2UWFltDzztO6dmkz25MTuMNprvXcyOt6hk3Ky2ifG3P+AsyBfklXFxCI7WfTdjjpQyD+uKbxBe76nmmRW+IEjtA2VCLG/8Huohwx1QQfFQ13TQf4nei4F5iyAQXo2kBL9xSZ3Zy4vl3ygi8BDtv/4xefEqbJ1IWov/NyNW6d//9/ZzF7SFZKGrK7VpA2hzumLwsxyuL4BKqPEjuZMBDtEbDkuREM1bXv+SOEoQGj+cbG3hCL8Gfbx7vLdc53mGixIi+ufzEOPiVljM2zos3JvxVeF2JpIndJq+mOLIWDMYJ3KKh7bgKihOR4Hr6vD+/uq/1jsZsvS9RCYxupakwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4EjJWfbj0llLcppoxzEBmaW4FEXdz6f5A63RJDq0S4=;
 b=yd+qV2ZmhKb69XuEknzGgymBejNQDb0WSIZlzVzYyNaXIc6O4CuLLBLnxxUKPUToow6GcY962o6YFwP59x6uM4xAdzqxth4bocBEqj5F8yAR1im8o+vzNofCnD7/C9HgA3qHmRLUVTiOq2kct9MP8WqryLUB13xL130bC5DZe/S42syAvzil6rPmQLFkDbaEnJOKzvVtfh8bHWO8BKqYADoBjbXOausgxawT8UE1nk+qaMfqkyufQhfMzc9br6ql1HSSTXBWuNv+1krleQZLM1fMXplP3d0dnvSw85aS3Wqil9ogow4CHKkbK1J88DYSLAkn+a3mSMjJBYbLKUi7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4EjJWfbj0llLcppoxzEBmaW4FEXdz6f5A63RJDq0S4=;
 b=lNwgr27fvNy8OIKBtfuSNdWc5hWo7M8UF25tOCG0QOHe5FjMdn010fpWzlxXRuJ1KMo59WTaPS3VkZMbdeYQvuplp5L8z+3aEnesOON/26GHpebk49TnNJ5OEMRHq3O/hNEQM5gXMmVQvbkRAXwpHHR/N7+3Y/8c6pbp4DnLyT01PnSqCXDJcB4v0subNF8TsV8pln2/QtgURenGS3qSKsenUGOn24gr3nxqIht9rnSVrSLnrwamdYGoop6fPr4HOIj+5rsTHqLoVeqqXgfPixJXrE7VD5QAZkMRAKtAqTxUBMraUVf/vHMGrmW8Rl/rex48/ofVNimoj3DD3Vxd/w==
Received: from CYZPR05CA0025.namprd05.prod.outlook.com (2603:10b6:930:a3::26)
 by SN7PR12MB6671.namprd12.prod.outlook.com (2603:10b6:806:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 23:11:32 +0000
Received: from PH2PEPF00048919.namprd05.prod.outlook.com
 (2603:10b6:930:a3:cafe::60) by CYZPR05CA0025.outlook.office365.com
 (2603:10b6:930:a3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 23:11:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 PH2PEPF00048919.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 23:11:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:03 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:02 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH 0/5] Transition nova-core to use TLV variables for heap sizes
Date: Tue, 10 Nov 2026 17:10:48 -0600
Message-ID: <20261110231053.1352163-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048919:EE_|SN7PR12MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: c31561f3-e5d7-4d58-82b7-08df3f7ff200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|18002099003|6133799003|11063799006|56012099006|261028144727099003|261009223027099003|261026140227099003|261102123227099003|261021121427099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	pF4lRDNrDy6d2yxadpOawSnIZPiReZ+1a6Etsw430bOkq03QHTRl0kHk/bFo/mpYKIfHZiVjPmMOn08OjNpYs9FoOb8kP+UX/5rRilv7AX3S2KkxZcuo1jx0AlyGYBJ+4OT91dBRw0554qhw/iqVC5HGK6UmmaVjC5HMtHjEIGJ2KexeZZ8Ew2wAtsd4HPnY3ih97V/AOO7eqAAZBFZP2m4b25ryMD7dp3mFjFCB7shOoD4pW35aP1IslYqbI6jDhwCFNUCI99AJQLQJd+IS0+CEFpLNX3rn1MakpraNdmVjQok2L3QniNwp+HbNiFVhlhnJqXiCBIXIkGdrKCcZQWJ/4mDbf1dA6n6bcZsI8+6mN3IT52az3MwEJB9dhAYqlxxZLzVFx5BTggJAu70nXBQomgcjZY2YxcgbGDqS+Gb3dtWzjr9BGxLoBQfJf+V84E5+t+tmsxy6MsXITyBWJ/U1YR36ZXwTauFcyA8BQCCuhhxWtTtW8VaWbgTH8LSs0498ASr87c1WDNnmm3debeSWl+IrBMvcNHOyAHHlRMfdwe+lRsABzswM/84nZAU7aAZaS3IG/udLUyI+9m3bj+x5JyLgaQpbkVLZwXW33vokjmK2hOnmvJ8TNDB4UsfrviAwvmK4pPCfoW4gvQWFf0xzWL7KYIOXEqHv4TE1xts7R6wohL0xrPJJBYRJZl3ALTZekmBcJn6gZYXnIxFQ0g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(6133799003)(11063799006)(56012099006)(261028144727099003)(261009223027099003)(261026140227099003)(261102123227099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nWMCyQRa+2YfAjkXTBbsS+yRZmqQn4rKEXjCTRpZw6n06NNS2Q0Z/KM438gM3y4CUds0QSUMtOhJYa9AC4PCnxmO/We9kcLvPYupAIdWr9kY4SpsEobRlmbgCnVHt+z/xOqTcW7Yvk2HsWnw7c3liR23udWO4531L0FvZUDxkCvpAqWpq+QmFsbPIni9EmUpqtghs0QXrix/CHTcZbyGSwZtgw1wImVbM0n+gn5idal/6katPEln8sbH8MhzwOue4v1OHZF2dPmxRc909Mg/HEuqlCkhdKWtmdtHHBbYUwVwIZbrASWFKfO4nsLNdaHxpBfeCRYJVKM3B76k5zoFkuRhPNRU8bWNaWZ0HjW3dFqUl/I4+jdL4TAR3vn1yH/oqjai8GJRHHt76NOegob4OyN9SWR3CrbLcfqAIpTKI1a6jCgTnAAqtPoy619lAoUS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 23:11:26.2526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c31561f3-e5d7-4d58-82b7-08df3f7ff200
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048919.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6671

Starting with r615, the GSP-RM firmware TLVs (i.e. gsp.tlv) contain an
an additional six variables that that should be used to calculate the
various heap sizes that GSP-RM needs in order to boot.

These values are specific to each GPU and RM version, and are obtained
by scraping them from the OpenRM source tree.

Timur Tabi (5):
  gpu: nova-core: add Tlv.get_u64
  gpu: nova-core: merge LibosParams into GspFwHeapParams
  gpu: nova-core: read GSP heap variables from TLV
  gpu: nova-core: use the TLV heap sizes
  gpu: nova-core: remove heap size related HAL functions

 drivers/gpu/nova-core/fb.rs            |  34 ++++---
 drivers/gpu/nova-core/fb/hal.rs        |   6 --
 drivers/gpu/nova-core/fb/hal/ga100.rs  |   8 --
 drivers/gpu/nova-core/fb/hal/ga102.rs  |   8 --
 drivers/gpu/nova-core/fb/hal/gb100.rs  |  41 +-------
 drivers/gpu/nova-core/fb/hal/gb202.rs  |  13 +--
 drivers/gpu/nova-core/fb/hal/gh100.rs  |  12 +--
 drivers/gpu/nova-core/fb/hal/tu102.rs  |  16 ----
 drivers/gpu/nova-core/firmware/gsp.rs  |   7 +-
 drivers/gpu/nova-core/firmware/tlv.rs  |  16 ++++
 drivers/gpu/nova-core/gsp.rs           |   4 +-
 drivers/gpu/nova-core/gsp/fw.rs        | 128 ++++++++-----------------
 drivers/gpu/nova-core/gsp/hal/gh100.rs |   2 +-
 13 files changed, 90 insertions(+), 205 deletions(-)


base-commit: 1063d1e9709a4d803936d13292a046eb11a3416d
-- 
2.54.0

