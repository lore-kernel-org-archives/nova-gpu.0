Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792430228;
	b=ZB94nkUGzhYY9mCEzafqa16JdqeSgR/pC0sYDlv/DDZf6pKTdHezg3ju5iDijN7qh+Ue
	 3LpqA7uXeT+CGpvX8U1tjSrf2WmoSx9NnAyoANJdoFgE84I4fKQZpLaHsyi2Dj1eBI2yC
	 0nXix1ZK+aXc/S6k9pV/bjq2Ad+PrMqlifQMvT9rHqnfDpuFPPXBTbjpw6LMupY0g8h7S
	 kkLp9MBY9H+NC0QViJ0JpjtANWqtLOjn5fILtAs1Y9iuMxUDYmwga0/plXIsxEl78KlsL
	 4kgaFtD1+QGFzA2vxsZBncHNgl6+dweToK0ghtvxkCm0Sbui0t4rRIE0PqgO6N+4REg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430228;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NV-OnPremToCloud:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=XJJm1j23iiSC9MyFckNEfjrNhos0+y0q8pPaY+fXMEE=;
	b=zI1RpLlX9xAWzNIR3iMltmLdX1/aLysDxbEbYCYc0HHj+DQ08bU/fiH4itOjtDUSJA2G
	 EjB+an6wDiAAVai/F3X8lhPwOh0sGgyfNTtPjQZ3Fw2cvevsLtVjdgjNUWOA/xIyTkgwE
	 4HAs7A0l66cradKYYww6AI/Jq+QHZjzC88pNtjbdMGfvyY5IG8/eCkGMmcZalSuHHQXUq
	 FS8xEY2EjxJ7DUwY+xHq5AFmbIOF8LlW9myQ954lMJ0tj335gcnLcd8DQ6ldZ4B44DIKM
	 CuYs5HHahfL+3s0V1NS+z9zvBEdfnsGvifbYW6UVkR2hsCndELfujYlEkzph1F8KHDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=peTHqq0R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.65
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DF0606A31C
	for <nova-gpu@lists.linux.dev>; Mon, 19 Oct 2026 17:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=peTHqq0R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9XTWLEosmD5zece9/y4XYzKCE6BjIDwAw1dCtmtPFQHQc5noX4nKY6vZ8X9yZf2Q9kn2rlf1YQEfU5MgH3KwH+vSkZK/PShwxhj862jsIPu0h6AMD4KCkqPcbJuK6cBzFodlNUp8QUFf43lVRYx6/Dr0tozmUD8tBqkw8yLLtzVGbXzl5kGN/GDB1jLqvwfeVEUVi2ok3xxULSLDG7CVs4AwIgnIzWCjxyxg8xr+BmMaJkV2olqTSMDejsPLFG283ecxD1IzIIliFal8NM+Nn1K2jqKTSKde0FvyKrKRY/BQnupdj49or9SM7la9ic/4DIZ8zJ5S8GvF3XBrhmtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJJm1j23iiSC9MyFckNEfjrNhos0+y0q8pPaY+fXMEE=;
 b=CgOnlxunI7q9OVFoHrvfCb09gu2Iduit1VB7dgPVkHO6HPpUWGi4LsjktWPkfpdTW5aXQ6s+yipBTCGiifBeCr0gPXkCCOSXqUGqiEUyQ3DYXVaVVzr+Gz05iaIdNWCAj99drD46RFMCUQAPygZNf92rE/aAfyAz8iy0eLe6LcWwHZnUB6uiXCS2IpwJyLvXjG1Sf6cH3oATaE8AnJ5x0M/e0qKBd66J1JnYYNxpmEVr+3k5lf1Nd9dYSmdFgS8NZ+LkZ/K1DdTsJ9kIL69JCT4BJlHcQ5AppUiNLNLPZkj8R6xkfZjujRhss3e8aszRkaZURV1xzpveD2/V1wOwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJJm1j23iiSC9MyFckNEfjrNhos0+y0q8pPaY+fXMEE=;
 b=peTHqq0Rsw1TeCBr81rSBNRfqkTEpTmApvDtTuP7QrEMMjE6oDieLg5v/WGsj0eSo+E48BZZkwphe8XlFXyZqkTB08ZI1codEdH8L/UZgKR1Rn+qjhpWKnJQZ13gkAQ+mjUyoYsyGsCOmcfqhC70I5l1HUsom1QvtKWGbmBnqhJKsrd0JJbfxoQ1pbCnN8mT8es6g3fWzAsyCeowohcsi03Kw+wzW1qgHqxte+N+GeCtggkmEu55Kec7Hu9U+nTWWOn1ecfLfXohrAaSnw+uU2EtYj+VDczdPC1AlFM7IR7vOsmN+Z9LOXOjPgl8uSEqyX48A4icfH/sKDcXOVZq0w==
Received: from DS7PR06CA0040.namprd06.prod.outlook.com (2603:10b6:8:54::28) by
 SJ5PPF0AEDE5C3D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::989) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 17:17:03 +0000
Received: from CY8PEPF00000056.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::5e) by DS7PR06CA0040.outlook.office365.com
 (2603:10b6:8:54::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 17:17:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY8PEPF00000056.mail.protection.outlook.com (10.167.247.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 17:17:02 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 19 Oct
 2026 10:16:42 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 19 Oct
 2026 10:16:41 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 19
 Oct 2026 10:16:33 -0700
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
Subject: [PATCH v3 0/1] gpu: nova-core: populate VF information in GSP_INIT
Date: Mon, 19 Oct 2026 20:16:25 +0300
Message-ID: <cover.1792429308.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000056:EE_|SJ5PPF0AEDE5C3D:EE_
X-MS-Office365-Filtering-Correlation-Id: 40526771-b171-48d8-5013-08df2e04cab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|23010399003|82310400026|1800799024|261009223027099003|10067099003|56012099006|3023799007|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	0v4d3/c65sOX2d5kwThmGRh+6x02dGaVNc1wTR25YyBIP+vW1TffMz4oEEi7WhGvyWNxp8u6nj0PdkjBIZSoJ06nyGBvY5sjnKV9ffVCUmDPE3rPeeWGVsKTx9oC9xWcoliH6vVSrD9THROJFbL7/X1Oh4I4FW/zujzK04og3+rdgeC54J96ZoglkX7UNcszg5O9jdnRc3dtOKH2lTk41BSfgC7gPXJW8GFW7AJcBpogV25fED7S+ex8bhmCVGNK5RnFXjtVIme2T1lXN/ZxtfMceD79VKLuo0p1m1mD66NgGgIvMElhjty06taj1OAkcNfWhsMnQK4mUWNQWFNBGtSn6V0TnV+IYvJLeiAcfvhy3mFM+mcKhsKDywcKR0lFPggeVeff6sSXSDA1dA5tjV9mb8RyFNq3gIa1moIQvZ+vzUTqYvqGscWzhWNeWadeRx6gRMii2hd4P+lWqVx91EsB4WeAX7AnH9sCDQ7bQRJeCuUXkr6OhGn0BrdR0vLjNLcvj0Ln24Ja/XNswXpaP7sNdE2P4hdOSvn2JDZ+wjwMbt6kuU53HsB2yGCNZDUZQg6vGoN8K8u1WwXgppILAdnd1wBGod9paVNMUydoyuljHQiPKF0lL6wBcDkY7OUHCzah/ln60e2t7GTXE5iCxclz9E7Nkq/A1PAuelmWmksmCFNyuP+h1sI/dkOL7bMhDLNd9cNJj+gzC9yYASSkOA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(23010399003)(82310400026)(1800799024)(261009223027099003)(10067099003)(56012099006)(3023799007)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q5bnMnwMgTn/EwlR9JpUvWFRS2alAodC0iL7bnW5T0P5twogJ5k1z6ThCAoe9DNQ5DqoCt76UpQGE6N7FHvzErxcRJ9b/yS/SKgc2+UITh+oC7G1MMlwjjNKa/r7vaYj5MKXi8T4kZppNy0z9HPe1Q/a9B5feFFWCjlsVSrKytqwKlpQlfZZORTO4p96me58gIE7Htx2X0jEw28vCtcEilJyHiL81dcIIm7/4kTV7BallcOcG7ViLbgXXsUJF3Wi44RuB7J1iYRBmDdOdEx0k1Eea/2bWP0T5Bf9Jr0HTOdVAZSY95fcukOJWewCMR9bv6jUseVOmGOOhObgo9UG7mCnMGl006XkuxzWx445mkEJ38EYuIDJOWN5HQMLTq9uR+t+a5pqWw+YtkV6ljwQFXG3ybowEwAroWuU00yMhiuS9J3dDPZpfy7rg8Efk4vh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 17:17:02.4488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40526771-b171-48d8-5013-08df2e04cab5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000056.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0AEDE5C3D

This patch supplies VF topology to GSP-RM through GSP_INIT when vGPU
mode is enabled, allowing firmware to configure per-VF interrupt and
doorbell routing.

This patch depends on the PCI extended capability and SR-IOV support
patch, which has already been merged into driver-core-testing.

To avoid conflicts with the series currently under review, this patch is
based on a local merge of driver-core-testing into drm-rust-next, with
the following series applied on top:

- GSP command-queue preparation v4 [1].
- NVKV codec v4 [2].
- Boot on the r000 GSP firmware v3 [3].
- Channel ID allocation v9 [4], with its cv! v5 prerequisite [5].

Changes since v2 [6]:
- Rebase onto the integrated base and populate VF information through
  the GSP_INIT NVKV schema.
- Use the merged PCI API's first_vf_offset() accessor and logical VF BAR
  iterator.

[1] https://lore.kernel.org/nova-gpu/20261009-cmdq-rpc-v4-0-c9ab8de1d3f2@nvidia.com/
[2] https://lore.kernel.org/nova-gpu/20261016-b4-nvkv-v4-0-e8b92b91aa5b@nvidia.com/
[3] https://lore.kernel.org/nova-gpu/20260918010719.1176945-1-jhubbard@nvidia.com/
[4] https://lore.kernel.org/nova-gpu/20260930-chid-v9-0-0d6cca376cff@nvidia.com/
[5] https://lore.kernel.org/nova-gpu/20261013-cv-v5-0-113a538dfaef@nvidia.com/
[6] https://lore.kernel.org/nova-gpu/20260804170045.902069-1-zhiw@nvidia.com/

Zhi Wang (1):
  gpu: nova-core: populate VF information in GSP_INIT

 drivers/gpu/nova-core/gsp/fw/commands.rs | 34 +++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)


base-commit: a767f1cd2b0da50e0dfc48d7991f55c92369ce6f
