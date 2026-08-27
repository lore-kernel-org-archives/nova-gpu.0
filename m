Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012026.outbound.protection.outlook.com [40.107.200.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF3237BE6C
	for <nova-gpu@lists.linux.dev>; Thu, 27 Aug 2026 07:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816796; cv=fail; b=YZMwpsGsGDPhsEEpKO5VKXyQn/3XMbE5bw4DPgIsgWPV+g5mzybpmwHFLaDwLLbDqXNxy60TXnB+5ftP+vXTCgHjAiIZaDdq1ckdDq/CJuIoNkY1qu/YlxUraEHzdjeoAOjbczxPu7V39S2SaAFIYdc2CxK/lR0l3vpj7v3Nfng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816796; c=relaxed/simple;
	bh=/wawv/A8kYEtfa/QUOHBXJMa/gcYg9ZKXxrdQwzaM10=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oGT93nb/uHlawkRRY6YGz/k+t0uPxC2ky50xD0L52wsEhMGsrs0QSUROqxXCvj/V52AsoAimQqD1XOy8CKLJuBTM+9KFBa4xhJ+L7zi91hIkg+CfeLtoZl0vB9JXmvBpVucqKL7wKC2TI9Mra4P5D8VUoWnL2tZMrYGP0YsMYIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Vs4F+Gr/; arc=fail smtp.client-ip=40.107.200.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vs4F+Gr/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGo7QD1VArym+5RVB0FWXnLpzUmy3rTcT4LRRVsXO6ko5VytSZGIdZCR9wFZs/o9TaAuzm4LHWyrS0omACoJc+3bp29rbNOedmoMHl+x+666rIN+egMc0r6Sst/FveD1km47kFMrkSU9oxOxbKHE2p3UOHuxRa1E9RwUDlIKPOXkTSjUjTx393HdwxyMWUbgBBYObbbnkV5Arf/jvA7OKZ+mpTob3QJLa72Ftqv6kWiwcDY0N/CewOWQX9CqsItrFTrAsKA0Itw3Ge/ll7HSLMbfI6xky74xmyC19iVnrKofHhL3VYQbjA6S4vLoXh6dBMQRsI/n7R3s+3dAqe7KCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9tAutsnEn423bCdfKstqWrUM7D5oQ/b04tR3l35SPw=;
 b=Wdld0K9YqZoPSyqjTRKlAuOE6IevJ+kuUHBn9yG+m1temwKQT9xumfG1Gk2wiVgzJu1M/1FK+/rrEbsHmM0gcuUMpJ4J4g5/2AHFb5KX7ivZ/MAy6JZEQVL9PwHbzFK+PUFsUkI1gnslolXFd5/fJOUiR9t5EZ6xHTe8+C+Se/b5qjHDwd+01Zys3v0WlL3kpBl9exPUGwEGFT+Je3FESnBH5GLHK4n6p4T/r7KaBhrDHGuMLACIuSDYXTJM0Fm1dKuFvW/3SYV9XGtoKIfxycKWkW9L+MlLuSfemkqZkCpgrX0g/y0hjYWsSQ7nORMK6lswxeeApCMhZ39g+YvwkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9tAutsnEn423bCdfKstqWrUM7D5oQ/b04tR3l35SPw=;
 b=Vs4F+Gr/JL34xzhOFbMFIdVrYhZjx8x8JBo9dKdbudwh91z7DlLF/NnqzS9kQ8XcSvpwTffxx2B9UZDPh85xW/xOpimcwyhwRlk0eztXUDYjOeXrfeV6guzMuCN2E+Cb3FTJBz2vEfWdcZ7qKSncl/68NH47uuhpo7+vmku64UcNUqxmkYGUUIX83Lw+d1e14No9n6cdMyCkMriYqVswVaytUbFcn5v1wAGLlYpumR2QUWPGf6Zs95xZk8nniGpqAWmz3VO89pNCyUFhZIfqsPL8q41DXdQHwWHmMy1D6CqS6GMdNNjy/OVdmQfLHCY+U+wUNW3alP6iByMMoMLyuA==
Received: from BN9P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::29)
 by PH8PR12MB7424.namprd12.prod.outlook.com (2603:10b6:510:228::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 07:46:29 +0000
Received: from BN3PEPF00022BBC.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::28) by BN9P221CA0030.outlook.office365.com
 (2603:10b6:408:10a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Thu,
 27 Aug 2026 07:46:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF00022BBC.mail.protection.outlook.com (10.167.248.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 07:46:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 27 Aug
 2026 00:46:09 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 27 Aug
 2026 00:46:09 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Thu, 27
 Aug 2026 00:46:02 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
	<alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
	<ecourtney@nvidia.com>, <apopple@nvidia.com>, <cjia@nvidia.com>,
	<smitra@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v2 0/1] gpu: nova-core: correct FSP documentation
Date: Thu, 27 Aug 2026 10:45:59 +0300
Message-ID: <cover.1787816400.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBC:EE_|PH8PR12MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: df8e148f-6af8-4d3f-f71d-08df040f4e14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|7416014|10067099003|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	bjwTWUN8HwFhEcaI70kzHzE6LqBB59JAFV4aMC33lrcUsl8231x5nL4IGJljvY8Ckx3d35wpAOBXS4HEVpEE83hjJi8wU52Uj9FMB+pZjbq0nlCgfYMzPMN035HKN/xkl6JbTNTb6FiLdE8/jyUX0Bhmsj5YF6hwS7ni2TBdeS8IwsZ9XizzHxS3LoAXCdcwsIlChMlDMnw3TuBjxlDN1D+8wH4aTB2fSO2KIt2I72R7HHgQzVWDfQikMSqFLhQs+C+oc4u4yMjscTMtqxrpbXvwuMratcCDCYo5gNKioI8ZQ+yOqeA5c6bBgQwmsbsag2vvIeICq2z8rigU0WK/pcEv8UkSZwnF3nYsZqhkuH4WecM0sUe3d9Wr0s/n3AgHJ4Rwwt9gcya4AIoaxyQd7XZRWLPfbUHsL4SXoiHGeRCfcjqjQsxK+jAnm9NVecTIjUlBT/cDrfUugw0OlPnh+iL1y6XYXqL3HNnDlsIK//V2qWRIGeo5WNKGhM6LQ2tvyWVnGhYMISxIqWfqQjSVBbWU5anEVpgDJV1eME537LqzPS5I+B/qBUSBrodWnL7L6G3OnBHfWZWCS/vGn493HcsrrzogLAXX1oDaX+lpAsX1z3eIA/l1n6tmnXW1dxNVB9Eek2ma0Rws5igRdzucraK5yK3XhafS6sx7ijKbvdCxfUvSRaHAWpQhnEckMFCkbKvzBNFCG90pUPpypnVKBA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(7416014)(10067099003)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JLvYYvdYZLlk6tv/tLyJLd6jHn5/oGADwmNTR8h4L96MKwxpi1Xbs3yjo/f4EExE9ZjkM5sJOQRPf6VSgNzV/pEfwxVsn1JBJBqDH+tN11fPzlP7AtuAEwfQdcUZjblIUlbP+B3oTeX7yqX4V8GnqjypqSWYKTL23q6qFJ/vyKc8qu1RPR7eXW19Mg6LznOLERMHpT7w7/jjMskjN+0omiic2C2IUQ0gO25g5jH9E/De6vLcJ2Ptxe51rHWc/CdHBmt+VcuZg77sYumN63thaSHqqO3rc2GDNUT7lqjshdv/+Z660Sa/4YVkFwnXKnrHZE8A9yg+wgSMAxBVPtRjDCS53fCXxt3p3ez8hFXAOit8+75dG1s81Kov1s0Fv/xBaRx6hU9EeaFQIvplttLyYEC6oqkuJJi8Rbvoo5eshKoW5+vFzVZsOhoXtN+LI8JC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 07:46:28.8890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df8e148f-6af8-4d3f-f71d-08df040f4e14
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7424

This patch applies on top of Alexandre Courbot's GSP-FMC
naming/framing fix [1].

Alexandre's patch corrects the code naming. This follow-up folds the
FMC expansion fix into the related documentation changes:

- Distinguish the roles of FSP, GSP BootROM, and GSP-FMC;
- Correct the FMC, NVDM, FRTS, and TLV terminology;
- Clarify the scope of the documented dGPU boot path and the meaning of
the COT response.

Changes in v2:
- Fold the FMC expansion fix into this documentation patch. (Alex)

v1: https://lore.kernel.org/cover.1787754628.git.zhiw@nvidia.com/

[1] https://patch.msgid.link/20260825-gsp-fmc-rename-v1-1-f82526f01d7d@nvidia.com

Zhi Wang (1):
  gpu: nova-core: correct FSP secure boot documentation

 Documentation/gpu/nova/core/fsp.rst | 88 ++++++++++++++++-------------
 1 file changed, 50 insertions(+), 38 deletions(-)


base-commit: d53bc149eea6213e9c4a4604df5521db7b7296ca
prerequisite-patch-id: 4bed4cad6ef80bb3ec7dedd5e32969eb50482c57
-- 
2.53.0
