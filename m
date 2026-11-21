Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795221089;
	b=pxzk0TuF5UnAWtN1CxXnDdoN43cHomXXqzL08pPbh/E3EkfBHOxPQe8gXgGwqvvj1vYd
	 qhdMoMOz5UaoKw6v0kOinybYWj8mNlI4WTqo+bGcrzT27f3LsGUKFvRjz0U1KUMZuMhPN
	 xWee5hkHRnLOMr0Ze0isb5xnoljDhj2ZRjsRXxU3w9HndNWjm2JZJz4yk839cMMs0660z
	 96cwXldmASrgckhDLC+ndf5rhaTZGGOQAaOm46t6Q/2UJyQTPFc3+T+3OQqgrQJ5o/lJI
	 tVWeho9pGIdLenyF+9KEtmzuuNz+9zqgkGm6dvSkuZA/T8JgH9zoFNXy28Sq9+n4FIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221089;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=XJ2zx2Ojw6vH62reTjrPvwJ1rRy19GLOAXBXcFq/cgk=;
	b=P9Mgt+0AaAuXsc1HS9JsJQU/NpZKWPjsW9JFo3hNzy0g4ubWCAHK894UwoRthCI4sE5e
	 6/LGVyc0v8O0cqRm9iYpAIEDhX6cjjOepwthiDovDoHKxcuaEdYpsaiXPiewTrZreGRV5
	 iieVho4+oe1T1IXhIB5Kiy+qgwaKDQydfzCkTN09R2c35MmatezN2tnmvaz6dLspWSRns
	 WohcZPo/80FQw59KEYCqwYVBCHMvxmFEzcu+M++jALo6RydkHUHru+XHmIVcHXHOc9ntG
	 GOxm4fbomHRL0QO/KJEVFaL9qnM78s6dWL9XFRTd9aRvWiGiJbMBs03GN5eL0yWx32w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jAMlZYYX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.51
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC86D606A6A1
	for <nova-gpu@lists.linux.dev>; Sat, 21 Nov 2026 00:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC86D606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jAMlZYYX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjt3tijpcYQPxzBjXO/vy0UR11STNvbLbXTnOe+dGwZ9lyY44RDl/mAaDrZpbH/MsoVUamsjTQJGG1WR3T68pYvQ3HNvCGYbQ2IB6py8zLVa4Z9wPLuu2gkT/e/OkvrWepHCrDb2/mauarWK1endLJTx0quVklvO2M7/bcqbwHa5WkqwH6hkb6KttOG/2oCuq8u+XeJRbaWGzWzxHcNnEk0hsxo1iVX0ZpL26w8aENzlm8Prgg7JjI5saVu3RJiFr7/zWJBkuek/ywRZRr8LpnLwwsP73OUKgHQYvGa1EZbuB+VPv9RgFQmNgCx9YA33oS7fzTCO5Mgzv1hQq3aVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJ2zx2Ojw6vH62reTjrPvwJ1rRy19GLOAXBXcFq/cgk=;
 b=G9UNKU0YDnF8QOtdQLIGapr0N1yOR7xV88D6Rg8PcIUM/2pu/PUzOEj4DsfjdDIYPt4DYMBEWYcsUNnhAtONc7tO8fQTsBbC8bngX5Uy50SlA17s+zRcXhYClzGxIIMIDoMAZxgVGM9OMLDLAscFFa9/BnI/pCYQhI9xHYQLU2+M3QsU535+/UnAR2RmcXspx+6jPxSCK+ou+rNtNbLYMIy88NDd8Kb9ylDN+GTuI8VRdKOd6e8Yay2y/fOmSycwARD+PY3qdDdwaIyfO+EMTgIj9pqoxLFXwt+tWJZUUgUzbD9QLZNJkfaWKTWoaWC1pZCq1h2hP19Zvc1XDQXAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJ2zx2Ojw6vH62reTjrPvwJ1rRy19GLOAXBXcFq/cgk=;
 b=jAMlZYYXMUOuAH2oR3UeAFsXpUfOZdGUVKXeXBMy4HCWoDNwErd249w3x0U2O7eQ4KP7njwj42HEJYqgTEC2DIWegBvbDRxkOuTGzYfFJunAWgy+hs35wJAwMdc80ErPtVjL6BKwW9xklMT2h02H4sVGD5HJZ6+8bQooBWHktfS4c7At10jrKLENH1EPADTTogb0MW5fR29qa6cL2lJ+lQ0piVMO7cR3CCIiQRxjHPnfkX9CNhcpxS7BZ0/UzPs1cw17JefqVSEk70tmldI+FxFvbMIVUWgj+4mGEznttUaVgHR2yi7ApywZTVxkJqrTH2RP3tAjHpG5jnTSdCh1Hg==
Received: from PH0PR07CA0071.namprd07.prod.outlook.com (2603:10b6:510:f::16)
 by DS0PR12MB8320.namprd12.prod.outlook.com (2603:10b6:8:f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Sat, 21 Nov
 2026 00:29:18 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::29) by PH0PR07CA0071.outlook.office365.com
 (2603:10b6:510:f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Sat,
 21 Nov 2026 00:29:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 00:29:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:02 -0800
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 16:29:01 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v3 1/7] gpu: nova-core: add Tlv.get_u64
Date: Fri, 20 Nov 2026 18:28:41 -0600
Message-ID: <20261121002847.3358679-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121002847.3358679-1-ttabi@nvidia.com>
References: <20261121002847.3358679-1-ttabi@nvidia.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|DS0PR12MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 469995e2-16bd-4770-ca6b-08df47667b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|10067099003|261022075727099003|56012099006|11063799006|5023799004|261009223027099003|261102123227099003|261021121427099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VNc1ypHPBE8PV+LdKWibWpL7sZx29UDRDZoopOAgSccOaZW4JrXWKveoBjZacf+Tt4i/Xg6Lhvpozqywr4U5PK8cb9EB7aCHqK13mEqIupa9rmLSO9eHzeEPvu5fZlWdbPwAWTys3hR6EYqupgW0+4Wz6tN+kk1mTZplh5ly+slA9unpuej4ydrjfy/Ruvw0lqfiA1Dz0eKmIWE1RTOaEOquYEFiWtn/NSJKx8sdHc1GIzKCYafXsSd1JhOn2nIcIg8WtkYR5rOpP/D49mBej16qskYlRrIvGOy2tKvP0JV+Gj1zclAOBYb4h3PiM/4K+QCYJnCNv0xkvY9NMKDYMpHZNID4wpHMBHdtURJj5yvedYyrnhwXEuXnme3RdpE+zFRyGI8AlACRntvHFQs8OmsmUkFu7UZyCbZW461ND6MbD28iMNI2+3kfkv4ViMgQJTEjEH055WnbIqAt9a8ABfe43A9uus7oTQIj5h3KPbqP2ERSbm4Nqde+OdMtjpWicwzFH8YUIr4YUD6RGrsvwodBZrgCPGMvCd5sAMt5mJo48T3uImgIMXzOSVXjy66DG9MJtHlovSbsx84t4FGwAc2onFog6eHocUt5GR7t1b6u3oB7VPiNehyG9hOhYK4XxzL6QfOnsz7laQgJ7j3SEMyIPGwDLxw/1XwzFS5cOdRj5g6EhorTO08nAjb5Jdl5QFK/5qLGNHh27P3QanqPCg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(10067099003)(261022075727099003)(56012099006)(11063799006)(5023799004)(261009223027099003)(261102123227099003)(261021121427099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k92NYQdYOYtvmyKcXMGVgYAju2uaVCQbyo3LIVVeZlVB24shrD3BrSyAEf+9WHsdMvQuM8tqnctaGs0B/UCmWRzPSksuIdKBxwEzdu4729YUJf0LSlbO9ELyWcnJj4C7vOi2R9/lZUs6WVdS+ecKKnZFqkfwyTidd4hde1NcZ5ZWUQhAKbu3Yyaqlyq++gepunluRdu2XXpDpDjFUVUmN2ZbmS0M3MMGgpqgRG837JaLDtRTNnpxhcFwvjBhXKTmBAT+on0Gs6Hgn0GULa2lnVMVXyJNWL58BO6DzFp+53OizO8MGoqZub3VmPvAhxmwr8aCM92/fzFcfbOFpZI6bF4rjf8Ux8BCPtj5PGqLDmeN4cF7ELVun2Hs/HJXP44bvyBXXGNInlVGST17Yj8aqwyVnncocK7HrJIoxneCqnHRIt38njnFeMdbJtrrlb5P
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:29:18.6578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 469995e2-16bd-4770-ca6b-08df47667b10
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8320

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
2.54.0

