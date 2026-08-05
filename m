Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A563E4C90
	for <nova-gpu@lists.linux.dev>; Wed,  5 Aug 2026 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916688; cv=fail; b=eCJdKzb6A/JQ+meMvhWEuL9JzWAYcPBiCSBLLN+SohSTmtUSWU49LLnQf7OGXNkNjhLbhB/QkUxzwR68DG1pqYd2jjNNnK4fr+X2sZDepgMlUaCC9QxVoFkxyJKzVmsn5GS/kOSSylWHxDoPdBOr9+At3Q7W0uxeR/FV34c+nwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916688; c=relaxed/simple;
	bh=gcjSuHaPo/K/Q4ySXJtAxFvAOHyUXuHZ2G95VIRvkgI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E42DuL2aYX0gh3zFvOVXltzsdh9Tn9ntD9XjdI3y2NuKYPwdOA2kagK4Wux2rIzVHmR7Cz7p/dmQHNSxSvHnlE6W7dZlF808ygAhrkDZYy3SxtsOaIyVv7dNQsqtKrl2r2FGfFMB0KY4MnAwWsUAzSmQcW9uYKRxDzhIpXK973I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DOUzNpCO; arc=fail smtp.client-ip=52.101.46.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DOUzNpCO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qe6jDpakgxJT4v/AD6wFjzknMX9nZek4zXYvsp8/m4fWAvac8FWJf0D6ebONQLVNUM5UVxuCtLtJoikTT2XGatsw3TdB3onv0hje0WyssCbjQVrdrPWUikBtnH56dXICyPLhsGZonACnZDpipRAmdEpTdcBliAgLh0M/zwTtqYSzAjXGlcC2sVL+uVznGwrwR8pBWVpDXmHyUpRbBHoR7W6Ct5CPGdzunIvjXaoo3je+5Qy1rXU4c4Kpifh5BddjCk1kGiWA9BnCQVPF1vyi+sOfcbJDZLTRaDYHET4U9v6/+Rg5XpYVCyKgORN0kDhkcfPc2Jxm8T974FiRjGFqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/JvKq/agaJ/XErA8eUsemQG9UdxNC1ErkPHoMJLjvM=;
 b=MuVX809ffSska0zR4FR/Ilema82tOqjd0/MorCi52X/ifsQRelX69OGY/9w34/XByRECH3lTyXmZXVr4QqRruuQZYpAN7RSywAyVnZX5sSnoTl6ChVk0yU4XFwDKH3BPQ+VtG2ho8wNOOCufI69jSCqhBcxL4FmuYdCveQCwLbqxGkA/wyD20lGmBRkAxItlpTu0QdJv8YBs7MdsODZ/iGKwxVZhaWTZHoqXffDL1mPaXh2QuIOG9uKlQlLIVnl5ANgiAGegQx0dsTb4dQKevHn0FJdXzhdZxCV3FPgxWvC9ltPfoIUwfJD5wR1AqcTwCzx//HtWDOufRfElz8o+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/JvKq/agaJ/XErA8eUsemQG9UdxNC1ErkPHoMJLjvM=;
 b=DOUzNpCOCSN4KI/eN4PUtvWmAfrg8x3+H1QhykGVj9veJNSLRcx+/1PJZdTInSxswZ/ndm2FmfQz5l0eZTlpA4sA5KQ6pL4Sc5gxPj0uBRPdfUkxKsJv1i3SzFouPrdueRlpf99q9WmmL1l+SrEjcLX5ZNzPtKULP3t8WxZeTxvuaz4uXX1RSV7hOMKRJFgrVEcuL9eO3JJc0jOEQTmKjm8Q0c0qQkACF6zB3eoVjIJi1L9payu9YHfKZRle112Ct0X1w1/H0H64iHc1cFh+k6L/d/3oWjoL9YuDYWREn0p9HMijMuNJW1kgghw5mH8eM5+Quvdv5mC0HPJF0XIK+w==
Received: from BLAPR03CA0069.namprd03.prod.outlook.com (2603:10b6:208:329::14)
 by DM4PR12MB8572.namprd12.prod.outlook.com (2603:10b6:8:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 07:58:01 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:329:cafe::6d) by BLAPR03CA0069.outlook.office365.com
 (2603:10b6:208:329::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Wed, 5
 Aug 2026 07:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 07:58:00 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 5 Aug
 2026 00:57:46 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 5 Aug 2026 00:57:45 -0700
Received: from inno-dell.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Aug 2026 00:57:37 -0700
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
Subject: [PATCH 0/3] gpu: nova-core: add formatted trace events
Date: Wed, 5 Aug 2026 10:57:20 +0300
Message-ID: <cover.1785907106.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DM4PR12MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: ba216d12-96c4-423c-dad4-08def2c7456f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|7416014|13003099007|10067099003|56012099006|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	DlOd/h+JXs62DYjI5fMAkv3Ayj25A7xhqBLBbYO/w1Hgf5ernlEtQydW1+IvA3ex+155yJ9r5gyqF8bVl9QyIF3WRAUHD6b91nf5g+LAxP/wKR8S5jp+m/VkkvBrw1ea63BDmpXuOXziLum+70R6JpLRshdNIsuKdT7Rr+Jetu3NKcp1u335KVDAOMHC+/6jUAXbWwKYNaDJxz5W5st/wwGUCpdmMF7Lf/9d9fkVYvOiiQEoRrr0Fq+BDjhxAm3MbvcyOw88ZKmIh11A5BxTBie+bOfMFfxV+LaVbfCjuJ27HEmxUar1iq9hc2b5M8PcKYjPMcjR1StODFsCQ2XyLRnKPNGQTxTVBblqhy3ObinxfoSl0KFfTD7tLkU24FGBw3z/OerrTXqDjGRiBip59AKUH8GeeBKNiFR3sRRdrgDiFLY5gYV5HOe4eJG+aWWkymeFR+LPuf1/MmwHuLF6nNAVDADVyll3PU8mE/FvbSVdITwgdRkTrkIFf9s2EXI1HS90EU90Al1P5ywlWMRQtLUQlJyiFPOV1mVy3dB4x6kwALCRaSA34k8uxR4IQtb2OavqJCqiarfesO7iwEpU2NGgsOFsgZG69so8cjyw2qYOop9MLHzRSOmTKsA/mg3TvvRNovnuxck+ftruFZSnNPR3kkDju+wUW7MxBdspbSoz9yc8rl1BUQeJdXI4nl55dd6jfcsocfXh55LsFSAYgg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(7416014)(13003099007)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LFbulY3yB2nd9Oy01trdPSeVv2O1ZJz42+6ofOc75DXkFJhUyEy6cvU6eSXU0HsMWeEKk6vc0XFpEUZDAbSoRxmORQ0aClvVAzyTg/g4tJbEg6wrKv3lZE6wFmCfn+xE+xRZCoTg+uN+H+wwFY0Db7vNxslLkD3YznZfJIySbal6gZAsUVp5gpuCkyjxxAhGLwA9HcudsuDNgb7SqUSDec8rsn3kQNNeZgNOY4BSdL1o19Ha1TKp+n3KyRBN7eH0IVZk201G4aRgI/0Uf2nqICvaxmK9j/RRuPo+7LggoFlD+peD+qfZEF2eWs8ti4zUxBpZLfS5DwjnjJuDuzQLF50fHntVjhb3s7JxQvBcLCxRsDe7Rci2f1VhIl38OyKRmGdwzPhVJi3wtu0zbuIJ+FUKKuyNPjBO/+9ibCOE26/8Ja0nXMc/4NWyaSfcJ4AF
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:58:00.8624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba216d12-96c4-423c-dad4-08def2c7456f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8572

Tracking driver and firmware activity is useful for debugging and bug
reports, e.g. GSP and FSP message sends and receives, vGPU states,
lifecycle events[1]. Trace events provide a low-overhead interface for
frequent diagnostics and allow each component stream to be enabled
independently.

This series adds a shared formatted event class and independent events for
general driver, FSP, GSP and vGPU messages. It replaces selected dev_dbg!()
calls with their corresponding trace events and adds FSP NVDM send and
receive records with the message type and length.

Use the module selector to enable the events before nova-core probes. With
tracefs mounted at /sys/kernel/tracing, run:

  cd /sys/kernel/tracing
  echo 'nova_core:*:mod:nova_core' > set_event
  echo 1 > tracing_on
  insmod /path/to/nova-core.ko
  cat trace

[1] https://github.com/zhiwang-nvidia/nova-core/tree/zhi/nova-gpu-wip-nova-gsp-20260803

Zhi Wang (3):
  gpu: nova-core: add formatted tracing
  gpu: nova-core: trace driver probe and firmware messages
  gpu: nova-core: trace vGPU state

 drivers/gpu/Makefile               |   4 +-
 drivers/gpu/nova-core/driver.rs    |   7 +-
 drivers/gpu/nova-core/fsp.rs       |  16 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs  |  11 ++-
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/trace.c      |   5 +
 drivers/gpu/nova-core/trace.h      |  52 ++++++++++
 drivers/gpu/nova-core/trace.rs     | 151 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/vgpu.rs      |   5 +-
 rust/bindings/bindings_helper.h    |   4 +
 10 files changed, 245 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/nova-core/trace.c
 create mode 100644 drivers/gpu/nova-core/trace.h
 create mode 100644 drivers/gpu/nova-core/trace.rs


base-commit: 44e7e7f7cffb10a93bb88e7cb59b7b8b3e2deb1c
-- 
2.53.0
