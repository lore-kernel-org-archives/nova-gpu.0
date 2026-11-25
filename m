Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641922;
	b=i+//u6jOxn+IIMkfUmqOj0P1A/qAJaqZ1KR9XLnfFbCXf/Oi/1Gk4qIKHGQfwR+a4Uhq
	 65ORK2OxMPzaePKOFkG+bt+62MMM8AKEyZpfynFQhykSEaOIDij7zi9nSOajuiLiQYy7v
	 +seIMTyS7mIMmPO6oGTBDkZbQpx4zV8DmzB4+dhI/00jlQJYiTmnX7YDsV5ZaMNp/1R9j
	 Bcb1fA8roumLhU2lmTKt0rfHjLXxNh9rP0lA9E2QzvV85sUhtYV01wA18rQ2VSc6m1LWR
	 kpXfy6Fb4CIFpaU3/8iso3RM/Ky2MHTVMUlX2qdXQbPGEgUASWG8h6iX6cU5w2FxE2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641922;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=5p4zB1zztkanJg/d/me5Vb7eESnSwg5y0MyTB7L9/nk=;
	b=gOJ4SrKWQkQxiDYxFNNkaTPrQC/R9wKxiKCxU1BZUm9MvdtNzHT451d+zzfqhEQD57fg
	 kl9PByANQEKoCQFsZ++DfmzenMbQE6pNWnKUbyF9ZLboJGP92XwlhtEwnvQpLpaX4eJ02
	 gt0QrSAX7auRsMwSaGL6rX2BpR2/ACjhGk9HKqqR++KiWd2lIKNi4M2+pnzdp3l5hpimk
	 vkJE3xknks3fjMXMPvNM7Pak56Zz7uUaqUWFhoXQyRPr2D7gb5h+wsZikf2jVZ8MFNAgQ
	 aeuRxySS/KB4tOd4elk71uE0upO5votaDn3jYbMKC5grTAMRIgMDx0ZV+e0Yxpsrl0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UCBd6NrX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.60
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011060.outbound.protection.outlook.com [52.101.57.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796D606A683
	for <nova-gpu@lists.linux.dev>; Wed, 25 Nov 2026 21:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B796D606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UCBd6NrX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=beXNtwVL+SqBbv883ETeNve0R5eNII+/O5TsI/1pp0DvUCETNKUD3jBScAUKHwmzGAyhUW1Yz3gzI9niGSuMlcjav4GUCn8K2xoOUTgPX0V8LpqX/mcI0DXuzIUugomeTW5qUDcdRWVvmdyDlW1YQPcLwL9oEsSIIMEdl1wf72zjLzSUEsDCqZ8gj+A7ssYrUx4jjh35q9eda8bvoqLgDVCgVY4lBK/uonfZrfA0XW3+MJ0j6NBzz8IUZhL+0cFqZJTmXQXk/xorfLjCWq4mB0hENNMvxaOdp5Io4xNqTaTRTKfnWzc1R1DIyNTqWk4aSvharkd7vkW1RJAmNB92fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5p4zB1zztkanJg/d/me5Vb7eESnSwg5y0MyTB7L9/nk=;
 b=TKlC+vtXuPkzsw/UA2LwvTw6cUl0aLoys9awDtpeZiGBeLSYFdryySOSUVvGk/ZR8qwo7Mky6CrXSbiQAa/SIbaOnd2MhfYvoIasv7/StaY2zfaLSOYguGPcMfPdmTfkhAPplcKy35iI/ZIBRuqxRGblb7mzOrP0uezLwAZkLMw3L/y9aizIyUxo1SjIh/yxPpcWwOqV17SLsMfMMjZDp9dkGeKdWgiV6kySLnkxEOiqJnPEag2MP7ADMP/uv1FLBx4SC6amQqGGLJ62mn9Q/+c55hcbssKEBb0Rb+/ty6CFv0nwuSEsNcfzZdhYZU9bS1YYECP8XZ1WFovzvUFTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5p4zB1zztkanJg/d/me5Vb7eESnSwg5y0MyTB7L9/nk=;
 b=UCBd6NrX+riAOH2+AMPSo08d9KpVSnvN0e6icipU2L3XglMQTy2/gq2QMq5F2pAILesX9yyg+laaW+mWx448c2RAVf7b9AZE8c4dFTv4uD3GN9Dhj7VdJGtFGClr5Lr7Pn15AZoxL7v3wJomDs3UllnF++ndq47T4cYxxcUuZKDyBqHBNDlDhbNWBb1nnqr+/8uPJKkYZ+VLrc9NIU+/4Za8+aYQ9FSUFfWpmiPkLL4vhOrO/ZHu6vFtwwjHkYFcqq9+/Jsg7ZNLg5+yB8Y4ZfmMSq3h2K4xBcbTPw3npUHRt9/S7lf5j1Y1Xa01GNz5U/Cv70iuuWaVGth/SR/LVw==
Received: from CYZPR14CA0043.namprd14.prod.outlook.com (2603:10b6:930:a0::6)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 21:25:15 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:930:a0:cafe::65) by CYZPR14CA0043.outlook.office365.com
 (2603:10b6:930:a0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 21:25:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 21:25:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:25:00 -0800
Received: from ubuntu (10.126.230.37) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 13:24:59 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nova-gpu@lists.linux.dev>
Subject: [PATCH v4 1/7] gpu: nova-core: add Tlv.get_u64
Date: Wed, 25 Nov 2026 15:24:39 -0600
Message-ID: <20261125212445.620391-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125212445.620391-1-ttabi@nvidia.com>
References: <20261125212445.620391-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ac7c9e-5b77-48a7-c348-08df4b3a988c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|10067099003|56012099006|5023799004|11063799006|261022075727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eIX5zZk8hT4o1Z0qzEqshi0eMFecHwjqRMP9Z0FYqY4z/tDVjhzgYMtVKmOVu94+0iF0eVmwVXRlC+8GNIyxW1dImsYfu97iD/j3MN83sHYkejgDOB/jJViomxei23HO/umx7z0yUroxH97MNFSAEJOx8HFOzL/bqnCDnmRE2dyMyHVzCSu1qpU9tpSo63iI9SqnKm7dAo//auAZHfMI4sKk2klK/lzY9Sx0hwgrWk2GAANLLS30iqt8s53EjxHf80tqhQt4oDmU5z41yqSdvUUxDzntpIX/SA2tVX/ADcSht19LPsFKj5EUH79gqgkrdmlm3xTUoJLZr+VzrYnziJi2Lmkpf1FZm477s3qB/eMi5WGMuoFoZMDSoffXFQEx+S8jnxLpJZXC0l91vw2VNmOnMzFJK/WnjqF/R+/BEKq+c5YTYQo420HMaEuSLb4j5Nl29/RJh9y6Lv9WkiZbngP3yoNP4uxCOXnfq5KpIvFRg2qLfBLTxUEKQNAGgoNdBGpJBQS5sNoxPqU3Gt8ZcY/0pEAEViBJN9xmMf4oda0gxvu0Iu/ONGHVVhJj84qP++r5Lmuh1wXcfI16ad4DcK7NIzSx4JwcC200XARUyHBZ91yx6/M/nznSakJGSzPhKpa1qExdfz0Yi5FtTtQQFXX8elWuzuHxjwcCzH2rM4xsKWlvGuNPb7f+rV+OHITR1ZyLFhh26pJbu7enRSVlZw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(5023799004)(11063799006)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6a3AyHQ7Y3zClbfGGb8DDWZv+KbsDtlp0AdiKdM/NtPhqiUQs66fbE3vjQP+Ktsqsiwryru1MtjL8W8Toz/+/5PUugPwXapvgVy+T2d/YD1EI1EjhlKrKJ7hrDgt3BM4/3Siyns4ha7trMvXsb3AyjuxvZoJjUjsPXqDhNBhFuuhqnpJHMvqhPThpqgVI8AhEjvCwVPxJFwPKvgD4QC38tyZs4uugGjxwQ+PyXA48VO8leIxC4FqsefmKAktX9lI60LMfx2iyCtmTOH4bv3JvQQ0QUj/HvVH6T89M27mnY41qSyuAkRJidraL5JTYxmIthfgfOdp4p4ZymZ4/F9xXsNwwHq4DtKq3y2OL/Pledtvc+ufZNTrIYCslfvcpWj5mDGRFtgsfvklvwj+7g6QZeYFggIrrptKcTvQlfb5PXbPKZxTsxB0mPWxAp+4Jfq9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 21:25:14.8407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ac7c9e-5b77-48a7-c348-08df4b3a988c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359

Introduce get_u64() to support variable-sized TLV integers.  If the driver
expects that a particular tag might be a 64-bit value, it should use this
method read it.

TLVs can store unsigned integers in either 32-bit or 64-bit little-endian
format.  The script that generates TLV files is written in Python, and
Python integers are arbitrarily sized.  For any given integer, the script
will store it as a 32-bit integer if its value is less than 0x100000000,
without any regard to its purpose.  This means that the driver may not
know until runtime whether a given TLV integer is encoded as four bytes
or eight.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/firmware/tlv.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
index 7f278903dc8b..6a9b318454c4 100644
--- a/drivers/gpu/nova-core/firmware/tlv.rs
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -257,6 +257,20 @@ pub(crate) fn load_file(
             .ok_or(EINVAL)
     }
 
+    /// Return a u64, from either a 32-bit or 64-bit little-endian tag.
+    #[expect(unused)]
+    pub(crate) fn get_u64(&self, tag: &[u8; 4]) -> Result<u64> {
+        let value = self.find(tag)?.value;
+
+        if let Ok(bytes) = <[u8; 4]>::try_from(value) {
+            Ok(u64::from(u32::from_le_bytes(bytes)))
+        } else if let Ok(bytes) = <[u8; 8]>::try_from(value) {
+            Ok(u64::from_le_bytes(bytes))
+        } else {
+            Err(EINVAL)
+        }
+    }
+
     /// Return a string value.
     pub(crate) fn get_string(&self, tag: &[u8; 4]) -> Result<&'a str> {
         let tlv = self.find(tag)?;
-- 
2.56.1

