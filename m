Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7BC3FA5FE
	for <nova-gpu@lists.linux.dev>; Thu, 30 Jul 2026 18:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435285; cv=fail; b=DenwksI64P+cjRit5PNtYv9ZytseANVGxsc15zxHP+dCT3kC5oHmL4ystG9NvL392YFY1gy70N6I6oRP35kHJiZH7k8vAT6aZ1MWQPIlPhAgxlAp56sS/nCH8i0lTXEj7s42OCJV5QUVjYVnw6FAoONTVtdg5aPx2UOK45FQcIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435285; c=relaxed/simple;
	bh=Vwic4TnCwqq3kKdAp/6w/f3kw19EHAJauQk53lM0bUg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LHyhWeOy6EcGVtsywML29j0qtU1rWZhjSQJgLBYaS2pt/5jiOWyMkAwUxXYVJOa89Mq0GVTdAtAOAOhF53z7x8hxZObe6K7NkE922yh6KZNGnH88yvDbhgYdtL77ZnDf4JaHMK7qvShFQ0bA0YoGc4TN456mir9DDr2f6Qv6ajc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZIgIMps6; arc=fail smtp.client-ip=52.101.56.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZIgIMps6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYUvQT19/Dg1P109F7n4cNM3VDoVWKFuUftRLykltrdoEtrBzzsvgoRLmUCWwN+gCwZf9TWbjlQAPV4ndOWEsuK4YJOt0/jogPEXUyAvk/UtqTMGP4D+WBhdIiETkoVloJs9nx1CLtse5PQW7cibxZpSwApasE5dqnq3lgTjntid/eyuujG7VVfx1iDEFHW/Ucd/QQgqdJWuASgH6qKvByZ6Y8ntpTq3owpQ1G5L8tOoxn1bUsRkpSJ30SU3bhWpR1Cuku6OhAIenXJP3OFSdnIn0I1KDmRbtvU38jRiE533+Bwii2xp7ocQWbMBm7wMwhGhLwcPSQXCC+6ItPhlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVs/FHnItvhvpyjU0M+yWrOLACLS3MQ+yaYa3RTUsjs=;
 b=HSQpCvcv/pMQeNcXzRa/G9PD/k4/9bfWIsSdaOr+98VQoSnNajqyVa3GyMcHZrSPVDIW/ZQF6LTa5+lf4YuI3Osa6NOWZN4HWgU/15q4zRdiTB6RMqTAnYeAIwxwVcee0UlE/0epQMlNC61UrXR3cjdk2UYq6UV43INsyujKMlVMBTbB8pt7g7Q6dLNZ3ZC0ptMZMKhJCYdpK9C5EVZ6u6puMYii9gm1HihYWpJpkiPmXSfwbbLYMaT1xVjxm7MKcL6H98dT3A6HGNS4Pzpo9Ek2YfcoOuGSE2aZpOyLeXi4iuKEpaM+yhKk9lDHIzLLe/VROrpLQoV2A+PJhp0JVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVs/FHnItvhvpyjU0M+yWrOLACLS3MQ+yaYa3RTUsjs=;
 b=ZIgIMps6ClKvrZrU/PZnmjn1f/tfngTPeh91OGl/pV8IofREv0FjDjWR/m6zz++9OORvAbQZAYSCXIJSqSTudy0g99XeunJmPar8wUiukLO8LCgGjf4Hlr2SIku2MUmLteADXOPqQKkEX4fPOk2cKPjw7PSOSdWBR7/PwuIEYfC2YyRgv1bkK4EU+ouXSHRX2Cn7w+D6uPEt9E1+RiJKY4Z2w5X4smACaF2yFGC46e/tlxPXBSLyFwMUW7879t9iQ602a1fbqLq2JI+3mQgu/ULHKTKczbDu/j4EcW+aZjetg716KMCwkQJNk/Qaqxz9HjkQoTUXb6G7AdsGwAeK9Q==
Received: from BL1PR13CA0279.namprd13.prod.outlook.com (2603:10b6:208:2bc::14)
 by SA1PR12MB6947.namprd12.prod.outlook.com (2603:10b6:806:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 18:14:36 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::29) by BL1PR13CA0279.outlook.office365.com
 (2603:10b6:208:2bc::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Thu,
 30 Jul 2026 18:14:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 18:14:36 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 30 Jul
 2026 11:14:16 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Jul
 2026 11:14:16 -0700
Received: from inno-dell.home (10.127.8.14) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 30
 Jul 2026 11:14:07 -0700
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
Subject: [PATCH 0/1] gpu: nova-core: populate GSP_VF_INFO for vGPU
Date: Thu, 30 Jul 2026 21:14:03 +0300
Message-ID: <20260730181404.776028-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SA1PR12MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2ed0e1-d833-4bf7-826d-08deee6669fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|36860700016|1800799024|82310400026|13003099007|10067099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	G1BtwpsFTpIJ0RWRHFJIV/GAweH64yfyPOorhtDn7tWvd5OYmsug3NWCv1aXOYVW99E1zmzuykHBRMcGecuBfJyXFPbLW73BPaawnEeKpqk/w9x3+9dALWtQy0K0V1oEUTdl0U5aeJ0oVjzPYuf7J6XwdmP7qLP1dOWCdKHvzAO4c4t6bXHcfpMfkZ4Pl9GkAVp9f4DtlIbK7GBweiSVXbTHglsQ0rWxFIqcH3k/mfH2Fxr3t/cODddEzsoBY923uwEyMW2EbUpOb4Wg6LezrOUDA9n71u8ikaDQUag7PALbFnq8QtVtxso0zi3EUNT+7AC+1xxl93xyMTb7N+I9juqterpmXzMOtkCtZd0TbopeXFCN45KImLJkGJq165WgQNSW982OyiNBTM+6+z3Uta8Itd8kI15lxHN5C2pcaFciZ/T+ZFxQjCgea/Ya39R8IOGGuAan2iBuDA/haStBl4l0NlSMMADAdtkc30fG6XAKh5hQaewWgxO7tn4j9dZPFP6xly+c2OhVNJkl/r57CmnKmJmW78ZBd3yIOAiSfHCroP8D+pcUXyLF3Mn0k1kJSaJSuDaWYsCNzYavWCxwb08zWjHowHO/ZsjZcW826awWjY2z5XpwG2J4baIAyqh2aDD1YRDpv3dbbw/arUolrySv6e4she3+f1JObalCz9GWh56Gd1nsnO1eP9l5jTgdlENd04aF4XnPGCUUhSNmYg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(36860700016)(1800799024)(82310400026)(13003099007)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oVwkjfYXoT7uCY58eFuC+agGtnn8HGZFRXZGqS3C4wmTAiK1vJjdKPQhGoj3RzWQGp1C6YWqTEMavWsidPuQGv3iRt2xI9+/EzgA8yFDhefiU6EY0QTuWwEHfIgJ7hdHTPRxkjU+fimapm9zVJV8w0nnhOmiTYakuuJDfNM+k6umleza51ke3AseVz45HJ+6beSchMJaJ/+xnHtmbtnp0eLO7nJ0aYhJ6ls085iaZoy5Hd2Szqgw6vC34DaNzhWx7XYpbeGpHY8z5u2fls4hh6ynAEq+sDPosHiOEfAgE3LPPPwMNWDOz23sdt1Ds5xp7fqvKW/E2dkOuWmMCJHjk6chnguMk7x4Ey3RJ3cRnu5y0iNCOVJw47BF7pxLmv5Er5hQHLzR2moVWFHtuwaMLEtFFUnR9r66i0kZTMsbvJ+iHpH3+WCwJfd21D9vBTCr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 18:14:36.3463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2ed0e1-d833-4bf7-826d-08deee6669fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6947

This is a follow-up to the "Boot GSP with vGPU enabled" series [1].
It provides GSP-RM with the VF topology required for per-VF event
routing.

This series depends on the separately posted "[PATCH v5 0/1] Rust PCI
capability infrastructure and SR-IOV support" series [2], which provides
the VF BAR decoding API used by this patch.

[1] https://lore.kernel.org/nova-gpu/20260709150206.1046839-1-zhiw@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20260730180349.771719-1-zhiw@nvidia.com/T/#t

Zhi Wang (1):
  gpu: nova-core: populate GSP_VF_INFO when vGPU is enabled

 drivers/gpu/nova-core/gsp/boot.rs        |  6 ++--
 drivers/gpu/nova-core/gsp/commands.rs    | 15 ++++++++--
 drivers/gpu/nova-core/gsp/fw.rs          |  4 +++
 drivers/gpu/nova-core/gsp/fw/commands.rs | 35 +++++++++++++++++++++++-
 4 files changed, 54 insertions(+), 6 deletions(-)


base-commit: 2735e4c4adbae7e1eade2230d43c7f500915c46c
-- 
2.53.0

