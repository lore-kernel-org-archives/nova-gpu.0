Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794858925;
	b=brqawoc3oZ8Ca9Yna2G2afYNtZeBBMDBtQ4XEPWpwh7WHI5ngLoebYQSnrheR0AW1DjE
	 DUTNh/NfSzuvztR7R6LT4dg8nf6top+ix3UmCd/7lOYDcGdpsPClgPjd2722b3jmuKk6X
	 lAX5mmDwIHXXyX5Po4RPcI1qm7YU5SvpWh1g1cqiKIRjNY9HV/E64Rt4BHfwiuF8mUjdV
	 8iEc8lxZOimwiSdCG+Ih4FASHc0P+Fk2c1xSnsdEcQKGM0CGJk6/V4evqFmpZLcPcy6Uu
	 GcAk6tqDlzOK7A3K3GrxN+ZtmHulGRY1osE1BF55YmWbRcEJHm2lTQSzRgCwnejfpCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858925;
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
	bh=6lG42oi7jp70exRs7spKWAzgW5+cM1WShaelcm+7WSI=;
	b=PgaUYPe9RvxXVj7HkfoJj1wtNQQBBtRCtFIKTQQfdowrvPaJIE6XVDTWY59LjuQlhMCU
	 TKWVaYnV0lx+Qa2pxgYDUm4ONRyhcY6oc59J8t/JupPJVmL0B7pjx+lyqCldLxV6lKs8Z
	 spThKtcC79OXAs1uEYXWOeOQjXycWCcei1qzZpP4L7/OnR76aKFk27kSpmcZzkjeG1wiA
	 VoxRhIOrTQGe5XqYAf0UAGXeerIcoHk+lXQRlg2EztWMkzWFcqF/qwqtZsVLxcgn0wfyq
	 B3xmZCNWXingYhkvuEePvJDHsXp1D7Cn/X03eFz2cf1DiMKO3EykzorHO0GidjkuF0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="GY2bS/q8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.17
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9740F606A322
	for <nova-gpu@lists.linux.dev>; Mon, 16 Nov 2026 19:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9740F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GY2bS/q8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sH2w+YNuAsB+IA3cwFF7g2xTSJxcCEyGJmg9fLaFNfXXSjXv/wkgyJiQsq0KCBmsp8QOQ3GeGKRGl2UMyIgpq5hZEt/yhh4uM/M0Ok0jTCIDJod1gAqNHw+JRHZKnl0h/ylidFw2qBMUERrgie98swbsOzppCJdvk8d2QC++8tLq0OKNmZbghIuNWWPH0XzIRlj7UkecF/m5GnLC72xnHFLsAZth4TYI8trA5kMl2ScTav2PuAGhObKhfUVJfGGnqIsdoW6v7gkTCEvGSGkef4yxyWVWeuEAXnieVzFt5+bqdcZyPcGVipBE5EnSzXJdBX/5UOQ5P6FviIRg420XwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lG42oi7jp70exRs7spKWAzgW5+cM1WShaelcm+7WSI=;
 b=IcHKgbGtogfQxNnF2H6k2OHeQXL8xF0y87VnPYeqn88npZOXx+53DL7yckQMSwmzZKbht/Hxe60fM0S2j4U6tMLPFRF4o5TXOiLw9uPzgO8lN8u+9XKWFXgMsB0Ak0siBv76KIf8fQuXMk3x9w1CbTHuPPY2xwiU3/QlCM5c7gtTaZ/peheCWRPi040VqRI/No5kaJxPwGEcnRslPZAdbd1ismY2TmWBouDSD0uDDEKY/UWA0+kAQ/NlTEFv8AjjlBvUXB/wJexz8+bfE1BjmNadL0n7vLp4afvATfgKJ3aMG05IlG+Pqg2H/j7vW19PJw6YnP6XsIQkAsuxnC5yug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lG42oi7jp70exRs7spKWAzgW5+cM1WShaelcm+7WSI=;
 b=GY2bS/q8ln7coqpLFolEyu4cC2V6fNXzI1xsfxwnz283GBVXSxZF7QoNy5tW6BrzNATzfVUi1MW+sjTPDpLUD0+ZI/8K1W8iDbn/mK/quF4a9NQ4ETLFyS5YNKlGpdq4A2cKev2ulV98wLz+6+q5Of+c99xU9r9oag1ToBcYK+zRwQMYjVp0MBsMCnCQ+Pjv6i2Xm6zYEx9r696Ee8fblaFJEeISddCBNA1/LyaIyyC3JRUiVFGXUKosarWM5bkHj+zwmI1c9jMxbCCDaUmFPyG9aP8VzarXYx8w9KVD9NqZ8mzBGA8s991GBnFEf2MjJgiWU9M5riRYX/WGPKkCqA==
Received: from CH0PR03CA0204.namprd03.prod.outlook.com (2603:10b6:610:e4::29)
 by DM4PR12MB7575.namprd12.prod.outlook.com (2603:10b6:8:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 19:55:19 +0000
Received: from BN3PEPF00022BC8.namprd05.prod.outlook.com
 (2603:10b6:610:e4:cafe::ab) by CH0PR03CA0204.outlook.office365.com
 (2603:10b6:610:e4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 19:55:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF00022BC8.mail.protection.outlook.com (10.167.248.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 19:55:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:50 -0800
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:54:49 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v2 1/7] gpu: nova-core: add Tlv.get_u64
Date: Mon, 16 Nov 2026 13:54:35 -0600
Message-ID: <20261116195441.940595-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116195441.940595-1-ttabi@nvidia.com>
References: <20261116195441.940595-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC8:EE_|DM4PR12MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e2daf9-8ef5-4697-136f-08df441b8aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|10067099003|11063799006|5023799004|56012099006|261021121427099003|261009223027099003|261102123227099003|261022075727099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	PUvRaqW+tg+4kPBu+U11xIwQ+4T7cph2mCkgpunW4JiFfE+BwdiOXCgioULeORbPYzbn/shfwGg6O0jmuB/YGJp/guykUBLjV9e/7YQ4wkrFz3x49EpMDB3mCcxgclM7mIDC01V8m8XlFzuwB0K495ecxiRBCttlZXtdpEK+/DPqA9HNC47OV7nGMEVQsNgjYbtcgkiWbTth772rPRHTPdEP7XkxvvtwfUdQxKgVTB7RBQo7UbY4DkFvwexUzwUlG7lC4o+AOQVZj+wdyLV5rQmEuhAgbjNJR01cn9VMyf9SdBuAS88F40fblpXFLJelGdIKAYxq9rggty1wuacDN8qWlqPfLhZedzM3RqrhLmlwYkBqS7GPl1MAxOIDongnzNf+ZnIHHqTg2Ec4EknBNuRVUMu+T/+00AylSde9VY/waZtN9GXWDlaC4Gr33M93TJpYkhYSBjNq2s+3PBzNeD4Wt+NcwDGjlXrivgdM/aUG6+Iuhw2vEaLVrqDYnilv6kER7cY4HrD3w8sA2URDEHXw/YrqM7kA5rXt3qrQLa/9o7b0pSO1j7FpLeP6J3QG8xTxAPefOoBISXRv7K/5pllaCWKdR4EnN6ALDAcLTEOD8TeU/oQyU7o+8PknWTeI1owxDpEo7D7VArJORsldQr1dT6xGReTIFjge2IuZ6GGzqTci2jmTneG4MElYItUCClQ+GTk1MAVrVB4jBEwA3g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(10067099003)(11063799006)(5023799004)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bs4jAjrls2EwFukBpudYBL7AyEJZDqyceMP1elQ/yGnpsU0FSpdd7H9EMOXUJL4YCzLo9KuGj6lP60FmJeXuqk/X8GFbmlePMbt78hbaVObQ6xDwH/0XhwvfOztj5nh9FRxu29GcJwaStt3pgRwtQZvy5cR3Len02kJq7evbGVdcI1kbVEulpVM3PMG6AGzyH1zeLwZh0W0S7WMgIU7FrTbgQbIgCNAuVyrwdNRNMoIoRdB/YtR6I7GCx+YmN/JJGH4yGiy2PhEp4TPoo6AJAZ/osDqNP939WPuqBH+KLcOcj/1eBNT4Ro+qBSCApOp3q9wkEDhVYfqf9HGhjiFnPC31djwrK/KAIicDhfBKB5nzrim0641jlosQKjTQ2dvKnAo06OUprcVLbVj3hAKSxfM4/1MoHM3OOTOyPuhA2POj57nV6Rr+3jjRJ0P4mb4I
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 19:55:19.3950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e2daf9-8ef5-4697-136f-08df441b8aef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7575

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

