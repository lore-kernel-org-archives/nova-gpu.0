Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794352286;
	b=3Mk0cvkLeJbdRti35TrxTUzkmJvxry5op2KnUaG5bOpI1a6pdNbH9asDlRlwin7dUiCZ
	 Khjtx4s8qJfIFCNuzVYDxHXUdITcpM2DebxWrJAC8hRPV5PpkT1dzlJ6cHOI5uaOuk6/3
	 rNLKuWPvB3pYNbnXguGdwAk9s+AXiKpeSs+ZKfwElAVmlRiaBo2U4wUFVICkp3WgnNTSK
	 zuMZY0Cm72RPfHkt4HIXpFCARMsZ+82vdRqzzw+ImH7Rt+VuWuQz0EuijX2AqcjbgZbvH
	 099rJ4td0FhTlF1ovouWgiBfB752atuCYIUrwbB63soibZIj7761acVB0xn+jbnCxNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352286;
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
	bh=jFE+tiOc5x8PjSwyQ/aHY2m1kdOtgvi4iKR0wvcUegk=;
	b=hK8QKYKeRTp4M+VS83GLTOM4A2vMUebW+2b8BIdMtOyVEA+PE31rxIh5IAyK0K7Q8Y3t
	 MAaULCw5jrLa1shr2NfgmjWC3EZ2AhlZspBh4LmMzm34kIxC9RKp6nXM2nMhP9Q/nSeDs
	 GsfPQP8Rn8i3A7NI77xnUKHFU3m33hEse5OIgdRpWRS8PE5Dd25lEJl4f2jR5GgKhuGD4
	 3RUFaVKiAXDpCa+Ecm5IHiBzKrWEYVM1eI7PA2dc+DW1lMjeXujbezjYCMyTAwy1NruxJ
	 Q9y7+XmZRSWNWuXDLk3is4LyMmiDk/mVPrWuYMZnfF//D/1Ty03q2iG4FXjKM4pGwJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qGESo9Cn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.58
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010058.outbound.protection.outlook.com [40.93.198.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5966606A31C
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 23:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5966606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qGESo9Cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AT0m9QIne6j41LR74GGC86HB4DZYnDkq8ZiGEGLj+W7IB3u86KBbSVzZZSIyHWlR6bbhywgv1+/LSYPzZGukElBrp4b7fAqim/9asVN2YbP90p5eZA7MKLsgZB2HO9jP4imrAmrZGzO/3AGtrqri9BITCWqNAr2Q8CdM5X0okYY4w4tTMSl9w1gq0DerpDZ9EzKEj/ev8xiEPM9l9MtKwFyuG6ZUQ/JZ3LkgWQud73d6oF0PeMK515Qf0Tiq7fdiw/90K5fC3JUUOzNT6TXTRNK2Fd6WRKBTIrKnKZaEmmZKbmVXgaFM//Fq+khRC4pnx7u+D4cRkpR3MScUarPC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFE+tiOc5x8PjSwyQ/aHY2m1kdOtgvi4iKR0wvcUegk=;
 b=u5Uqg5RQHf8FZ7N8Q8Rm0UEKeVL5n2MCcf1nRcHcf+IMQRdzvJLOEbLa+XwCwLnbWLCwpF//0afKSQAx3yfvHnuBNx4cu1GkhMBkvhff52zMPe4HWbiLxwghZrY+FjCpVI6ScD10DK80Fgqohxl91PGQ3azEMbf6Q6J8HkU1TV5oPzFtgIed4z5DIxxO1uqRNi6QgqOHpBF92RBYt1vhsdmdPn+YTZCbgtCRU3wUXJPE5eihhxvuQDzQVdHIcpzLsh4okORj/bqFtPe9sONOd37NFqFvHxbXEAOhgzhemDTkLn53e3YwU/ky7JDz6Jj535tfLdgRUxDUWa/K0wPhlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFE+tiOc5x8PjSwyQ/aHY2m1kdOtgvi4iKR0wvcUegk=;
 b=qGESo9CnLUiWyrDJbNQnGp90cfCKBEDRWBpncNbtfTaxG5+9d15vjaEQgS+ywtvSMAJ6ZL4Pq3uXbQpCfqnB2ZLfU2LAQOalW+Frq8/Ujq1HjRoc2riJTmv1jT/a+bCEjCB1E4yTbzVm82wFrO4ag8DMai2zpWJuJTwYurFGTUey7Kqc5wC5bLmJX5mSb2SviSmfS37PoezgP+/er3fu2i9SPFFEbLkdSDJ1OdlP8KfpgtkdfSNTYH9XMYSZ9dcrBuXxAKnQrSKWnt/nEdhtcn2gZW/HA5pKqWcrjeApW3XqvSW4icwgQfeBDLjcf8MAba3QHXDVlTstGz5vCK0Jrw==
Received: from CH0PR04CA0041.namprd04.prod.outlook.com (2603:10b6:610:77::16)
 by CH2PR12MB4310.namprd12.prod.outlook.com (2603:10b6:610:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 23:11:20 +0000
Received: from DS8PEPF000000E1.namprd05.prod.outlook.com
 (2603:10b6:610:77:cafe::4a) by CH0PR04CA0041.outlook.office365.com
 (2603:10b6:610:77::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 23:11:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS8PEPF000000E1.mail.protection.outlook.com (10.167.23.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 23:11:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:03 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:11:02 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH 1/5] gpu: nova-core: add Tlv.get_u64
Date: Tue, 10 Nov 2026 17:10:49 -0600
Message-ID: <20261110231053.1352163-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110231053.1352163-1-ttabi@nvidia.com>
References: <20261110231053.1352163-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E1:EE_|CH2PR12MB4310:EE_
X-MS-Office365-Filtering-Correlation-Id: 79af90bb-7bd4-4016-9f17-08df3f7fee21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|18002099003|22082099003|3023799007|10067099003|5023799004|56012099006|11063799006|261102123227099003|261021121427099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Pc0PLChuCPpsio7xFxYnnfwHRsMMjX7ClGbhh+6zHTHaV523b22iOa1OVONCSaSVFECGn3QSZUMQKggaC/nJsanqbI1d1eaWlvaUT77zfaMyRbp3dSGsqVNjys+WBwgtgBvetUy7yyaYv17i2qcxdfozkghozzBIijXCTdADyhT+SoaUc4P6gFGGDDSdGEN0XN1AiV2/OtBbp8+uRWAch0H7F6qJi9M1scOrvIobqX764vWLtHW31GiPWSDgMCQgup1LzSwG1MTEK9GP1PxRYLKd+1MMi5cYo9Py5MnkzqHRNGVZPhQdEohhKHDlS9v3EeGoQg/SeDfU+uvsXVGy+oo5FgQQ+8v4LtbE5mJVhHzAAjfiGlO/HtXMK8OFyxqLAp5iLU5+OaFyldn51CIqfggCf5gqxhOWod9SPhldVo6y7hgDKuXvA8kb7VtJYDXe7BVayQ9hZJKKQQYu274zHr61xjYIZ9o1H/B9gu2cfWww0rUmwC6Whe/gFPqAcchNVkGAAZagzB35d8v9mHDmWW4h1c3NIeDctmxzcjzbLHPnExib6j/48gfYXs2HHMxPkkEu/14zDM+Os1yowWRfXVOKhI69rkC4BMCgVez+rzY4LqtYzGNfmW0V+YciVsHJuJ4eSTW0kjcH6fDSrQmC3/HOjbU0VLwYDknIy64TVtbx0NV5RfUmYNnKoBCZTzKb3kaMpcx0+An4fqD0xpc68w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(3023799007)(10067099003)(5023799004)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OyXJ6pm6sK0CaC9D6f3DYYp9KBst2c0oHpBsWxPBp6lQtKcB/pii4bv8jHSAljae7/4a2DqsXXb9P7ob+V/oxKI1vKUw97hqb/SotrQt/5MvLKOxYq9m9WSMNmIK3LGY5wec8dXVXUOhjJX4KtlR6Hpsp0E8q/C0l2kVUQpPpf0bxb2BINjyTN3EipN+bls6RS+E9BtmvIcs69diwcn3V8B0zIx/NzSyldFP2lLfEsd5HPWyctn0xDznsFCHhAkJ70msCWyUYRwYurEg2blHPRuV5ekduFRm7hcLrGQcJFYYnuYiVjuPfTYdXYzqCdEtBHPBNZGmOpWPabLRaeAXZpTruRjpaiWq3LvTURbBNVf7dyExEJl3LoAiA2tYoo2/aUxrT52fUzh3acSTxq/sZP7/RNC+Szz33f7sOdHp9V5ZkAqq+ImgLg8ew04yUBVt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 23:11:19.7091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79af90bb-7bd4-4016-9f17-08df3f7fee21
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000E1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4310

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
---
 drivers/gpu/nova-core/firmware/tlv.rs | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
index 7f278903dc8b..75d8f907421b 100644
--- a/drivers/gpu/nova-core/firmware/tlv.rs
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -257,6 +257,23 @@ pub(crate) fn load_file(
             .ok_or(EINVAL)
     }
 
+    /// Return a u64, from either a 32-bit or 64-bit little-endian tag.
+    #[expect(unused)]
+    pub(crate) fn get_u64(&self, tag: &[u8; 4]) -> Result<u64> {
+        let value = self.get_bytes(tag)?;
+
+        match value.len() {
+            // `value` is an unsized slice, but from_le_bytes() requires a sized
+            // slice (&[u8; N]), so we need to convert.
+            4 => value
+                .first_chunk()
+                .map(|&b| u64::from(u32::from_le_bytes(b))),
+            8 => value.first_chunk().map(|&b| u64::from_le_bytes(b)),
+            _ => None,
+        }
+        .ok_or(EINVAL)
+    }
+
     /// Return a string value.
     pub(crate) fn get_string(&self, tag: &[u8; 4]) -> Result<&'a str> {
         let tlv = self.find(tag)?;
-- 
2.54.0

