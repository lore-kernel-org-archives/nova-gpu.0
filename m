Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460942188A
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573483; cv=fail; b=GBopQrYD8RpKNE+HXoSdrKhq2BIBWHRvILFKuooRGle30ivCLkEQ26Ia28NVh9Z74m0Yeft8NhAuwTZSNOS+dDDoaBjMKP4o0fEPrqgd0ipOe2ZDlzZIsCPWHhA1iDy6tUee5VFVXjUTwBPen2G5Jb5QPPUo9/aP0QS+mOGuRbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573483; c=relaxed/simple;
	bh=smKzh4uWEbnmJjpDuDkrksUBwUUx6Idq4CtCYvuV8+4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lQ5Qxad2z+AvguSNLzowQ/8vuXkSPDeU5617zvyvuw/SbKLw/E/8amhLwZGNyPcaFb4A42/JXUh5BeavFoGin+rVZ/HG7hs9ArUUlvc2wKAjK/ok93Y5lzVFJxUF8E1RnVw18HnNsgTpH0CeX74+pzDTI1/hfwy/JBikFJsAzBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YTux1axh; arc=fail smtp.client-ip=40.93.196.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YTux1axh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/kE2kccvgp2YomPRbRwBPsXc5R0AxdI3u5UsH0CnwOVkYgYDAyC+TCNEOjOSsF3t622aRgIAfbhCXe0/HTyqkPfquZF70Nphrs0xD494JHlz67/JH5QwaJ0Ip6mvFwLhB5UWQrRfc2Ke7bZBhrqAjjJWS0OpA7SaaQ2gQ1T7tRZiWxXtTuvjHTW05bVUafGr206WyYyFlkbtGOGmfuxwp3cYpXbijN/DeKu/WhV4HVhkhCWYd9ncIAFQMsPOJW/JElCAeQ1PbcsJhRRMHfep35kN8E8MGKlF4n9HULlIbiR6wFEb0YZV3M+f9vIrQFfbPYeHfpwGpFjbOVieuXOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLumCXYscndUVVEFT6rR7kc1APDt5+nAoda0X2ITq1o=;
 b=yGeZhxzg1GVg0SHPb4m83bNEYX2khHkfXKYwX2YOmZpnnwraD7s2Y2AVWvQ5tq0sdjGFPQOe4rtIDDcKctoRELdWkvbH6mmkE2ChO9QAtiOrvSeEseAIn3P+iWkr5mKKbDkzFE3W4PrLZkGT39ubR7FPTaTpAPF2tocUaMInA9hQL8mIc7SFXBXOv0Uv8qvUxporBq1dMUl3vg1+zc+DWSTxu+0C8q7u7lwyqnBxTMh3RwXLn+sB7lAwf7P9UOep6kZtz1oDCtAZXjsiX6R3bmZRtSppLJUeVSF7rlnP9uETzon4EyosOaKJh28HcJ13zzmoQpQXvfU7JzDyrj3hLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLumCXYscndUVVEFT6rR7kc1APDt5+nAoda0X2ITq1o=;
 b=YTux1axhTulJoa6ebP0GJgqj8/8KWPVtlyI4wMEdvV6NCQvqO5Sd4+uAtgcl2xlolVSCwY1Jcv1pYxZTiSHy+zOj6u7FT1wg0aKOw7AQ3UyJSp+5Zlb3oeR32KESr/Kc2LrFOwmWFYiA2YBSIF99X93zEV9ztNzPIXiazkEUnwJVswqBnemUIhTly4KpIWa5o7yH05YlluMIWBNUvi7p/kumbFVr1r+NRXieUFxJo3Yu4m9CiwpdAZCZd04tqxXLyMpUzwnoRnHOgNAb8k/ztSW2MsOui4RMr/4G46q5/POlai6NmbI6FbQlzcVb/Oy+XRZ9pwb47qkFhv3Ae70SPw==
Received: from BLAP220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::8)
 by DS7PR12MB5959.namprd12.prod.outlook.com (2603:10b6:8:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 11:44:36 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::64) by BLAP220CA0003.outlook.office365.com
 (2603:10b6:208:32c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 11:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 11:44:35 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:23 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 04:44:22 -0700
Received: from inno-dell.mtl.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Thu, 4 Jun
 2026 04:44:14 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>
CC: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<jhubbard@nvidia.com>, <acourbot@nvidia.com>, <ecourtney@nvidia.com>,
	<joelagnelf@nvidia.com>, <apopple@nvidia.com>, <cjia@nvidia.com>,
	<smitra@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 3/9] gpu: nova-core: return FSP response buffer to caller
Date: Thu, 4 Jun 2026 14:43:33 +0300
Message-ID: <20260604114339.1565660-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260604114339.1565660-1-zhiw@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|DS7PR12MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c51b62-0777-43fe-3b3f-08dec22ea715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	gKFzx50KWm768MnJhTPYQtdz1kbBwBo7Jz5MA83hJmRM4iWkmRO4wKZI3E818ENZ//B9hso0qEimkZD7w65NIPZFr/NI0xU1ua3uZwmgrQCVUUv8xYeXnEf8jYW/wOxP3mUYN97boEj2AwI1Ea/gZhTJP2eDIV/VFpLihWp+2nNcq+AyS8lEnJd4hNFreLWWBvGZ3bUfeKVTHf2nOP+8jWLO3CoEtXYzPFx2UCn9u98Bt0Fi1S6ng6G6LZaMJmQTy0qLj7mX0K+NO+f2n2uxblsZxt45VT9w/YKqi6sZW86V0mjK4jBfm9ZYuv/KOHs2eV2GJuKcDDSc1J/i94+c1kWR7fAS/VLEu3L20wjWNfreQWeBqE7kpCnqJxHJ0p4F2aw46dq6eoh2IKqJyTQ+qlnaiAJYumMjzAtJ9XcpBXHBvRYGDVu5BjGbP0MXiXRZKUIk9XC/K5nb5ZQkYs6ihEdu+EcSHHny48y8xAku8M/ry31YpIbWb1SM+WSJSWfKmeTYll8jSw2/2lQgAGvJ5hfCsc0gWXQhCNC19CO3oDiTrzEGGjOPBLSPwneCvpiuIJG75PB18t3HTKeRJrZ3zeW8crilAYiJBNmw6v1asvisEY7juFQPrEWZ2+jDdvSqaoWsQHOGfipc6zDMnJLipMK6Vh3xfkxDHtFy0LqNY1tlDlwys7tGBSGl/q3/tN0oaSzcxOtPyIA8p5z0oMoEuVwJ95vJnNucz//Eh2CtlfM=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZIS4zFJtNoys6MoIFxtnARTuSb2EDnCRMLAcOv0k6RpHuQg+3G2Ps5XApRFzJ8R4VcICHK8WzVVPeYz7s5pU0bv8S9v1dbBGPVQPu8KG/y3FnAe6IsP3hsHX00fgRqa4zukT6XqyAyIJrGhB6bbKrVqQATGu+aB865vqooUWHqPFw+OggR/ncFu/G1+LqNwMjwaFWLOZxKlQVJaKPHtthdgGfW5QqUbuvEMxkafoP5vo411tx5VVJPzgQ15F47fuUvR5qbV6IxBZLdz5DSh8pwG2JxTkFPVxZs16yPIeWtkGnv7Fyae4Tw5WZEjHEM+zJfiRXkYuTttVOQxXvGDay4Z1780IK9++ee6ltqot+0TN9Sex7saXMMFcqZ51ND6bWvwboUeZqw1BvUiJJePNBcmzCNxeTSmIGQiVgC63kMu8njBVtj+Vn/rPslgErkth
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 11:44:35.8672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c51b62-0777-43fe-3b3f-08dec22ea715
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5959

Change send_sync_fsp() to return the raw response buffer after
validating the common MCTP/NVDM headers and error code. This allows
callers to perform protocol-specific parsing on the response payload,
which is needed for the upcoming PRC protocol support.

For the existing COT caller, the response buffer is unused.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 78b90bfbfba4..5fd2e9e277b1 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -257,7 +257,8 @@ pub(crate) fn wait_secure_boot(
     }
 
     /// Sends a message to FSP and waits for the response.
-    fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: Bar0<'_>, msg: &M) -> Result
+    /// Returns the full response buffer on success.
+    fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: Bar0<'_>, msg: &M) -> Result<KVec<u8>>
     where
         M: MessageToFsp,
     {
@@ -315,7 +316,7 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: Bar0<'_>, msg: &M) ->
             return Err(EIO);
         }
 
-        Ok(())
+        Ok(response_buf)
     }
 
     /// Boots GSP FMC via FSP Chain of Trust.
@@ -336,7 +337,7 @@ pub(crate) fn boot_fmc(
             GFP_KERNEL,
         )?;
 
-        self.send_sync_fsp(dev, bar, &*msg)?;
+        let _response_buf = self.send_sync_fsp(dev, bar, &*msg)?;
 
         dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
         Ok(())
-- 
2.51.0

