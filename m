Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011070.outbound.protection.outlook.com [40.93.194.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABAC383999
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781134897; cv=fail; b=LP9oVkNH0RAp8XMwRhA/6TpuE2MS0p02qc/jWm+ufyDrr0oTHctU9e0JiXtEEul1pJpqePuexHOHq3NETVg3ANrw5WMcuq1V/U58/dG3jSmMALvA9YSneSRQo7qHWfLKjSTCXcNqa80VRunzbrx8jizGk3ZLFugEGcr8wkxUU3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781134897; c=relaxed/simple;
	bh=hVnAtA4WvyRV/P1FYH8PMEbSeBw4B/iAX/Hj5OsJC0E=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BTJUIHpk09Zeub8s3POD+dpsPTe4zCJBKoqlv2sF+8UaKc+jjid6rzTIOnX7bLUYm6BppdmxqBdsaaUredhyDGmVIthGy7loSrL2e218mULSLNYsdMHlOJtiONu2dfYoGLXc/tafiyUwHEr9QJ0ivvaEO714aLN0RpFSR1NM6os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GpXBCLRF; arc=fail smtp.client-ip=40.93.194.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GpXBCLRF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAvGOCyRNA/bRdvdsllfsxoZ8Et7+wmw1PNPj8i9LsOjvLgpQezNYa/Kt9PHNEzjTDM+t6oCZDcTLHL1+ujRDO93Pj3FS/IlR+C7ALZ9YrbZiV9s/wBsuGKXy+bRnf1N5pxw7Z011ebR/l9UGo/p7PjIGVFiOVIJraGOMye9CHvhUPhe3F8qOQxghzBNxOcFtADJhCfI0iKy8sXWfbXkPhf+C/txLdjWanq0cU+JEdEX3BzSDmETH333JO1OcDZ32AXaFn2ZMVWrKMEQuSNd31fiHc4xKOGvP81OpZ9r7GIivTCWKNH13uaEBsT7HRy/xyGNTmx2SNzJJwrSsJ6h1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dds+fpz6hCaS1zNp/MHSYT64xAWjiGVadLHjO+V8wsk=;
 b=QFqEkSNujN7Rh90ZFvP4g+1A/7nuHumvljus6FvhiV/eZYjI0ozaMmYq+POKqZ2G65ZHYmkTB9FI34aXAJk2VUZYYTPAYxF25u6dWPIeWSfDQnJ5qbTiOgsMDzyFvIAWfEzlf69ftMjrNAta7HKCCRLt/4wdqitNpHgqD1bbHYgvY8eggrN8vo1Lok/JTfmeZyMRKhHGnd9+qtKDJrD64z4ht2+GitH0Ssey7nPi7rnZ0TmuKbtOPlhvcus3TVcgyamGLW3GLnjvR/S32w9uLFLaxaf8kOVtVs+jDH+unvHArFxKPXK2NgRoYNpbfk8/gPJfITu8pc/9JC8m/SiH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dds+fpz6hCaS1zNp/MHSYT64xAWjiGVadLHjO+V8wsk=;
 b=GpXBCLRFhFQWsLd+6aDnOdPAsqJfBaw9nlArp7lnpCM3SxtQQd6oZFQeoAMCgkGJBM18ePPYQHRc9CpSPv3DinYD/QmgAERpfxhzjGVwBU6hL99wRivlapGsaJiqn3h156LuUYSpvZELsFUNwgS8KPun+qzbqlh8VI+THUnv32bslfxWTtfol2tU/zepLvKFCb2HCv3Am1/S5799UTXv28IIRa7F0rdnUvuYxPu7+x7wqk5HKRVDqycEYUhiLnfAaoZGKJ2yYmKocR7g7DsSVu6XZmAS2touN9cRVGb5EKubBRsGDE2RXy+rdN+rUp5y2NDCJxPhHLrIE7btDLryOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 23:41:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 23:41:31 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH] gpu: nova-core: clarify FSP ordering in the chipset table
Date: Wed, 10 Jun 2026 16:41:28 -0700
Message-ID: <20260610234128.547952-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW5PR12MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb03c4a-2791-47e9-8906-08dec749ccba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	lG2jhKDt8TcZrbkyvqAyU0lD3Rqiyug+6M1sllp2rXPQZws4G3h1mthvv2AzNXgO/JSQTGY/7AVcnY+16QzPGRDjgtKHhk9j+yg8Eb2+u9LorOwGPvs+9/IvYu0dOuzxB38q8Q2VLRwIkmnDNLr73vhmHjYHNcZ/fxd7/vErLu6iezKFLotPhyRelW1dUZbGj/mU7NN2HpBWob01fr/FpynEw73BCljvyZMkyQM9zrA7DlHijMlEGJ0gWDuS5Rlru70GTzRfGRSIj1B7Il1SGQQ4yZo7jlvCz7OrqchahNTOIt+kcD90jx5XM0OMhUg58zZ6wY8jkEPOf+Dq9TUuIALasEQyMxEC2Fm62DjZSJI7vJXT7O3kLygOqJrCc0jfXSZFXLo7lab5gOlnqpsLJL3wicJJVPxKr07a43VBIVw7NUMSe4pMvQX5VQukJ89/uy/dbKiw+iEDL86b9d/9uCa6eLRAZEHxOVpc/gqUbUr98wC2W4Y18+IYkIPVZnL5Blcyapz9NZBvy2+LsUn/w2V75aDecftJPjAs69Mggj3naB8c1kL2+DyzIINmvX1iC3wzBS7xjuxQU2WaVKVpyJVa8rgn2y69rgadG8CYPgM9HWtk+e1WGOaSQCMzdOCfAcBYWzBd6kpmb6Nx+jhe3aAo7Qo9w1oQsLa1gErhNlK7vkDqU9rFGwQeY6VrFhLHnGkM8iE8heH2ZobBObIExQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6FsFaZWEDH4CHz+FQr+M6hIXViWsNm1GXAkphQnCY8ZqA5vgVeIANp6ZoLjU?=
 =?us-ascii?Q?jaYEksr3PN9YJXwANeaMrodS9dAPDGsY2B/+hfX5hvsBBU47yrB5kTTW60kn?=
 =?us-ascii?Q?Wxvpr8WjRD+IEN4atnm+bMYYr491zEuDyYYhjKxpcW0kSRaSMQenDlSt+sW3?=
 =?us-ascii?Q?vgT0WCYi0Dy/rWYur2btHy7Se4m3wfGXA7zAzvbNqJX4Istk+AExMAXqZDg6?=
 =?us-ascii?Q?j6ShXsxWxd9N3B3f5G12MWxt7N00vbsG/XwEvh4/RV/EorZpBifQDmxl7r2N?=
 =?us-ascii?Q?mqrk2WeT6hFcvacSdvmxAp/8c+MLJqsOlmbtExu7qDw1e3Tmb9lvxHKxPWcT?=
 =?us-ascii?Q?6HGL0E8PDxeyO/LLwC67rG9K0yfLOqRL9YPtzvG1N5jtwdiRdEwfxvbnSGSA?=
 =?us-ascii?Q?IDxrITqL5h9P8qWszpMlZy8V8q4HAl78oIgdkN/qGokz+Su/luDht7XSjfGp?=
 =?us-ascii?Q?B4+IpEb8iRJbBchGmYewllAJEvhDZK3DEn1dDnkmjqR3B9S1v4Vunx1DCWJY?=
 =?us-ascii?Q?s/C54eoFqxIcYl1RAzdtrzFxM2d+KPVhVL6BGxgbLvMeJ9ExuNkxgCJNLGUe?=
 =?us-ascii?Q?JW9fzQQ9/pJIS1mjKfaEn46ePCfmJeVEDjIZRBX+zBPyADtirFXeKKJ972vm?=
 =?us-ascii?Q?F/tFmdDzKyxItSp2gC/yG4PjKRVqAlByC6IRvWJetVCpwZmNLhhy4MrjmFHb?=
 =?us-ascii?Q?Payne26msHZP4+o7VCkCTeuilP+v84meiZ3BkcexdeUNiD4BB9gmpsC8rTnj?=
 =?us-ascii?Q?5GqLjcRjxK5aRsfdGy7nk0sbGN2H+iew2HMjXh2EmuvWmmnBaIjVwGOE20XG?=
 =?us-ascii?Q?Pluqvm8I9/Y6riyvvG1RNUgqvOweJrHx6Vt6iMdfFchVSaalXDCtkgUJrylF?=
 =?us-ascii?Q?YLajkFHeZeEvMnkXGRg92ftvWOpaC/s7OLBkmYBZnd9xR0a416ZgHbQNt4SS?=
 =?us-ascii?Q?Gmwesjz9Pivrlp87dwn0zreO62o3CjuxS6dxNdos643G0WITsebBflqOu6Hl?=
 =?us-ascii?Q?s4LKZjW3Wb5yGeS9a4dQQdfgFQ9i4Ipwsv8vxtIIO4bBavClI0C1QTl5l+uS?=
 =?us-ascii?Q?9LMxLylscAe2dcq05NcQEBoMFxYBEBLPGfVYyj/3yZ9LWG4yrPMbzrr7rXTt?=
 =?us-ascii?Q?OqLkgV9O+5F9zyKmSsKR/AngDbxuBAEuRwqmUumcFTDn0zz4/vYti7LB5+Qk?=
 =?us-ascii?Q?Dhe4vpqNxnl1tg8M62SJooUAwPvVGH7NSW1gjz3HCh1PVahV17ZL8wzZz6ai?=
 =?us-ascii?Q?mVpzAUeEVubfgyjkiP33xtGvbs9MbkO7+0yKDjEo0pDIxXZ1+PyTOejNFE8i?=
 =?us-ascii?Q?HlBRXE40tyVsXwuubOGTqsUWBIGX1S0x9vQoUmpmHFGfwcyjXXRfQLKbBuWH?=
 =?us-ascii?Q?7iBypigXGY8P5NMJKqteF9PWvXyttNOag2Qj+Q7QFNDgMJRBr73f+UF9cYMq?=
 =?us-ascii?Q?jkZ/63TdT1MEgJFf8CTHOjq+P3eiHSWIlPg7TmjEcc/hOhbqdDMhPTRa5M1N?=
 =?us-ascii?Q?Pmi/EaqmmJWv/BlByP6qpHH3cshQVSCRq+Td2nr7sQ8y0ARjL9cl+Y2zBU9c?=
 =?us-ascii?Q?4nPSRcvYQuvR0jhJ5eIPFiNEf0rL8TgahNl+Ubh6JnPRaZ8T/CmJDYOhbXT6?=
 =?us-ascii?Q?ZLAmK1p6l3zKSKhQZZsxBSAqSDbAELEtPIcduGN6vTpGwgQfxW3cWBlDzSBh?=
 =?us-ascii?Q?XcF2P1702X7Xq/xX2oc/46Ysunzz8UoRRixqjxhFrR7z0UXfAakmZvrRXuEA?=
 =?us-ascii?Q?GiezzoDGIg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb03c4a-2791-47e9-8906-08dec749ccba
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 23:41:31.6178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZI7vHsiNa1Wi7gLEDekD1qQnHoUUGsdN4xgipxz2uthbP2fpwJAAKuvtFedOXoSlNSwvgc2qnQY2D32Yxl5UaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650

The Chipset enum lists GPUs in chip-ID order, but FSP capability does
not follow that order. Hopper and Blackwell boot the GSP via FSP, while
Ada, whose chip IDs fall numerically between Hopper and Blackwell, uses
the older SEC2 booter path instead. Add a comment so the table ordering
does not suggest that everything past Hopper uses FSP.

Suggested-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
Hi,

As mentioned here [1], this is a follow up patch.

[1] https://lore.kernel.org/1022c9e9-7d90-498a-b420-64b945f93c74@nvidia.com

thanks,
John Hubbard


 drivers/gpu/nova-core/gpu.rs | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b3c91731db45..b9451d0d5e15 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -91,6 +91,10 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Chipsets are listed in chip-ID order, which does not track FSP
+    // capability. Hopper (GH100) and Blackwell (GB10x/GB20x) boot the GSP
+    // via FSP, but Ada (AD10x), whose chip IDs fall between them, does not.
+    // See Chipset::uses_fsp().
     // Hopper
     GH100 = 0x180,
     // Ada
@@ -137,8 +141,8 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
         matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
     }
 
-    /// Returns `true` if this chipset boots via FSP (Hopper and later), which requires the FMC
-    /// firmware image.
+    /// Returns `true` if this chipset boots via FSP (Hopper and Blackwell, but not Ada), which
+    /// requires the FMC firmware image.
     pub(crate) const fn uses_fsp(self) -> bool {
         matches!(
             self.arch(),

base-commit: 550dc7536644db2d67c6f8cf525bba682fba08d9
-- 
2.54.0

