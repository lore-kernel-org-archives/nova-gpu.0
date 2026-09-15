Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2095343DED3
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505921; cv=fail; b=pMsuWbyukU4bnzUlkXK+rxk/YgcLjgHmpcN164vG+nXyqkYzYogeUzVmfCFkRC66v1MjryFtzCI0fsk8pHUERHaSOVFkZ1oxYoPJe00II5eTMdA46y0pAgNh5udq73RL+D/HkFs7gcXcLlJIMcRmwIWaaWgaqMb/YKmHd6tJu4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505921; c=relaxed/simple;
	bh=enu+If6GhGZz1FD2UOuYLO1JEKzke6vsLtBz8fA7L2g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uEiV6e8o4+cSujjqbqHfS6q35TlgmHPhTIkFeDU5pQ/VPQY9PFYNXqoFUeTp44csO2v+Ms/et/eTQN17EZWJE/AR5Cn7dtFSbLWoR8jsNM1QRSWzCJO0WYVlPSRzI9whBvGXTnVn+49K/hhIbMpUyQU9FMa8DWKuDjx5o+2gu9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OdLCtlan; arc=fail smtp.client-ip=52.101.56.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OdLCtlan"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIwomLdeoZ8jcyPt2rKwKUzwcOlDq2qRjcdMhhgguvKUGBgjj1t8fUHj9FFIN7ctkQsBOrwVLFg3l5Guh/UKAnu552rLWcG0eocqJKTZ70mWxnnZ2OFGY8+y1RFfBz0mDheafobacYQAHuQUJvVXyECWbgUgkiOOFJX4m51gw0LLRXrQKgmJv5CaXOxE2nzRO2cKxTroWX25mc6QrcHfuf1dkLmP8pElCDaS5DqnxIrsgedI5sAXR6ITzp3Z/dhZntlL0n36ko8/04QIC+yPaJ7NVyZI1eRIoiCiZTCuZGcaHlYb7autlm2yIZpn7mYTIhQ9rXnGcfEghiDsgS9C2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIXAzzqoQ0vtVIWPX8D3EGJyxH/EGYUXiyd/KFiJ1yk=;
 b=s6qDQhlGdLb0WDMBUjKepwJVc4CnbrBl7EoKL/1JXvr+kOtfAKUZAt0WBy4Hj6s1ad4o5YoNpa1WKmmc3toes/tfLGRNaryCTC0xXR/0RElWQctu/VbnoMEd93grfJRniN5sCuMRNBEtFdEPrLGdikbe3HT3wHMfrguHho+QR33LaMvTEzL/9cP9S8WUHA8Djeqp0FMWhf31o4Dzc6Kd8NSzOISUULwvZzRYgC6nRNiQCG/yYWHg+Si0LdRKqwzFzekqc+jMKjpSwc62cFnC1gF4xa0FthACNfSOS+YvpSjRwRJOoddv6ZFwkw8IGv/WLcO2aHnBdnXSeH51j+YCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIXAzzqoQ0vtVIWPX8D3EGJyxH/EGYUXiyd/KFiJ1yk=;
 b=OdLCtlan8CgXlcuoTqn0I2iPA/HMOoMChYCY4xxSDYlI/p6xTEQZD6ttaS2E/6OpG2KAZl68eyp63JSxwdEX2k7lU3Rja7aopqnrhOZmzEph3NISWJifgBB5iB57yMUQSQgax9ddhNSOYb16q/tcLJF6RISzckFpExMXQIwUxmfxEEYqRFsTy0lOaXfNxOokZ90Keav04nA2vtOWvFBTC84Ss+DMmqpBsDK2z0PT8GctyYe/l+O2tqRX7s143g4fPDy9Z9qw7Chd3B5SNhhJ8U42rXuGFPI1t4zvo+9llDGvgS3wnCGkCDYLi8zLViUP5CjWyROSSQvvFKEqjPqbYw==
Received: from SJ0PR13CA0190.namprd13.prod.outlook.com (2603:10b6:a03:2c3::15)
 by CHAPR12MB999249.namprd12.prod.outlook.com (2603:10b6:610:300::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Tue, 15 Sep
 2026 20:58:17 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::4f) by SJ0PR13CA0190.outlook.office365.com
 (2603:10b6:a03:2c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 20:58:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:58:17 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:57:57 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:57:56 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:57:49 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
	<zhiwang@kernel.org>, Peter Colberg <pcolberg@redhat.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH 06/14] rust: pci: add is_physfn(), to check for PFs
Date: Tue, 15 Sep 2026 23:56:50 +0300
Message-ID: <20260915205659.76841-7-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915205659.76841-1-zhiw@nvidia.com>
References: <20260915205659.76841-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|CHAPR12MB999249:EE_
X-MS-Office365-Filtering-Correlation-Id: 3268aebb-f517-4e85-0677-08df136c10dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9lJ3w3hV1sizOfnNJ4wdBW3dgrXRrOFOFp22JMJoMwZdxq6OA/M7D94Ai7XEL2VYy6P+cXx1GlCxua3DGCflb1W/oL04dHJNk4PAeOnkKW2pQCrllOP5WNxqLRfUMKa2zFVcQlIn+MouyoC+Ohquj2RoBR3ipJt38OLsz4S5EK1P5guqYT2Igg+cpt991sp9CX6a3N9QIlbHRIwr/wYanIcdLcUf3Z38e+QXWEbQD+LZ1dYabYDHR/dS1sCCyRvv6VbqPJEbn/M+ZIEkghCDxAv3Sg8GSWpkJVFRW0INHcSx9/v9JWtzfF4iU4y4uLo9XioTUR3EhRqsVjJNRnecdtu+l+lsDQhaE6YubO+ViUML0SvuGT1KjIpBqgdCYXhwpDXyLDGJsnCJ+zongayHeT/bubfywqS/6l4Wb57ETBp4K+H9Zx2Fzb0b5yrLdOjG62K5TtB+xB3gmmVcViDxW+KT3L2iTsnDxauQPAa0y0Fck4yBzNuVAVFqptsHx1evAaezWyaGApiwShyALCKmQWVYsRZnoYfNnsD0YS3FHb2LVIwy3xKJsjR+3NIuDaoMvfzGJoWjNDphfL9IoW8uJJVQ4l9zB3ztem6Gm3pZjubSRwlTHGs26vIcmmYgBUQ7jrIgJ3cDTNBd4svq8AfBCZDh/tqnsV4iKWO3cUj/HKUVG6mmKWj0J3yiJ3u1fsDfU7eH1s/FvAXstUwyGPUGcA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ReG5XL9ni++y3hV6ac8KRZxKXyZ9uOvVGwtTD5Wz7owTClUMU+ZPwIM01LeY/CpVZYUlIJM17q+9gTDIYUfXwKR/HArbt4TU2Ytd9RpVU0oJJq/wkDMWmUE2ab3iV9obSJ+kyuUCrMuzhVzIMPyCq08wrQC5nIvttG/PBt4T2SgqrLcjg5kvcRcA7SgaCJolCqzf3nlKfT8ZQ6E8tMbY5g1WgMqdrYgSCtFFl3bShYkWOkA4mftIJ1yb5H2QBb7Fg2YUTXndBLMac6GPt7jNBotJYxoQjlsTqom4DwN+2kEw7/R1RZdpzXtHdZsZtYCfSveeswHiHAViswkiA5LV82iS+7qbyUbTdj0xbpbVKcBIUusP6lPG+Y3uRonakVetQK9PIHX36+wpxQxt29t67JGyjIvLfxSPeZn7g9V/szQbSg4mJZge5aD8RZqyFRer
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:58:17.0039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3268aebb-f517-4e85-0677-08df136c10dd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR12MB999249

From: Peter Colberg <pcolberg@redhat.com>

Add a method to check if a PCI device is a Physical Function (PF).

zhiw: Keep this role check private to the PCI SR-IOV implementation
instead of extending the public `Device` API. Add a dead-code
expectation because this standalone API commit has no in-tree caller.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 rust/kernel/pci.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 844d73a83670..ed42511911d7 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -507,6 +507,14 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns `true` if this device is a Physical Function (PF).
+    #[inline]
+    #[expect(dead_code)]
+    pub(crate) fn is_physfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_physfn() != 0 }
+    }
+
     /// Returns `true` if this device is a Virtual Function (VF).
     #[inline]
     #[expect(dead_code)]
