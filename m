Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858925;
	b=HViBDiP/pzuawsxXghV5RZ0k4lZLFlcRobo3GqzPafPomqbOrZpSeWHLEb422NK1aGml
	 DuDTKcxlVUV/w32gj3fDqAXrvt5WUX5yRspp3j1Hvmd/thvN79SRk2nl1Kej4yB/LOK34
	 Er0r1KfjPMoJKHNA5sT0mp1tqhmkEzwhQaYc6YJKNCaPY/oVTfwuIt1ktgauDsuk9SCrK
	 ifn5kr8/1/Df5ZRkpcrXY+9Ej9DmN3D0PoaQxrvsNbWj5GYYZcYUqgDZVox3IsaHU+fA9
	 ChtuQKTBTDFC+Bjm6zIp9IrvPAk/BuV74i7FEPoukRHg0H1lin2nMSw2aebG9YfAuzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858925;
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
	bh=e4TL6n6flrEZRVtGhq78gNqevub5PP4gaX+dR89LYWo=;
	b=HGAWcSxgl5GAyt/OL/oAmhkPpBMvJl/QrgdnR9uetx5fEcgt6wbXhdmg8LFIIei6/kvq
	 zy0yQbUnXIT/cfuf8G3CUrvLqoprECFUqVuDlMWOa3BzuMIfn8sFDnOIIPU6bUGtAO5BC
	 WZpWl83JNT99Z1Guv/w+fBCKlp1pB8JeUfNpxMN8qT5tbVu5a/MxpGmBmy5nWiL7e0ZVt
	 4lYqnfuC+J++LzL4fHrjbslmzMBTjMuIS4GdzFBGaFwLGAXkNSPM2qj0pwMmK6NAFZoGM
	 OKnj5e4M0XgcvtJBq8ZS+BhyhVN8zyhR8gDTOSe3mSJa3yDe2kTfd+f2aWanHnjtfCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="AZGSm/hp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.61
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7AA606A329
	for <nova-gpu@lists.linux.dev>; Mon, 16 Nov 2026 19:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A7AA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AZGSm/hp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnBWwWqxGb9TOf7mkuXUoApMzW9GH9C0OgaVsTkhZcSevYHA6LFc+bUAPIdhewXBC2HSmIiUF2OHzUUOz3tSCsPfJvdw6LGWKyT0PNTc+CL7Bj/cmaAVDd9R1NbMZjlPgIN75onurO8M1aHp1/gxq9U84UV8Vxpfm0o8is3gaQx/K0cUndKEMvNQYmaep2eymjihSEANj+A6a4SSAIWXK2ZNDqlALuW0p+X5v8nX7PBnH687I/KdhUv7jpQMXNnI59dLceviOOpT78u4fVhpnd4fBPPd/W+C/BJeJszVqEvnQMTugYjt4kwxYNuQq0nsB7DO7YH6+6hXavO6GvDlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4TL6n6flrEZRVtGhq78gNqevub5PP4gaX+dR89LYWo=;
 b=Pw/yBwcHy3W+aZRrNZrOUQjrhbpHROxaWJ9YPz9mZenSmnnDH4ctwFizXU3ABqJz0/TJb704THvhXrosexARf1tuWskMr0z8iPcqZlt7ZxKu+D2jEyySoajgTvI2p8a1Y4AjowCrTcMfJ7mHyUz53GIE0kqIRyjcmMI2SrdzpfqjwBucIeksjmC7l9MboauRNJbuLsQbAmxNkK7hnyHzDuumsvnAWK/HvWRbFp4cwjXLi0xcxSHR4p3W/qPCfgPhRqeTTylsMet3Z/XGfCCgJEZ4mbB6ZKx6DLX5/RyXbp4F978QmyC9POxLoIjh+HT5XfXm1F30EeS0XsrxNrjjOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4TL6n6flrEZRVtGhq78gNqevub5PP4gaX+dR89LYWo=;
 b=AZGSm/hp6yZriBgBy5te4Lx/fo3/sVCD0PeYWUA0jpEVSLdh+WPjNzWKhRgjUXheISgQZKNnvgQ8Q84Tlp5XUO7qrcrTEYuW6iKcKoz9V1nf+k8lqavPq8xGDUk/xb8HTqoN313ElyvllwMshf6a9xIN5HOImt4WveOQkjJbTMRyQo+H/8lUWCkqNo3xAqJcM5rsDELd16aeDedsk29LcU02fBXeEIvaUYzBHBul/eQLUh0c55tavjsosCOgw1c6BA844BfFx1bIbDMWaIv5TIpzB37J4+y/VP3CROiQzQPeQdrc0hOZyGJqmaQIs6cXhb4084My8p+x3pGmaX/epg==
Received: from BL1PR13CA0430.namprd13.prod.outlook.com (2603:10b6:208:2c3::15)
 by SACPR12MB048696.namprd12.prod.outlook.com (2603:10b6:806:542::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 19:55:19 +0000
Received: from BN3PEPF00022BC6.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::2a) by BL1PR13CA0430.outlook.office365.com
 (2603:10b6:208:2c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Mon, 16
 Nov 2026 19:55:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BC6.mail.protection.outlook.com (10.167.248.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 19:55:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:49 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:48 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v2 0/7] Transition nova-core to use TLV variables for heap sizes
Date: Mon, 16 Nov 2026 13:54:34 -0600
Message-ID: <20261116195441.940595-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC6:EE_|SACPR12MB048696:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ef75c7-4de5-40e8-6bf2-08df441b8aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	jCM0Y+CdgSuBFaoNhnIbzE0vnAW2MfmvV0EZFVkH8pWhqPlunx8AOICTOc94vVDwa4u6GXWjAwWSZgOl9T9YNDRQClQ3cOw3QdWB/0x0skBdlT+IOvZVo/wnoMBN26D1mIto1fe1adiXlaKmdWN8v0H9yca4mhQT1mbkt0UzXf9ttNrUtAeJQ0hOoQqMgtcKVppDjrKIVx3lPO19jKsZ48EBktbEEM26+s8o8ikyz32jPY/AKunKzd/yVNvKgL1nFkWp2fAbMZkxiPIMKO3Svuo70wD0muInYa81uXgtf0rPiWjrzalwLoW04TJ0Grg9+WRe70aSuXd8wg1vm+XV+ujMR8RrsTacfcHHMEoy1F2l+jACB4i2hSHwUsJ/PI1LFbci6/1Ai9zIEQ8ztT/Rf5IGUlnc6Rlmc9t61E1b5nf3coDmKvb56ZRxW3TCo+JsUDP88+kdvxo5t/2heTdNyv2PFIqdrKi56uhRAuBGfv7NHVjKPZmXHmNFuiEA71gJKl9BKRNyGzxuSuelMKmTBHnCQSi4BTSDZUXpgkJzzt8BnyvdL7s7yfwUTkqbIoLz7hINZfh71WHvl/n2Sayg/qvkZwajP300JcpciQWAkNe4dltPTpmhZwWBMliwk5AoPAVMebQ+tBZ4W7QiPxqa868D5MARnCoPa+HfL58d3fggdfEADklhJiDly5FRCWYpQSz6J+dxgMLJMQndAf8P+g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FY5g9bl2PKqzGrxEbNRx7/hBlPdBQqKWOhSmgwr9Zvrcrfzg3F+DegUGURCN1EAHvaVhz27RbAR3pDDdnD/7X6729/gV9uv46pFnLGYyhsZ3qjdg6Qou39ZK0twtG0bnwjUSLBrbQ6TFarY2afFoZ0R1msSHBIYlIGOH14h3V2On0cweluoFQexqdLd34UEGEloy5NSTEQjm4aSEaDWpGHzfrqG1jS/v1cwFLA8acQl0SbV6HPMluSFAPJesVzpGIdl5NDcmfFa1/t3y4ZN4DqM2b8d2LgMc+dOy55pCxfISVFNCEO3WqrRHVOYTsNtCeYag6HC2CV5+eo3jyUA8cuB4RNXJroCGSoMCgnus8635g0heCzx9IEnzc9FoSOpeZE7qxxM8//dlGm8Xp9vxorjj80eZaOENsuuKQpURfyVwzyVOrsiWbejxirjJnlFa
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:55:18.9820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ef75c7-4de5-40e8-6bf2-08df441b8aa8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SACPR12MB048696

Starting with r615, the GSP-RM firmware TLVs (i.e. gsp.tlv) contain an
an additional six variables that that should be used to calculate the
various heap sizes that GSP-RM needs in order to boot.

These values are specific to each GPU and RM version, and are obtained
by scraping them from the OpenRM source tree.

Note that although this patch set is necessary to support r620 and later,
there are other, unrelated changes necessary to complete that support.

This patch set is based on Alex's r000_rebase_all branch:
https://github.com/Gnurou/linux/tree/r000_rebase_all

v2:
- broke down patchset into smaller chunks, without merging LibosParams
into GspFwHeapParams first.  Instead, we just augment GspFwHeapParams
in pieces, and then delete LibosParams at the end.
- Changed get_u64 to use try_from

Timur Tabi (7):
  gpu: nova-core: add Tlv.get_u64
  gpu: nova-core: read GSP heap variables from TLV
  gpu: nova-core: use the TLV heap sizes for pmu and non-wpr
  gpu: nova-core: remove heap size related HAL functions
  gpu: nova-core: add TLV versions of WPR heap size functions
  gpu: nova-core: change wpr2_heap_params to use TLV values
  gpu: nova-core: remove LibosParams

 drivers/gpu/nova-core/fb.rs            |  34 ++++---
 drivers/gpu/nova-core/fb/hal.rs        |   6 --
 drivers/gpu/nova-core/fb/hal/ga100.rs  |   8 --
 drivers/gpu/nova-core/fb/hal/ga102.rs  |   8 --
 drivers/gpu/nova-core/fb/hal/gb100.rs  |  41 +-------
 drivers/gpu/nova-core/fb/hal/gb202.rs  |  13 +--
 drivers/gpu/nova-core/fb/hal/gh100.rs  |  12 +--
 drivers/gpu/nova-core/fb/hal/tu102.rs  |  16 ----
 drivers/gpu/nova-core/firmware/gsp.rs  |   8 +-
 drivers/gpu/nova-core/firmware/tlv.rs  |  13 +++
 drivers/gpu/nova-core/gsp.rs           |   4 +-
 drivers/gpu/nova-core/gsp/fw.rs        | 126 ++++++++-----------------
 drivers/gpu/nova-core/gsp/hal/gh100.rs |   2 +-
 13 files changed, 86 insertions(+), 205 deletions(-)

-- 
2.54.0

