Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6382336B920
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693659; cv=fail; b=omQlYqukezeJQyGFER0YJQyfNuY4rg/QK++Jf6NqYQsKN9mAF4i7E3DlF6vzE8lcnTIwjfvxYZI7SqtUHcGDdUw85mk+QrptVqaf8iX8a49bHm8CS1DFYehOF0W61Ryb7RvVULabwUjRY2gBZyiGGpfF1YCuAbHw075/s672uAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693659; c=relaxed/simple;
	bh=HXx5wjLH6TsxeBAKuoUtbCvJoLsLPQdfWmnf6/0ebdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PaRL0IbzvJyb7uVpIPyWfFA9SvV/OPHDahs2KgEeBu/R580B06WVbCiu02kUBoetdpE11S65Bd2sY7l2c3bCsUUGVC3VGGhs4PxzFOH4nk0Fc2x+u91rZ7jw7CB78vao8BEgqV+THiDYtjLwBU3e7SkxsBDkrywBWyiRnQcOrk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MkzCHQTp; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MkzCHQTp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yF4jySZxCtszxU63Op7ypibIBhElx9RTSJDUIpAwCkn0606lOLGCiVoefHS5qijGd6jX3D3GTDdZLVGMxNKxF20PVmtL2RSO+7JQEk1NnZ2udqaduRUDqAvLwkwBpaFELJ9gRLbJ0kic192dCBETk++8hCHXjPpctHpulvIpyTgSh7khvquM8LBD1D//ztBPGmDc02TA6z5PTBrR0axjxsJqtTCrF+5JapCMLeYNo9W0ZSo7eVVNetO4mlCRkOEQ+H50rs2CfaQDvRMvQlWdmTlRvn5/98KUMEghUh2WJd3ySx4szq1ZY/f0chRI5CJOyOvLvvuZWcjPrdZ9tzxgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGye06Gsj3GvvmquZ8oJM8mVCjRgjWCvhgjGt4UAcQw=;
 b=PuGE9p7UIkNnZ+JzfBuhInh4DVdoTvOI9rFLyI50p3Yq5/IChCIaDO+FJBKfufQqHSsZVQvxBmhcOhvHSTALqpsbgpvL0Wx/4v2pbiwiV/CUuny08gpsK5P/CkAR/nYx0l5EcOXorEL2P1jaT8MPvTZDN10fj3dYXUn2b0vDfSSIY6CH3vjHEAoWRUyzj+X0khVzya6PKLDKMV2WYGA1a1oa6dPP1rlbKNMIcP5d/24JKQTxh1fxS6ENy1EvF21JuaE2Af1ioWNfKBbZKEZ14TbrW6cThAXIbaT8OK5+4CyZnxEhOS6X8t2VOAZFMsB/TKlLV403ToxFMC/mGvbKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGye06Gsj3GvvmquZ8oJM8mVCjRgjWCvhgjGt4UAcQw=;
 b=MkzCHQTpvtH7WwcJAvO4IQBB/F8ablZbZVoKOxLMPB1Ys7LQU++IXNDkf2SfONw8Pyr+bPiD90wM33UfDBKaDo05ZfVaVD8zREUMwYf0ULQ8dRPq+/8bhWUhyoRnRc9rI43F4JLkV4FOjLsroZKpqG7H+vd5eSG9oCkmhoiosktX0tHNqEWYQy56jZIg/OvRQRtHkh9kVtY+UHJB9N93PVATuNRQFhyXMKwKS3Ed8Lah6y0NE1kU43ncJg/ZFrquK1pyRGdXA6QMnAArAbVS1rlq7Q0eBUSTE2gOsoKgKqqxtYWgtqVcjyIVlD5B7ZDWCHfPqv+RX0rkvdPEULMB1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:28 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
Subject: [PATCH v3 02/33] gpu: nova-core: set MCTP transport header version to 1
Date: Thu, 17 Sep 2026 18:06:48 -0700
Message-ID: <20260918010719.1176945-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 4254a091-3a96-413e-4d91-08df15213461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qM0SWxeMBz5XXHKNrn3jqdviv8Q+xDdbPzA6ns3pi2mIPQ/VZp0yp28j8UhfMyPv5BrhN3uRSjPnKiegj1i102dSnCW5DRV2jdtJLDjbG7eQsH+E35+0N+a8rNj8hwGxZYDYmF0vTvmQu/B8V+YgBUIHkuC6Q+ZHx1qqwdADjVpCqtWmBWcnf04x23FFVfexqca1RQOuY5wWVb275s7FU7wHbRzXPU2kNRcl3k3bcaS4pcIziYg7DyRUL28rIYXJrIiF823sNk/WMli1iHQPGm530QPPb/NOHCzqJW7Xk6T9xCHVj9R/IU/pPthhs5alpTAzmpS46maCBl2i9VQ9SGSRPY3rigHwsN+o3+Q9vx1I4a++9VvZkKIMdv+q8/DXnMwGpqTNzOHiZSEkZwYAb9PAQQLLTuPGfcNlj7v7AycBGNSx4NQwT1nL+/gjocYtbHwcw6mvOrDp57RYBcL915bszcDLjMyLIJP204Poiuvy++JaFgQm41jgurevyofhD8IVHg8vy1Qz+C37ZiS92/IrK8ButPSklbhru7beepgjyCCISscPfwvt7vpp/P6ZV1jxNo9OtRVP7DBrKuadZ6VBWNHFLRdv9nNYqkCWpQI6gcQC5WAYgfEgbapKZOLsqELMczS2kLIrH2lqKdyq+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G7uAVWhQ2PiIjk6SRBT/qJSgQijzmNUxJu3IdGAqBg7Qz8C9+IidFNjUdAYM?=
 =?us-ascii?Q?yRJULwIBMRDhjuL8OLYdmSkcuYMgyHpHrlFQEKlC5T2SlHtI9nk78yl0MjIQ?=
 =?us-ascii?Q?Mcrad1QQ0hT3XU0aHvhmUXnME7mgZUBj16vH/2ChdPA3gEyiMdtzeGxmcNUn?=
 =?us-ascii?Q?BZjsKZ51kfxBv35U1/K8fraIcDmytVAxeLG9UkpU2MMR9HwRWBSFz5dIxFtS?=
 =?us-ascii?Q?mbvie3Wc1MuSnhwd+i+e6gOrjXYZHBgxOa3xcHjpe4fqdFqE42RBenRzk+cj?=
 =?us-ascii?Q?o8WmKasg2WzFvm8pi0yerZ1QCDnsbCn3+IVITz1zTqJMNWteSMyEYG1uT2lQ?=
 =?us-ascii?Q?gjB5AzXmiUIqNK7AdMc6pObtzbAlplCeYYyS2BY8I+YfmxZRR9BwuyvtCVC+?=
 =?us-ascii?Q?TUbcJgZso1TvKXhvEoalu2PqotbPjEvpcaR7I23U0ZJ7fdR8bocljK0vWbsD?=
 =?us-ascii?Q?8FcrzMgO1iYVPamu4OCSEjwmV2+TRHW56vK0M6q3UMllk7JZelflg9fgomBy?=
 =?us-ascii?Q?iDjXwslofEGLFkGTexLR6Hf9yeoqF/CmJ5QrPbGpvjFhJ7YK95ujwDveNkvR?=
 =?us-ascii?Q?1fcAEEvca31zInqN7sf0lo4PYatkBHXYb5rGM168HP+6xvygv81t6/bUjgA3?=
 =?us-ascii?Q?MpsSquSuKGEOuh1Va5mVbfW+6jVcF9uZkX2Rq/vB7APoqS1VrL2IC5f/v0u4?=
 =?us-ascii?Q?hv4gfHzjdziyeR7fRxOVjugCe/7kggaHItsGZGSdUh3fGmPbIkkWIWddqkLQ?=
 =?us-ascii?Q?eOqX49O1ppk62zwXI/GAEObz8yeQ5RNjBTI1b1VbuQewuRtDcpFvvaogamv0?=
 =?us-ascii?Q?Xlua1GBVOjU1LFbjT0JJXe36WH8QOua8o4zQBBBnF687eyNvsP/GcC7zgw+p?=
 =?us-ascii?Q?v4bCq1eyFs6EObFp5KN7bAC3brXFADtkcuoJwZsvOc46oi+kTouIXF8ks4dQ?=
 =?us-ascii?Q?qPFwl5i2NG0oPWoWKZkKcuwzU2KAteiFhgU0Yvul1lQe9cDHM+dgKmxWZkI0?=
 =?us-ascii?Q?PYQtXB1GZxuy1EXXf/tOCkeyJNnFOHPOwdJ7Mxp5jTGLcj7cmMnPgA8RhxIY?=
 =?us-ascii?Q?Zbr4hZBA/CuQ3O6jtsBiTkt4GG9eUWIGZaWZFCMGUueCa76MRNSeu7oYsxxT?=
 =?us-ascii?Q?PiPEqOkYvAhhQzqhoWqkhm90SC4+zNu8dVq3GscN3VelHqep4GYD3yG1Fnnl?=
 =?us-ascii?Q?wnbeKylPdTtifJa6wniIiCfFh7hlXFZ3K6OWbIUwDFeBSp91SLmfSx+YAJ+A?=
 =?us-ascii?Q?760rwjz+aqKSH3XjzCOrKmM0Sx4sqMMF6GIrsrSQq8Gr0LU640q4cAatzkOR?=
 =?us-ascii?Q?fNov5I1VQCGlty9+i9J6DvGs5vX/kLd/0tdkKGbJd0H7MtVlZnWjj4joFeyj?=
 =?us-ascii?Q?txC00Mkes2rZGdFBjrfxeMafjQl2JgRFEJxF8L3k4rfKI5B7JZ5MQ04A7zNH?=
 =?us-ascii?Q?TFOF612qCM2TOQJ95pfa293biDflzX4j25eZJJ6KTFGdVSPzRTtUMGCVABkL?=
 =?us-ascii?Q?OCvXTpfYH67WazYjK5qz0wNOhieHHTDBNwiX3tYVpAR9FcCYMRmWnYOOCwLx?=
 =?us-ascii?Q?2Inor/A5ymPwtYMQA9vyk0Z3/l3PtqkyDbmVI8RMVawwwo56tcFHI7OZSH3+?=
 =?us-ascii?Q?BpPzJSjscTMAqtQsXgHIoWgmYqBk6MKAD7Tn1ap/2W5o52pz7vqJP6SD0Fvi?=
 =?us-ascii?Q?LTmIvsUj1lIhpo/XDiMmRZZ4rNzKy9c0SvU06y3yDF66cPWRvCe6GJNNNqhl?=
 =?us-ascii?Q?0+kn+ttZBQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4254a091-3a96-413e-4d91-08df15213461
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:26.8757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQf0etWopukMblkxuKu4l823h0l1VH51APfHNQOrXSLjVgstNkp2MTIk7qGrtpNgkYPY8VLrfow11sOpTDPNKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

FSP, the GPU's Foundation Security Processor, receives the driver's
messages as packets of MCTP, the Management Component Transport
Protocol. It requires header version 1 in bits 3:0 of the MCTP transport
header.

Nova-core left those bits at zero, so every Chain of Trust request and
every Product Reconfiguration Control request that it sent carried an
invalid transport header.

Declare the version field and set it. Declare the destination endpoint
ID field as well. The driver leaves that field at zero.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/nova/core/fsp.rst |  2 ++
 drivers/gpu/nova-core/mctp.rs       | 15 +++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/nova/core/fsp.rst b/Documentation/gpu/nova/core/fsp.rst
index 52d618d22bb8..60c647181da0 100644
--- a/Documentation/gpu/nova/core/fsp.rst
+++ b/Documentation/gpu/nova/core/fsp.rst
@@ -106,6 +106,8 @@ All FSP messages share a common header format consisting of two 32-bit words:
 - Bit 30: EOM (End of Message)
 - Bits 29:28: Packet sequence number
 - Bits 23:16: Source Endpoint ID
+- Bits 15:8: Destination Endpoint ID
+- Bits 3:0: MCTP header version (1)
 
 **NVDM header** (NVIDIA Vendor Defined Message):
 
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 90c642c91a72..a3872a740233 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -42,13 +42,24 @@ pub(crate) struct MctpHeader(u32) {
         29:28 seq;
         /// Source endpoint ID.
         23:16 seid;
+        /// Destination endpoint ID.
+        15:8 deid;
+        /// MCTP header version.
+        3:0 version;
     }
 }
 
 impl MctpHeader {
-    /// Builds a single-packet MCTP header (`SOM=1`, `EOM=1`, `SEQ=0`, `SEID=0`).
+    /// The MCTP header version that this driver uses.
+    const VERSION: u32 = 1;
+
+    /// Builds the MCTP header of a message that fits in one packet: `SOM` and `EOM` set, the
+    /// version set, and every other field zero.
     pub(crate) fn single_packet() -> Self {
-        Self::zeroed().with_som(true).with_eom(true)
+        Self::zeroed()
+            .with_const_version::<{ Self::VERSION }>()
+            .with_som(true)
+            .with_eom(true)
     }
 
     /// Returns whether this is a complete single-packet message (`SOM=1` and `EOM=1`).
-- 
2.55.0

