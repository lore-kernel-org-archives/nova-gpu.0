Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792430246;
	b=xGdIitZGWET73xSIPQV68NoGn4F/iU/pf+9rmBEIzj9Haswmp5Fyp4uEkN7YFazkLit5
	 ZDPYaWylUJuDQ1HiXEN6LwGfV/YHZhWj4rzAL7+uOEmEsRI2f15sG6Y+bBpio7139kl6F
	 I/VWOt2Woxnitmm0uLBzwmkOmRNyEPtKUkmBW1UrmqgSUQCr6vqy+vwGSmfncO0qxyebA
	 2G6W2EuHGXlF0+Satj2MbiBMg/1UjBORearoxV9ndgj2p9uiPis1ny1b5auzKr9TQuVSt
	 NwC87ipErXdNWrmxOGCVrkxnIikc+5EedOFnEJLc4AYp8mJuNCay2NXEB51Z3+w5r0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430246;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
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
	bh=LMMebGFriIxaRPusRNJp4YkvHAerjPOXOH/Ty4Z0O2M=;
	b=ez1bAs0bnowXBszOwiLq512wFW/V4/kRfV4oJ/QInnVBbrF8XmCb3BI6105E6rjU3o2q
	 YvsQa46udtFhgeYBORADI+yXA+F/57K6cCMT77zKKICltM73T9Jk7t4Q6tJ0UeaNOvzF1
	 kRcnVpcSnRK8+oyYfwDfgWFm+TxHT59zzDc1Jv2Yb1hXsat2WD0yJpdV94Fg5fsj0urpH
	 b3Wwdrq7WsHTf76v5vbwjwiYG2uXoIdpgKes4zChNaH6Tz5Ipp6cYGAFaUOVQPI0Y50E6
	 pZqQ+/uhWixlnPVFilYeQYs8MmW5BiAdEuCyjpVgejKJPmvb1EA8RZo1ji2twoCKuLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=akICQyyA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.10
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965E2606A31C
	for <nova-gpu@lists.linux.dev>; Mon, 19 Oct 2026 17:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=akICQyyA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYjlNn7LpMHwqVUqRRHLWByaLtwdOwL61UFyooWp0XmFIsQA7Kn4ppKXOKQAM1aHHwpT5vEy0YFPuGdSluMRlclVqnBLdgByq3p/y5uWhPBDx2rOZ1Je8Qed8l3r8EdzaWzwWG0El/QqwDu/F7Bwv47DEZhcYflEqzEgOnZuqufe19iEHvVId0//d0xZcjGUOm1BJ6MtrKNFQcr9psz0f/zZ7wIoZU86c1e2CqRv6R7PQCIE1vDNpo73DYNDXPOrg0fQzY12qTcvDlb4ZNleUbN2AejK113VYCRUzw7AElbKisiw36LzpPgdOF4AAm2zI6t988TSgeBXBqgXlbve/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMMebGFriIxaRPusRNJp4YkvHAerjPOXOH/Ty4Z0O2M=;
 b=ltT1XyyoT9c8OZa0/I+HXk9xwUsWGvES8yOVie51t/NgGokD9udjcKatEeQw1P67hKb4eyo7uBO0I6nXewULflhUKgkk2UTX8kclbetvHQvCJ5aDWywV4VCWF8mwpqhcGfkot6e0j+XWsGn3U6StlnhhqpOFEYaGgL/u5g4QVB+kdYh7tk7kVbHOmEDXKBny71tL9t2ngCoCky+7iFLEWpLsdMDMIkKPIEKHV6cfrHBr5FyW+jL7wz3ILGjJCzsOlDgK1EvzVD2SON01CG/lcYlHlPDDJ7R7K1CUx0xcrNNGrHY2nRIf1weX7G6wr7/iLZtJ7y2/g6kKYGkoLLe/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMMebGFriIxaRPusRNJp4YkvHAerjPOXOH/Ty4Z0O2M=;
 b=akICQyyAYhQ9+ZxiPHrb85MvllT8Y5DAVC1dY61nLaPpegQt5SxQVnimKEfjCIs3MpPUsTGtaaTnVOjbPTGb8it3hqkaEJD1oc01h4DLMMeTsOOP7fzAT+E2+2EuPzFOTLXSeN9VXJs+nJJaIw0t6ZQ2smBv9qHNFq1nCh428p5901Hf9mTdRCZOfM10+2SlS0ZRst+tTFslr5XDEJHHGRIpbRr4JojrYypYHM0bKfOMm/jpIW6TjpQftWjqNLz+MKQ1T5MP+ViA2Vnebm/33u6Zi4kBlgaUFLfYnUXIeD/gK2ONlnsCq1B+vx1somLfm5Wfqg169b3V+w3I6io1Bg==
Received: from CY5PR13CA0058.namprd13.prod.outlook.com (2603:10b6:930:11::11)
 by DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 17:17:12 +0000
Received: from CY8PEPF00000055.namprd05.prod.outlook.com
 (2603:10b6:930:11:cafe::ac) by CY5PR13CA0058.outlook.office365.com
 (2603:10b6:930:11::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 17:17:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY8PEPF00000055.mail.protection.outlook.com (10.167.247.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 17:17:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 19 Oct
 2026 10:16:50 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 19 Oct
 2026 10:16:49 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 19
 Oct 2026 10:16:42 -0700
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
Subject: [PATCH v3 1/1] gpu: nova-core: populate VF information in GSP_INIT
Date: Mon, 19 Oct 2026 20:16:26 +0300
Message-ID: <8622df09af41cd9bbd4b74b0f1e26d562f515f4d.1792429308.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792429308.git.zhiw@nvidia.com>
References: <cover.1792429308.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000055:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f469d4-4df3-40a8-853c-08df2e04d055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|36860700016|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	y6+jLnikhWRIld5jeqkOD8stx/5aK9mMLJzLuBzvts01/iMPQFnhv2K3JOuOUWU5i0klxBCwAAWOflCadzPG1wJiUcxzkMKZ+/QqxPzlxY7e0C0ckBUd2f95OH9vSunF49sIiEZ0YD/T6qPJHbSANC3qyU2Qv5Ieu8AKI/4+EhzHEoTbH/4o5/jeTSJ5agvUj4tlEY6Keq62S+wMFD4BGU86MjfTXNUb57dU0F++mmaXYSct/tW5pejei8S7yNLadC8eXWB7lbuTs0a6DtDhQsm7zQ/CgDOMaLbWfAzCGGfj8N5MdmYnoqRfbr39SCbL1vcs7uRZ/2swExWbRPZfHvH1uIj+YtD1hdoBECSLhtLyJPwgNE4u3nSxY/kDZe7Dlyla2e5JG7MlaLYn5IqETnXVX6lHWaI0k19OABhyiRl4IbI8WXN9777UkZeYLfDT+slYUwbAdow0ckLCL2D4ImKudh0Sk/YhRCF6qgZScAnTd3lv9mHrt7Lf1KBlUsSqxArT4/2z/K3LxjXOCWyV1fhkNQTMl+q+EgqGv8ENehIreZ79t9r8GZEHOoN0pDfqQuNoynorm1LyLeqiMUXOGAkrX3zejlosVilx8O35ENdIig/3AtAA52/6ISAKX1FMS1kT5RuzEzwGjt7Q6LcNYwE6f5YduYetjCbeNKLaJJj7xvJtn3zhwizIo2eYvPag502LGmuP98WtXbEIHY1tFg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	24g8n7tOZF5VEjojChyEnlIJOJoaPggkNyN8+jtGS0r4usV7rbil+5hR2Q92iK+BL1Zq2fN9ImX2CaRMX9ypSXcrQja8yHCSOCQ3ryS+js5lG3PguRk4umEmFf0/4Vmm8rTEHpn7EHEJtaULaCWX7gt9Da5sNTL0+LJY5AZ2bP8WG5KSSMKxHC4IbRtbQuXqZ0/xXFeALjSJbVhRKhlQQSf+rp5K63yY1IIKNGp70NroomIIwkGL2l8pYAYgWRyRiDjLlgdQVc8qB8N89aH3FauOYm8rP2TetPdc55cIJ5BhDFWpsSMcH/haAXE5Sc9jrjYerStCa52OQz5Im7dM2lAd9VuMkqknCLyJb/M2ZP/+arlWoYeo1EpzvHLp7a/hNzgM9oUgUtXIYAmernbZ/5RimwKW8a8BbXshDDv0dFW5LVqN1zbsdslNQAqZA/AD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 17:17:11.8774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f469d4-4df3-40a8-853c-08df2e04d055
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000055.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

GSP firmware requires the VF BAR layout to route interrupts and doorbell
events to individual virtual functions.

When vGPU mode is enabled, read the VF topology from the typed PCI SR-IOV
extended capability and populate the existing NVKV VF information schema
in GSP_INIT.

Link: https://lore.kernel.org/nova-gpu/20260730181404.776028-2-zhiw@nvidia.com/
Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 34 +++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 159f132d79d9..9ad730e22337 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -225,6 +225,38 @@ struct DomainBusDevice(u64) {
 ];
 
 impl GspInitRequest {
+    fn build_vf_info(
+        dev: &pci::Device<device::Bound>,
+        vgpu_state: VgpuState,
+    ) -> Result<Option<VfInfo>> {
+        let total_vfs = match vgpu_state {
+            VgpuState::Disabled => return Ok(None),
+            VgpuState::Enabled { total_vfs } => total_vfs,
+        };
+
+        let sriov = dev
+            .config_space_extended()?
+            .find_ext_capability::<pci::ExtSriovRegs>()?
+            .ok_or(ENODEV)?;
+
+        let mut vf_bars = sriov.vf_bars()?;
+        let bar0 = vf_bars.next().ok_or(EINVAL)?;
+        let bar1 = vf_bars.next().ok_or(EINVAL)?;
+        let bar2 = vf_bars.next().ok_or(EINVAL)?;
+        let flags = u64::from(bar0.is_64bit)
+            | (u64::from(bar1.is_64bit) << 1)
+            | (u64::from(bar2.is_64bit) << 2);
+
+        Ok(Some(VfInfo {
+            total_vfs: u32::from(total_vfs.get()).into(),
+            first_vf_offset: u32::from(sriov.first_vf_offset()).into(),
+            flags: flags.into(),
+            first_bar0_address: bar0.address.into(),
+            first_bar1_address: bar1.address.into(),
+            first_bar2_address: bar2.address.into(),
+        }))
+    }
+
     /// Creates the request for `dev`.
     ///
     /// The registry keys are [`REGISTRY_ENTRIES`], plus `RMSetSriovMode` when `vgpu_state` reports
@@ -265,7 +297,7 @@ pub(crate) fn new(
             host_arch: HostArch::host().into(),
             domain_bus_device: u64::from(domain_bus_device).into(),
             regkeys,
-            vf_info: None,
+            vf_info: Self::build_vf_info(dev, vgpu_state)?,
         })
     }
 }
