Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641916;
	b=vdhp1GQUR/S2anCGhgHU1Nan8OENj94EUFFvBAf3oeyDuNEtwbhSclvtvrO9bjwzk+KZ
	 b9mQU9rxMgDMfbELVKbI+z3MuoYGLUscJmMn1rDNMPMyurPQZTVI7tKhXgQ0sJqT7VVrs
	 Yk7P65exDtk/nfLSq2CI5O8tmuRRnhkl9l35fiT5zYohEFbwl2DM1EIU/CijdMaOw7oJT
	 07G39MCWxnT4n3eDXHk8pmQWOSNg3+TP2Cg27RJZFxzN9SpO2kI2vzI9VktgGMpdBZbLh
	 STrCwjhPul9EJHTYEXvaCm8qzapF5pnzbFpmL+ZeGYaZDESFgMmLEGzlsubaKaifmdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641916;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EN0SYwc49vlNWbWIcTsIHn3kD11ky4poTBBHVZqXVQs=;
	b=QeHIDUGBHpXntImBd36swXTnzbySNVdkKDMwvGBaP610UfwvWvgyW/9jKw7aq4SRQHQT
	 TXwC9rOmdJE3ycDyaZvRLp+l2yx9+DQ5cXlwMSdY3FPpmwuupWjL7Mten0PGQIoTf9b9X
	 EVuqU8fyJ3AvsaubFfhsp1eBzSuzR2aEKd/XLrXzek9J4eMSUm2fZ2Sm2wF4OG9pMr0Y8
	 fLs5NOcylgW+9DbXg9SVsdBa8HXfov9P4uMLysRYXJHaUkIbcEp9Z9cciyKKN6odFHdpu
	 buEVbjXTNl4mT8cD6Z+Uv6B5FB7dMHdGJn2L8SLd5mvSa0ydB19TbB99GTt3J63rMmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qtKhYNUJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.37
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010037.outbound.protection.outlook.com [52.101.61.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60006606A31E
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 21:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60006606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qtKhYNUJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHFnkIVCpLQKMeA1ClbTQ5Yb2s3ated11NeQdu25d2XREnGeC3SWeF3szzfAKijHJL4rnrOb7gKjO8m/8wGtZLFIW1ZVqqVjLlue38KRGAmsbTo83B+Qd9HmleB8wJnksJyXqn4ItJFl2Owf6kOcTaNGlR21C+C7Qim/Tc5hvHcL/LZcdA4ZCv5jawS+sKzeIFxRGMXRpts1C4aiRCBXthkYUCX46I0s2KbX2xtNupMWiPj0yMHkNHL0u9q3MOQvExaMTCTU8BTr23+28ddlLhucek76Wj6gYMTGAFMJPrIRcTV+tIn/6kfOjjOOz3Xc0f0JI0R1ge/pMpgZUg9++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EN0SYwc49vlNWbWIcTsIHn3kD11ky4poTBBHVZqXVQs=;
 b=sy/OIG4tOT6F5bCs1IrrVx8tGNx3MH6et5KNkKE1tJoX8vaPFIfMEZ3KQqFVaiGXbO3Ns3qOgLRHTaxkEqXZRKndCJXEDo1k0PFL22rn8Z7SXZGBc4AbhUW6cC4diYqgIdjfUzDQb9LGVMd6CknpCeYektdQ2g99EOeDlRxr9R76VAr/ibF7BEJuhtD+Esncr3FOuEmJ/ZnMbMF6BTODIDq++/dfhwXGUkVgzmuWTGXHQ/UHUpWoYm2c6zTAmG1AKLl9QqCd1CIEzTpKAHONYcTQwNUibuewsWLON2L9qvPu+0wb9YrglG0gBvKtU8hK7W6UwcrOkcp7L/U6JWZ24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EN0SYwc49vlNWbWIcTsIHn3kD11ky4poTBBHVZqXVQs=;
 b=qtKhYNUJePd7rUCUxm2GOPlNgzgYJM4kB01GBtBIe1iJ5I7UmEEo4J5//4edZSzgMQU6cGNLKRKoj/YZMVlPiV8OtdNZ+8qmq/AIb9jvaw8oNjSumjS/aoV/dtsDHPMCUDX1fmUtHrhkuE2jIBhqqDliCV0sYcQPUb2QSUGxHpA/vBKxm86Is/21oKUvaUQYwjmv5Pf7HzL5obrBGuVE5olWz0dfNFqxDkyVdWBGq8PcI5rMTXKCtMewxPlkXnSVtk88AK+PeJR3xXRZtImWCaVFmGKW09oezqqQ8knrXsuAO5THx/rY54G1hfT8mnXDnQ1RSUU2iUp2s7OdNF7YBA==
Received: from SJ0PR13CA0100.namprd13.prod.outlook.com (2603:10b6:a03:2c5::15)
 by IA5PR12MB999324.namprd12.prod.outlook.com (2603:10b6:208:609::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 21:25:11 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::af) by SJ0PR13CA0100.outlook.office365.com
 (2603:10b6:a03:2c5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.4 via Frontend Transport; Wed, 25
 Nov 2026 21:25:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 21:25:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:24:59 -0800
Received: from ubuntu (10.126.230.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:24:58 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nova-gpu@lists.linux.dev>
Subject: [PATCH v4 0/7] Transition nova-core to use TLV variables for heap sizes
Date: Wed, 25 Nov 2026 15:24:38 -0600
Message-ID: <20261125212445.620391-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|IA5PR12MB999324:EE_
X-MS-Office365-Filtering-Correlation-Id: 015f5aa3-7fd5-4ac1-59b2-08df4b3a966b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|56012099006|11063799006|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	8IW09ytpjjTpjb6mGCJ6spPD3msV6kBvvzFv26H2ClPqh7ncspB76KkE13G4G9nCfU5I+Gwj4CxHSWH3Xuv1Is4g8CG24zT57YTw5vktQYEHBaKCplwTfCiUi+1pP4+tKh6rq7BampUBjH6z4jdRf7voNwL083C/SmLGEYsitS9kRG1Rx0JVMvK1tM5VdSsYSCWVpkZ9aTkq1JiV/cvUmRoDtUsSDnObEMpx48cSsXCkdsTN2pIdXlt5ziLB7bAfDgNeGPI20UsEzvA8UAzGvonEIO/XgnacS13hvhms5aYgMjyckoTPraib94/g9nApAcHAtAeRRQ4ITBKY4elUPbjrxjQg/pLOhkQbtLsZlVUofiBLNuU5RvZqLDZ8apBMVTRZrRYw6fukNMFH92JSaicxykn96T6vsCtGndPRlax9QlkpGl1RR9C5k0WRKzTBxWbLcSLF1vKBotSbK7cIfY+jpQNljGJCKTdX4BYvT0ab8Yx+GHrmqvzLFyM0Lv3n2INttey8uIb0Wd1WeIR/W38J2qzGONmibNs5xG7hoqpyWWkbXf2Rrq6VievX+e6EdWStjBDwVZbxX3uc1TElxS2r6V50bsVeFZGpbs6PDrvhkmldE7DlRYbVuL/WDgP5MzQ21ZKCl8Bvp02GR7st4+7aCpi8B5NFHO8Plw0/LjYqkqCZaLkuNG5Jgwl/ZU6M0f4nG1bmQC1D1NrR160UaQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9YVKLlHu0cA6OM8z9y+lut0wkqTyf3RW/mkEYnb7UNwRW/cz012GeWirHii7lBWRcUEhDr/YpomWdMO6asJumaW/7hz0kGMLSPvaLSx2eljuQfc5++sUOOf1goxR2BomjPRmUJ486GusS6hhro/ywxWXOVqbqqpDzJFx/KqM+W+7Ow0YyhEjjBNvYOvho4cK2vWKoSsjYwzt2FTpPruZRHk0vG2kRKiHXuXFDESHKO/KEa11QTHsMvCKqcLNuz5YjXKKospBmJnATd9/LBacBHlsFKctcKonB9bxQM4pgneZMsdvH2CAXbXZooqbNycOmF1tPlDfbJDivIOyRWba8MwCy06Wa6DUDXES9xG2fSRykMjkmgxV3OOcWmpZsjPtD9vc0EbDJ/11GvuvDff0LwptdQSRTqGwtimBCopCk28KiXjbsyuFYJRkLmK2sHd8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 21:25:11.3329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 015f5aa3-7fd5-4ac1-59b2-08df4b3a966b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999324

Starting with r615, the GSP-RM firmware TLVs (i.e. gsp.tlv) contain an
an additional six variables that that should be used to calculate the
various heap sizes that GSP-RM needs in order to boot.

These values are specific to each GPU and RM version, and are obtained
by scraping them from the OpenRM source tree.

Note that although this patch set is necessary to support r620 and later,
there are other, unrelated changes necessary to complete that support.

This patch set is based on Alex's r000_rebase_all branch:
https://github.com/Gnurou/linux/tree/r000_rebase_all

v4:
- renamed fields of GspFwHeapParams
- removed stray comment in vgpu_wpr_heap_size
- used checked_add in vgpu_wpr_heap_size

Timur Tabi (7):
  gpu: nova-core: add Tlv.get_u64
  gpu: nova-core: read GSP heap variables from TLV
  gpu: nova-core: use the TLV heap sizes for pmu and non-wpr
  gpu: nova-core: remove heap size related HAL functions
  gpu: nova-core: add TLV versions of WPR heap size functions
  gpu: nova-core: change wpr2_heap_params to use TLV values
  gpu: nova-core: remove LibosParams

 drivers/gpu/nova-core/fb.rs            |  40 +++++---
 drivers/gpu/nova-core/fb/hal.rs        |   6 --
 drivers/gpu/nova-core/fb/hal/ga100.rs  |   8 --
 drivers/gpu/nova-core/fb/hal/ga102.rs  |   8 --
 drivers/gpu/nova-core/fb/hal/gb100.rs  |  41 +-------
 drivers/gpu/nova-core/fb/hal/gb202.rs  |  13 +--
 drivers/gpu/nova-core/fb/hal/gh100.rs  |  12 +--
 drivers/gpu/nova-core/fb/hal/tu102.rs  |  16 ---
 drivers/gpu/nova-core/firmware/gsp.rs  |   8 +-
 drivers/gpu/nova-core/firmware/tlv.rs  |  13 +++
 drivers/gpu/nova-core/gsp.rs           |   4 +-
 drivers/gpu/nova-core/gsp/fw.rs        | 130 ++++++++-----------------
 drivers/gpu/nova-core/gsp/hal/gh100.rs |   2 +-
 13 files changed, 93 insertions(+), 208 deletions(-)

-- 
2.56.1

