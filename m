Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9940377ED9
	for <nova-gpu@lists.linux.dev>; Wed, 26 Aug 2026 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755123; cv=fail; b=G2Ishk8VndMaEdmHD0b6fKy8o4EACH8dExGUncIB05/pGO6NONQUs+D3MbmE7+86SiRMjI/OxVldBv+4Qyb5d3LC0GHvRii9AG2PTcDhBlCpKMZUV7YC88DQJr//46/CHP/tmkI+fSlqwuUmeAHs6YPDM71RJ4in1iLJp+eRfO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755123; c=relaxed/simple;
	bh=w5GG11LhJ2aASPwyn5WmfTA9VeAKcbH0LcUGHNvRiOk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=darmPXzkcmT9UqaMTRpVgr4Kfq3CZGa22U+b94B9HZRFveYStSbDnCB/qvciIxGXgAnkAA+t4Z/7eW1xR0rnJvX00quaMn3GTHiBTp6zoXBv8TbIP5/RdIzmdf37pBTgfLZtgm0TAfib+peUUPRnHLvMsH8ucNoS9cVync4MLpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hl/VKF/f; arc=fail smtp.client-ip=40.93.195.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hl/VKF/f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+4ep4SsDWYpQtvlHPhhxm8KZ/zS+HXt4ZZzIvoJo0sFtgxL+zZUw2fcSuWlm8L5XUUq1WNvtolDX/2BS4F0d/ukqFcp5TqvPs5LJ7Hs8CFDDKaQyGu207f2EL6KbFBUy0ijU24ue5tL8FySfNSVraT9pjIW/g4yS4IFWf55uQSf050qjV9VbWyLPfQlBS4GWCcc3kbG6TDZIty52gI49RgTscSnGsQ/FeStlGA2ItDx9YK2akmVxVnqeNC+Mk2K0cOBR5FkP9LZq+eiLxz0yUnFWjvJ4ol4xAYvUKuzSbnL7V1VfUxroM10dg9ueBjb1CzAPCMNK9i2cz2xRWNJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJVPO/jD/Tpc6+RNmXBhFXm1zcItGmnAd3DpSP5bmGw=;
 b=KGfIFz0Mse7uZrr/yUEvqyeI4KTN1UGc+53lY8I5QziT3Mq/UU1zUzUrN3kXb1scfPF8bN2etpnQZIDPaR7MsNkU32wLdFBHCqdTSkrFxDsnVX9mqrDZHKUsEblwULkDKImBFBubU0LcVmw+LRs/qIJFqUoPd/K2x8ZxFVOOp5Szw7JnoKu3PR3ajeJB4TutKjqCGKQ0wl5IlffeK3Z+U4TUdqlu4TV5+Wnyx5XsFam4r+YjCPEDG29Z7KNkeF9Sw092X2N9fcDz8kLLmI0wz3qdMp0gEloJgegBXu4LjiRiAuU0ZQDqtLWDkshmAHKXZ+WrcS/ooLgbfYlWbP6oFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJVPO/jD/Tpc6+RNmXBhFXm1zcItGmnAd3DpSP5bmGw=;
 b=hl/VKF/f+uTO1xFujLiviBrTtCaVu37t8Oy2lx7AY6rld3NOWvl7YvVxs8enVfd5xwCqbSUF3AtsNScbWrYW/gnatVblRhs4gCkf/Ncr2nywHJwrM4VVuKULEZFfZIG6RrCqSei5b/1oRe/a/42w++rlOpTb33FO0ET/2E0DYxrSHkvVxGCQ/pKmrgPbiajESg9B13/HNV9gUCqWGntHbUL2CBXHd2jrP3KcwdSoKVQ8v8S+9DiTOjIH2+gPlWVW5gjF4ML/XfhLxMX36hmHYlmQgKbGDKq+QFDVrMLNiTaWqkY9NzjIDzTz/lDqx3lXiFlTqKAfl2kVxtdtTX1K0w==
Received: from SJ0PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:2c0::34)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 14:38:28 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::7a) by SJ0PR13CA0029.outlook.office365.com
 (2603:10b6:a03:2c0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Wed, 26
 Aug 2026 14:38:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 14:38:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 26 Aug
 2026 07:37:58 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 26 Aug
 2026 07:37:57 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Wed, 26
 Aug 2026 07:37:49 -0700
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
Subject: [PATCH 0/1] gpu: nova-core: correct FSP documentation
Date: Wed, 26 Aug 2026 17:37:45 +0300
Message-ID: <cover.1787754628.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|DM4PR12MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6fc733-135d-4140-0893-08df037fb13f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|23010399003|82310400026|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	1MtE0aNhvGErI2lvj1lCEc1rX4hG+w6mr58BRumpfMVA1IvGXOLx6gU42e+RlKDyueKeyk1ND2QdSL5GjqALw9Xs8G7cC3XQQoB3knMftysm9wAbRFfv4bVFaDkIOUkl3hZNVw1s2osju2ubT6c9kXmeYRl5c63prPqf1lOjkQKeqQCAnMvXiiqkEVC3iOJqpNuauop79bMPpOR5cWtVCqPAPfnhHK8GjuetiFBa6psr9E+lvI/31hUzE8e+DvrcJ2BpPTZlcBtuUnHMRp7AHpfDNiPf6PxGrYv1rEY263k9OagPR4ZoGgnvnCQOSUUSVP2jCHt+2CLTFJ0qGS6tnQOsP+TG1QE/mW0KxdBQhjaUDanuMDFtMMmV7NmodnebLlbgnqqHoMj74bKfmB85wc4ru5sVT0lZlkf1KRJhdWQUIENZjRt/GM9fdIutVUfcsw8jORuT0PF1kqlIf1Ij6OM/k0wHgqbBu0GVC6QatlVQRRamJF0vCVKK+E57UAVcpWYhDL/1d8YqJv4KeC0Ym3wPYzVajP3D2syWTQ4onpItUzm448hJPIlfCcYn0JytWJW2VI5M7MWpajIp3NscXUS7znHT501LIR2GC2wGHz7YSAZDagjGHvh/KqxbqKhXUi9ztpExw3wyME9Uu0RPP6uSVS+LYV/aD8ZNhLqhoGHuVgjAogmaRp3nKMzK0vHztKyvv5jKAriX5cQckGKnog==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jTHhmM/KCK+wjq1fmMZsBpJMNjHuCoGhGtcjo2xuen1p19l04aWwAhGghaH0DgjrofKw5eMNq3ExnbNn/X4KUWNuO4vt07T1wT5WtmayJ/CD5bRL4jWA0eoSxOwZJpxzh+0pN1KfF2aVVvK2Qhbw0jwWmnlqHAsS5RUaGa/QJAPgFRTSWyhLUB+PJibqavIr7y4ULpOsJdpvGEqvAZZ3a+rWGioL0j160cw5WC4QfNoYlx3iGNZMi20rh4HL9kBs6W3oluxY4XxNHLIoSJzDpCnJ5R0KGnzFivaGQFNijfutLDGWTuckb50BjxjwCimcntNaXUR1ewzKjXnl6404Pt0WpoJmzYR6WsYavz2GJpuFzZdogZT0t9aLwgwo/14aVFjbaLcVDfy2hweQe8UHUuVJ474JkMJTA0fy2Gi6gKJwPXr8yUMBUZlP69ZPS3bC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 14:38:27.8077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6fc733-135d-4140-0893-08df037fb13f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063

This patch applies on top of Alexandre Courbot's GSP-FMC
naming/framing fix [1].

Alexandre's patch corrects the code naming and the FMC expansion. This
follow-up addresses the related documentation:

- Distinguish the roles of FSP, GSP BootROM, and GSP-FMC;
- Correct the NVDM, FRTS, and TLV terminology;
- Clarify the scope of the documented dGPU boot path and the meaning of
the COT response.

[1] https://patch.msgid.link/20260825-gsp-fmc-rename-v1-1-f82526f01d7d@nvidia.com

Zhi Wang (1):
  gpu: nova-core: correct FSP documentation

 Documentation/gpu/nova/core/fsp.rst | 88 ++++++++++++++++-------------
 1 file changed, 50 insertions(+), 38 deletions(-)


base-commit: d53bc149eea6213e9c4a4604df5521db7b7296ca
prerequisite-patch-id: 4ddf00f5b06d988e9c76850efe437933bd139e4c
-- 
2.53.0
