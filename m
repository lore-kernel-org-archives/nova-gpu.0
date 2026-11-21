Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795221088;
	b=nlmlDag3ZTtYsa+rH8mpKQSmRcZ4cVmz6B/PM6t+Q0vKPiNRpvLlC32LC01DAPB1Sr7m
	 RLiux7imZ5DXzgXS8t8P745x4V0W8NUdK/TMYvLiNQkPhlapoz5LNgvW8ZtJzF2KB8jM7
	 lZT88rI44m5EV3BMz07/Y2w36ISucdiRKC78y2pbaNKDia6OriqwIoFfaaNMEjQRzlmGM
	 eaTWkbRKUt2j40vn2qwDLNxUv6msqxyGL/rtQnckC3KDlG+TiadBzSfaWqTil7NZ2lgxT
	 KWs2CBaeHb6zAkjj+tfPxK/c6jQoDlY/qHrFBhACfycJKs7JKdSZGAk9fby4sBMCh5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221088;
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
	bh=b1hd7inZaNPqAQkTmTOfn3ct6oWntTbp1YuhMFHyQqE=;
	b=4j6a07o1AXrb9Pb58ngXKjzqdeuIntf9zr752LNEfB148jEIchpKuNNpqx6BsX7+cw1f
	 rmUB5iWBLDKVScMPMh5nq5ZvhIXcg8jktIfSzaoYS/i4JhT5vW9hJpZc3Z76q1BMtEnJE
	 MNjfuG+ucYLIr2hVHMzXMXqq6eHBCErB6ZRFn3uipLnyClSbUcOhVMyIjRmD139lESi0o
	 va8fh26N1u47oYK2055UOMIx0tvIFnffohMM5xMM29T7c/ad4lNdRBKxd2eG9zSkcJIj3
	 Nurbj14D1hZExoiroF6KNBiLr8FDYsdMkylYS0dIRqgx+0hRFKik0b/2ITjxq9r6QMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZinEmh7I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.68
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011068.outbound.protection.outlook.com [40.93.194.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B294C606A696
	for <nova-gpu@lists.linux.dev>; Sat, 21 Nov 2026 00:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B294C606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZinEmh7I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4uqgZm22kbXgZFt2qJHXgiMbT61iuWwQyS/GgF0AMwufgSX5csbidWHJimCFtkdFFIfHuEeGYwrOeOYON4G+j3fVtCoi9Kh9z0FttakJZ5PVQEYdtJ0zPNSfmaud1hkABAaTNrANe5Jg7/OJD7ZZx8KsHJrekW1vnOlLq9zUfc4Wfd3JHxpAGTEzPHJ0okPOK1t9Ot4UYPrjwXg3AyQ9LGzYWB2qbdIbulMVH9LSWTF1JfZpmci09tjKc2xeJRpQev0fzvchkuYERhr5ygU7IYlxoxdCKTBcB5IFe0LYtgBYX/Okf46hXGFVCZtmjou0Mxdj4zOuvw1bhbQgTAaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1hd7inZaNPqAQkTmTOfn3ct6oWntTbp1YuhMFHyQqE=;
 b=mH9eFxFMjtqoj2X6/Wt6JRR8owKD8xUqrprj9ytd4EesfxvoknRGcuNzfWglTaev2h5kyIQcNkgWu7K4uz9PgOA5WWOHi47rhOU5+OsXjWTjHWNYmci1neqSBKquvPMOKPlmol+LwQ9e/jo2cUHvjiZB+hYvPK/K68yjD/aWS6tmY5OepUL62Fq8RExyFw4CexIkgy/roY8LG1Z4CzFekiB51ERuKlc75V+VksRrXq9SoQ1NCvc6GQcLvNOPHBSWBKKfk6VSglAbdyNvw8f1lTEjGxO2j1UtH1Tmxu3OElaToSbPc+NPIQxOYiCbWp8fZbKlQ6xGtu6qKIKcK+ci0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1hd7inZaNPqAQkTmTOfn3ct6oWntTbp1YuhMFHyQqE=;
 b=ZinEmh7IxH1SPWKf5tFkdIBPhEwvhN97vPPbdg7qcefnhauyUcNVCw7aTAWM1WaghgizURQTb0XSQOQNzhr6pahUjY3Hv/IV8vAezo9JerPOR+jhV0sVpD3MZeCj/iQGT4sGrpaMnqtx5E4g7d9sXjwrPH/6dKa6Am5HNQNEAe3NVZrZN+MqoJNbZWrRit9EhQhHe2pNkoRJvXylFMVFOp5Yr/zoVMB5VNie9l8wY+Ih+pzds0DCgRDT9Strsm2Qw/zOPv4N3eir/EYoMKMNR3CJdMwApang+7Ji8CmbuxVPM4ZNG61R3lyk1pFUoiYOChD2L5xzQYlcjj6MxXFx4g==
Received: from SJ0PR03CA0186.namprd03.prod.outlook.com (2603:10b6:a03:2ef::11)
 by SA1PR12MB9001.namprd12.prod.outlook.com (2603:10b6:806:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 21 Nov
 2026 00:29:18 +0000
Received: from CO1PEPF00018869.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::3d) by SJ0PR03CA0186.outlook.office365.com
 (2603:10b6:a03:2ef::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Sat,
 21 Nov 2026 00:29:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00018869.mail.protection.outlook.com (10.167.249.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 00:29:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:02 -0800
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:01 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v3 0/7] Transition nova-core to use TLV variables for heap sizes
Date: Fri, 20 Nov 2026 18:28:40 -0600
Message-ID: <20261121002847.3358679-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018869:EE_|SA1PR12MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: f60ca4b8-2b05-4b93-ed92-08df47667ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|261009223027099003|6133799003|18002099003|13003099007|261026140227099003|11063799006|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261022105027099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	3LkF5SPL29ZeIPLLhRLlxbUpG3kBmySsJPmu5grCiHbiboCwi88oZZsrO68ZXkJIGCF3gluqRTo5IvJWGa3z0R1zpZ4hrn5A6d377lHBV4UntlYX/TnfCNStXUM8jpRkjX4xod+oOzPA7Hx1L6Aix2PEXwTFFz+YlwCFU7k3FqT67ZH/3bpoMY3/93vTQTp7JBI/H7vXO8L5+jUSc5qRDapimoK2mqUA7kRhAd1qOiuHM9BPkzin3oT1YuIOajZz69xwgdv5NrBTYNRCWFHsfKvkFD8pZALbsMQTWiO8gxM7BXKKk99t4TfLkOc3liCPA4h0nOXs5Vw/eawWgGQoFP9jEiGDRVLrf/cvEhDl8rVPXQHQPJH1X6Zf0exOXqS7WZ/cORUCWRLPMF9v20m5qt1pD1reFo/eojgT5CsdsTbMM+tjt0fBRy1IUXKoY5bZCoaywR/thuaRoy8pgEAu3SNtYduP9+oJ5XS1WueaEKlF9p4cVSOb4BcSID8asmdMBLFnLllj2N6QrXAqgb5HIsKm8tzZAyxZgY9bUtzYnX0HCujW28s8YTYQr2bVhQ2XiMK7Eg6GAfUyH1ii1ZyJ0UZ3xFj4F8ki/YA1sb/16vTNUvQGdEA42fRV1URZUDlHUNS/EOEzyOvaHY2G+J5ibsa7KwJZiUWEWccwpkjVOTmx6vm7x2O6ZU+rxz9biY/8x6BJ1DUjtRmmbVTQrTp1xA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(261009223027099003)(6133799003)(18002099003)(13003099007)(261026140227099003)(11063799006)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hldDPH1saTDWbi6QtnlxNJIJphuczZm8FdRIeitjhluvvvvkX/utO5S89i3POcE1300u3GBgHTVNVe11E2tbSWZtIX2gRG6ha4qIH1XexvwBXasYxWGdaS3gU55mIS0Tr3CyOVJ+/aNkkXK5wuWkJfD91SvYWz2Z1jS96FLfLm7+szgkfUg7yqsbJFz+NMLHhhTsQxEIJOQk5j8l2vmBXFGBiuNDIDUGvsFTMUQW98s3wq8z6nBsC+MSPXTQjHz5IsdC3OQRzK7ajohpmYOCKGBIKaeRSLTJ//ZB5AoYPiN9Lmegq7JR6ytYV8Fx3M/Pca8T7Q/Ea/74y8zgHNWpUnGF6s92t8cZadEeWs4iMKGbt8+F4hucRJ6A69IOrD1Y5qd3iGubKhyNNoFdjZ7qmTPByX/l1wJuj+ZLc8ys2/NHgcZ+r06BbHVu5Du606nZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:29:17.9756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f60ca4b8-2b05-4b93-ed92-08df47667ab5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018869.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9001

Starting with r615, the GSP-RM firmware TLVs (i.e. gsp.tlv) contain an
an additional six variables that that should be used to calculate the
various heap sizes that GSP-RM needs in order to boot.

These values are specific to each GPU and RM version, and are obtained
by scraping them from the OpenRM source tree.

Note that although this patch set is necessary to support r620 and later,
there are other, unrelated changes necessary to complete that support.

This patch set is based on Alex's r000_rebase_all branch:
https://github.com/Gnurou/linux/tree/r000_rebase_all

v3:
- various minor fixes from Elliot's review
- added #[allow(dead_code)] to for rust 1.85 compatibility

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
2.54.0

