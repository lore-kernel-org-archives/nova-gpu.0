Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BD13E0093
	for <nova-gpu@lists.linux.dev>; Wed,  5 Aug 2026 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916712; cv=fail; b=T9IT6R1flDP8IPwCJZfsTHBXRJQkVwJxDHtf7mmkee6lHkmse6z/o6eDfBuHm/FCXQwFQGk6Vspgu/HBzE4eJIk16Mj7i4dQyO6RbPbMJtc7JXkSnAYbQGwsdeoHFrX+YWaETvw8S9QNhvyGE+tpvcrvdkUwzAM5Cie8uDmzYAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916712; c=relaxed/simple;
	bh=C72TtyzIa6kKqGat6e8d3vCaQ78ajX94L7fcLlgPYbw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dONbzSGwP5ihnLXohGICAAnvBk9b92EZ15Pa83XZSY0ferXZDPa9HM1aRxZBGBEZDxakahds5Ymy0sO9Xf48CZfQf2yymrkmITM1aG5IwJ+V9+bdZ4y0ibcfQUpCesomGJJwjFu2SUDTIRec1Nvv73abFncuYYVF67YaPw1bdoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rAVw2Pmd; arc=fail smtp.client-ip=40.93.195.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rAVw2Pmd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8HiIozAekAryijcewTgPJQAtJZx4EcVpOeTMFwDj8+PsM4j4Ckq6qu0IJOpUX2SO4HmwJJ7CPjH5T93bCam1TTBxM1ZmFdlGiim2MzZ1btSvEp5s40ZsKpFx7TH0OVyJc3rxIYWkgjov0gsJ3jTWqwrccPrzSpPOidHZHVIbjyKX+d+jvPgrneUdR0Hrn9gU40rUR5Xxu0lDjeV5/s2WDOWG76Kyw5jMjR0Cfhk0CDqqndafFxsoyEGgoiRgS2xwCh33q5m3KXPn6cKc/obUopsSf+EiRO6D55pbpYNuOlqWQf8t9+iiNcYJ0DRqNmoAF7tH/MHd70qX/u6u4Q3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoW7Cszn9nI8PSaS34wgKJCeULjdP7OLtl84Ot6AZZo=;
 b=IbjQL7720RiAfzF6v5QJ9awFN5xcuHRDxObj6L+/sGq7yQoiwcAbyKD54LSf3ncu9m2gm1KrOiA05077MPxdxEX34tNi08dLWSNo7nABCWM24vlYFtrvoXDFMYQaN34XtcQTahLe3b8IIGrWsdC8zVjptGlWa4cZHEzB2V9yCxTXW9qJXoEPksCbhDLUXALy4Zwzdlri1EMT4dB6cLMPbYF1bj+wJpJHtdGk7WJ1zT4kBHq4I/vYe6AHyVOcW4Z90iPd5ST3yEHSNahAmF7EuGzGbT6ivQqsUlZOVFwCgrvdRxfuzWhNfHUXADcfRSGgtkpZWhveDDVYA7Vh3aCbqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoW7Cszn9nI8PSaS34wgKJCeULjdP7OLtl84Ot6AZZo=;
 b=rAVw2PmdFK7uIDhdJcDNKwKKtmUioiIoZqZrVy+gOGHsFidqBISIJ8PF+mpbPcTg4X2GoSNkw/Cqlk3VndLCkG6txHl5L3KvKZVu5+fnfPO6nh9Po5hmqqXEy+N/SaFQfBzQL/xsCO0d6A/csGPFS6jEsdYOOUmf8ypSmTGitD3F4BTXw/HOAY+lLG9yiBipaTxNquOQP98Bblz7WSPTeye8nO1rNw8u7bE9Dtqc5bsPOutSBXBgkUN5Iut7yUcnJI2pigfoTAyL8WYNWgTAFktEpVU6b2mK7EkGFl7Un3QMm/wGf5Iwq1zqtkisTtL6R3InaPsbyTXgz6d/7euPrg==
Received: from SJ0PR03CA0286.namprd03.prod.outlook.com (2603:10b6:a03:39e::21)
 by DS0PR12MB8343.namprd12.prod.outlook.com (2603:10b6:8:fd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.18; Wed, 5 Aug 2026 07:58:23 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::a4) by SJ0PR03CA0286.outlook.office365.com
 (2603:10b6:a03:39e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 07:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 07:58:23 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Aug
 2026 00:58:11 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 5 Aug 2026 00:58:11 -0700
Received: from inno-dell.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Aug 2026 00:58:03 -0700
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
Subject: [PATCH 3/3] gpu: nova-core: trace vGPU state
Date: Wed, 5 Aug 2026 10:57:23 +0300
Message-ID: <4dbd55dab7529e58c5fa2d4c4be887d59a1d4b42.1785907106.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785907106.git.zhiw@nvidia.com>
References: <cover.1785907106.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|DS0PR12MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ead8e1-de11-4278-2419-08def2c752e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|23010399003|376014|82310400026|1800799024|3023799007|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	0n0S7LS/oZp7hdx4P7ENnppQ39+kr8o8fe8fo/qjc7CQD2VTNvgOvnAO0oUsF2VA1RSOd51KK8+xV+B1dEEf6JsskT3eqRkxZBITAOPwpCSwJdluD+3Vumtcz0UtEQEwp3EhedrEw4hHjT3ghWEtP5KsSU5jeskvZbUUOuO76dsBcKM/nXSQy7FDJ9BVYEmhzcQKPHNydVxll7ZNU6tKjYdlJrsAoovIh7g5LQ0HcMB8n5jjuu7T2Q+DlTpBqPs3Zc2OTHqK47/Pgs814I+o6nWrf134Q9pSMPRDUEsrGMpB3MKVjFJ53fbvdb/wHuyXsdeWlO0tsVfyxeU4Orul1ak3mVlR4Q1JzYeHix/mAHACoDI2t/Q9iSWN97pKNfxpAx38Q9E5JIkv/qnAdxaCx+NaVvXpsL5et34bUl/rqdAYh6TVM+VKC/KD0T6H/ZrjRLC4CHID21ygIzHZcY2yFeEtFGHqMvivpfDN3inBoeNK2qk5FE5/Iy0pNFZ1jxeIF8IyYOBVsdsOwQ2UXCmNJEuKnuWrxxKqynv3quLqXNW65mMmJBwt+pyZtc6pLIv+TkY1rpKo93HFOWWaMbwdkdStciE1ITULMudCreS8ueaoQdCN1i5rVRz0A1elXvBgUcuETOkLd0r7k+JMh95tvMOgRelKwkH5zGKKLRDs4frd1LS6j5ORUkN1LjkwondT24HZR+iYFF3zzhPMgDD/yQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(23010399003)(376014)(82310400026)(1800799024)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4I8/i+tEfBiOhBhOQl3Gg4j5vclw2CWCMfJHZ16p3ig+csMz0gskiwK11+v3atuzio//WnNeh8KKLpkteO84DiC8ik0jhru3ynrUQeB5wNt212/hyPgYQISwhAAo0JividjXjHcDfeM1cwGCDF0qyjB0KkP9EBUvK1fkA3EetpOKGa+OTbTSlj6sP1p12U/mhauOYwcN3UC00M3FVwPTrn4tPUgl+u6aYkm6JoNf1bcvCNligyAimwxj0A7aSr+kCrUS1FMKlJoXgWcbtRcFbpwyf2fSnTxsZemqejc5l9BzxDxwzVYzipQNS1Ofm3MdXB14sDd4S9AJ+GFQkujuRZmZnyI4kp4aZkPGK9rsQ4dnGCVl8Q5qmfu3Y4vaBYtc903Dzay/71ByBio3t02IP0/LKOzKgz5itPAgLflbsmCaOuiGtvFtvOWcWKMMa8bV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:58:23.5963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ead8e1-de11-4278-2419-08def2c752e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8343

Record the vGPU state in an independently selectable vGPU trace stream.
Replace the vGPU state dev_dbg() call with the formatted vGPU trace
event.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/trace.rs | 2 --
 drivers/gpu/nova-core/vgpu.rs  | 5 +++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/trace.rs b/drivers/gpu/nova-core/trace.rs
index db975804f855..17967a686fa2 100644
--- a/drivers/gpu/nova-core/trace.rs
+++ b/drivers/gpu/nova-core/trace.rs
@@ -139,7 +139,6 @@ macro_rules! nova_core_trace_gsp {
     };
 }
 
-#[expect(unused_macros)]
 macro_rules! nova_core_trace_vgpu {
     ($dev:expr, $($arg:tt)*) => {
         $crate::trace::nova_core_trace_impl!(nova_core_trace_vgpu, $dev, $($arg)*)
@@ -149,5 +148,4 @@ macro_rules! nova_core_trace_vgpu {
 pub(crate) use nova_core_trace_driver;
 pub(crate) use nova_core_trace_fsp;
 pub(crate) use nova_core_trace_gsp;
-#[expect(unused_imports)]
 pub(crate) use nova_core_trace_vgpu;
diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.rs
index 6b7e045acea8..e4fc7e101c93 100644
--- a/drivers/gpu/nova-core/vgpu.rs
+++ b/drivers/gpu/nova-core/vgpu.rs
@@ -13,7 +13,8 @@
         Fsp,
         VgpuMode, //
     },
-    gpu::Chipset, //
+    gpu::Chipset,
+    trace::nova_core_trace_vgpu, //
 };
 
 mod hal;
@@ -50,7 +51,7 @@ pub(crate) fn new(
             );
             VgpuState::Disabled
         });
-        dev_dbg!(pdev, "vGPU state: {:?}\n", state);
+        nova_core_trace_vgpu!(pdev, "state: {:?}", state);
 
         Self { state }
     }
-- 
2.53.0
