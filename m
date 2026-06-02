Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D7372052
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 03:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370517; cv=fail; b=t2+gHz5+PsDzX/EZE+1xL7WEfcT6MlCNkZ7Iste1S94VxiYUGy9VFC+hpRD36v/yoccVfIR+4PCQ8gktg3WJZ8+94TunJkI6fX+cVhlnDaL4BbrFAAKAqhZZuT1CqdoGmm3tdSU7ZjlxacRR/hFfi+sEk2kq9d++zoW5AReLjnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370517; c=relaxed/simple;
	bh=qAX9EF2hCHpoPpJlURWpTL0loKffaQVbTeRAy5M4Fmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UK1fNSXLaA2E86TVPZoSdiVj4l2Er0zcOP5VxiKdNXsPE75Mc/QRQBJZp8awxNIugU0KCYxmLdWvAI3YKwR93Q/0GeBkxw4lJ94eAfo9MuVmPYcrAaAfMkNqU5BOzi2VVbpGprGoSmj/+2I8lzZbLOJC/zrUflajXZGHOTVS0VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HDDNd0qr; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HDDNd0qr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTo+4vZBxf6i5c+FRFWS6xdDA6cRTjysWSAWKWSajaRN+nmwzn9yIKoOkhs/AFK/3LUalHuFPJbix+qDtundlTyB2Puc+wLhJbsGj64Hq0krUPAT9xFG67U5vH0z9D6RWqPE8JCsTYMI01x8pxKQ2ot3X+fTX2GpWhmALDtrunVmSGn3Sa71v/75sCvjl4ngKJERBMEzwa1Es0x4CrJ1VJW3dq20bs33WddBIM9dMoXmukvHBHdSM9AaZ24bFP17yizUl8j0ooXCmBGIGZcLbWPEL21xYGH+kFL/huziv3ff2cTboVpXr2BTKhnn4UYelsGzsZUCQyqCp4WZ+Eyt2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNAcCSa8+m4NU4XZ/6Uk0EATVbmwAEnjwNrtY7jIcUQ=;
 b=S2FzlMUC0mlak01GHBIHnqb3pP58Tm7L1Q8McgHIal7yVq8BY0V4NQYwLcfJAuDYzWuQFXTcENb46gzFeX9+k92YOQpdamEOGL0ewy+/UsmNaR397KNJLosWiaqcrQG0dqOT/SqDyV71DW4ukV3UyUbIuTn21UA0mbuDGpvTio44PvPn+xER7MivoWXvKHy9mnIVKW0+iGSGXvXDf7r63ZPXu4DTimbi8N7QgwbKkfdux6QtKZzplA7vtkX4d7mAlTXH3XAtFKfbwDBQ0tDyKZwrkNySON/Wwm+B7gpu288Rl7SPsvnyLlEEm1UPz+WC6srY5Cff40VjEo05HET4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNAcCSa8+m4NU4XZ/6Uk0EATVbmwAEnjwNrtY7jIcUQ=;
 b=HDDNd0qrGaQcZ5Kz59WgBeXwAo1PuYKAFhKgAjBEWboshSbP7e0lmJC97YgNXqOqYEHPQfQ4xi9SMOJA1Vt8lDOAC2rQ9K0miDe/QyhsYU157n/BpVCDwJF/QvaKGCPZwQKvLEDcZYyr5BLdIDFpEPLRAE01dGDAyeD5F0Nl3s6YBI7Vk2Fk8NXrlreS99bnkejG/6OGclOrCQAXdip/amF4hxUtXjjPlzYYXRq57TGpWQXJtfgbT4Mt9KnctAl6CaAhkRBtxz6MWDeuHyuly4/aJeNNynCD/vOASkbYdX+l5iEMd2gL4uNGQMDuG4tUCtzgQkTFq+x3k1FwFAzbzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:21:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 03:21:32 +0000
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
Subject: [PATCH v12 15/22] gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
Date: Mon,  1 Jun 2026 20:21:03 -0700
Message-ID: <20260602032111.224790-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602032111.224790-1-jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bf9057-d026-4f6d-9d0b-08dec0560b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2EvP2cTTaQ/H9Ds9D1B/ADGz5okPwJtmIvgmnjeYtLUHUh+WvfFky5tfcrKGANXBREXVade2nGNHbnVsQI/6xzjlbHF/Rdm20YFKdxtvD/b0xu+VlPoYOhTNxqw5Lfl4s+Zq1wAs1Ft559hiwQiZooedCsS58Kum8YS2c86L9vHzFeeSiOiIw5czhAANK0/of5iyy6F8apcyenHBM8OfkfrrTR7aqxhdhCJxWoO+KWJRRasyl9m1ZYcFIKsJX3NUGGhHxeNSs6UcCjbognGOMNHuJrzVeMFfit4gSJqaNN5YOWChNWFZ+P1KacGP/9Zv2UqMG2JkItd5X3qUyQbzgYvVU6AwVPRf//SA156e7mewtckS2kZUbqDxvk0zWZfKtV+HFqYC9/f76D+YxRYqaZCOImvjrYce+I08Z9nK4odlkWzJ5d/GETu2lTIa8PUL60e96L/52r1tgyUfeW8L6Iu44Tf18xWIUCtndR5S5KCHqNBqMXat6viZApnab/BWLo37x+96yG7YAYU4Af/PCmP54AAOdA7yiuBdrCM9M5N0ciQuRFihoREEPp1Nv5UmLnEsSwTyIfZKnwTG6ZEnR9fiKUl4R0PIZGY81rEX4sEIYDhBiPzU9ahUOjh33clGy4J5Ozu98+5ZMAHFtfriib8y+xiK4h3D4nAv9u6VJdbtmpvBX/uWwW9WZMR+bwDt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CL2jTZY+BKQnATlygnCikCijvJOOxpFbG3syk29fXZGwxujtW4LJUPCydjEa?=
 =?us-ascii?Q?Z57U4jGGTlveNsZOOtVRErxcNT4VDY3D/tZr7dOr1lHCfQ2N0xX5I7umqY9n?=
 =?us-ascii?Q?mV1Fc/Dlqxe+J1mD4F1xdO3lniRUl3MwrfQpGPu/yI27iF8ggpHoQaEWUfLD?=
 =?us-ascii?Q?tRp4oivU4Wc15WxVBA2E9AY7vnq3vVsWeperBPjR29zl4/0UYQmUqCeLFJ4j?=
 =?us-ascii?Q?9yz3EGLmq4ND/sWnxBvsKXQsr9Lq8Qo5s7Koo2+YMhYPybObtsdHXe32ouxR?=
 =?us-ascii?Q?V6IMB5Kk/xYVID0IESf57739u5nswIqAJSvvKlrFFgtrpBvjAeIaOTw0C2Yd?=
 =?us-ascii?Q?N6+PsM4SL0PDOT+bTOz6wPyweRPT3y/mRDwnhc2rqtqZyagat4XTMuQtaE9f?=
 =?us-ascii?Q?DXk3ywJWJMtAYu52OnDaoqO8pV5+k4HCWfw2xIRapgBU9fn1ztfDVwtAOtYy?=
 =?us-ascii?Q?GOBuWcF1UIKA2c23G+yfEGdaQJL2JizdWePpYf1M2zhfpO7CzdHBRE76Y9gr?=
 =?us-ascii?Q?6XCWAMuOr/qiyCcjiLwlN+rNm8L3DpvNgy6cXkZwEckXXyK8kVpnx9tF/R2p?=
 =?us-ascii?Q?DO5XmgLCN2XScKit3O5ZQfyf0johHZJ/6y3E5vnHFGvoLSofnEFWJK/rABj1?=
 =?us-ascii?Q?oH6yWLixsNyhSf9qlG/NLJiPMwJHi9VjEorVJshpPBmXI+k1zfIx8VzAfl0k?=
 =?us-ascii?Q?AG4AtlBzQS741KZK50NvEaIUd71pSvGbXQ4zQix3ZTErsID70nMQSi/SL4So?=
 =?us-ascii?Q?qN3rWJtaF4Y8QKyBYuNOcxwWK9mPfcPrO6FpCk5oilyNGxassUvbQ3FagMZB?=
 =?us-ascii?Q?wH2o221E4e+mJGhOUKdR4v4IDbZaHRVWrS5R5QhMcfzKGZy/G7m2d5Xu2Tsu?=
 =?us-ascii?Q?+2QG6b3EsWdWAGXnxMIOyS3eYhFSjN/9aNFbvoxmPXZLK7U71pyXc4BzfXT6?=
 =?us-ascii?Q?NGSEVc53ojZSO5LHURR/y7SmN7msbPsPLMMpFeCbgT52Z1bg+H2DHrzcBB7F?=
 =?us-ascii?Q?rRojScCSFTQARXnyGtsWM+QFWwShEzcOv3bh0T636g0YHHCoaLogyqgbW/cU?=
 =?us-ascii?Q?KOIdk5vZWqtS8KBxElpWgSjFhDJjyO3tFIN7Ke0rxx5S8VXb3zfKfLcKQHQV?=
 =?us-ascii?Q?1OS4e6xFWpEYM3KXhyTGBBrvoOecI6sFBUgbNw+HPLjSQOFbRvh3rbwz21jk?=
 =?us-ascii?Q?XAWc43EHlYLEmH9KgXhw+5fwoNLmAxc2VWrKwrxGdqKkzSbkKix3V1xKg0rS?=
 =?us-ascii?Q?SntmlrCgWGj6PJp2XggMCuBsS1cYdKF4E84dzc7XvoPRNVqcMcYrJJq1pXGz?=
 =?us-ascii?Q?GexKqI0hMQR5HAVlW67c9+qoDTmOIGkYpF6eE9aRNAE/KRej12Mzvva2n/XG?=
 =?us-ascii?Q?w0hYXhkXeYzjacGCGB7WSFTFMk7y0WdhQeF4vYKMLkULUUUzzqyZ0er0YfuH?=
 =?us-ascii?Q?FHoC+kRd1WUUPezM1dasaMfVzVhqWQYvz2oI63Xpevws0XErQBwoeVwW0zh+?=
 =?us-ascii?Q?QmGyrAHGEd8JwXqT8CD+A0WZ+kfP1UnSlqM8EpCrXZiTAT/GXfXnvoOqJhDx?=
 =?us-ascii?Q?3NeMSCWg9DlwDErhfRIoyj772fKAxzXL/Z1fOeCNyfXd/aVqNKk3j6CJK7Ey?=
 =?us-ascii?Q?xNxB5yhCWY9ZMWxUPuc3OWEtRV8bVtmFuvYQJ0zfclVWTLaMj1SLyzkHRfud?=
 =?us-ascii?Q?3dVTcMcYI9bOqyOIf5WXnm/U3jQwqfInoCmVLuSEvK9Liw3kl6VDWUniG28K?=
 =?us-ascii?Q?uNCSzIsZyw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bf9057-d026-4f6d-9d0b-08dec0560b70
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:21:32.6602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frkt9+JMEMqngGgq+pXzSJ2RfQFX3OJ+35cA47hzkhf8Zp4FgTQoDYG6Pa2agFitJTUjTxBwSJpfuutKDNmTPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565

FSP communication uses a pair of non-circular queues in the FSP
falcon's EMEM, one for messages from the driver to FSP and one for
replies, with the driver polling for response data. Add the queue
registers and the low-level helpers used by the higher-level FSP
message layer.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 61 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 21 ++++++++++
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 6b057d958115..0ec1c55213bc 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -112,7 +112,6 @@ impl Falcon<Fsp> {
     ///
     /// `data` is interpreted as little-endian 32-bit words. Returns `EINVAL`
     /// if `offset` or the `data` length is not 4-byte aligned.
-    #[expect(dead_code)]
     fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -131,7 +130,6 @@ fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
     ///
     /// `data` is stored as little-endian 32-bit words. Returns `EINVAL` if
     /// `offset` or the `data` length is not 4-byte aligned.
-    #[expect(dead_code)]
     fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -145,4 +143,63 @@ fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
 
         Ok(())
     }
+
+    /// Poll FSP for incoming data.
+    ///
+    /// Returns the size of available data in bytes, or 0 if no data is available.
+    ///
+    /// The FSP message queue is not circular. Pointers are reset to 0 after each
+    /// message exchange, so `tail >= head` is always true when data is present.
+    #[expect(dead_code)]
+    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
+        let head = bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
+        let tail = bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
+
+        if head == tail {
+            return 0;
+        }
+
+        // TAIL points at last DWORD written, so add 4 to get total size
+        tail.saturating_sub(head) + 4
+    }
+
+    /// Writes `packet` to FSP EMEM and updates the queue pointers to notify FSP.
+    ///
+    /// Returns `EINVAL` if `packet` is empty or its length is not 4-byte aligned.
+    #[expect(dead_code)]
+    pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Result {
+        if packet.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // Write message to EMEM at offset 0 (validates 4-byte alignment)
+        self.write_emem(bar, 0, packet)?;
+
+        // Update queue pointers. TAIL points at the last DWORD written.
+        let tail_offset = u32::try_from(packet.len() - 4).map_err(|_| EINVAL)?;
+        bar.write_reg(regs::NV_PFSP_QUEUE_TAIL::zeroed().with_address(tail_offset));
+        bar.write_reg(regs::NV_PFSP_QUEUE_HEAD::zeroed().with_address(0));
+
+        Ok(())
+    }
+
+    /// Reads `size` bytes from FSP EMEM into `buffer` and resets the queue pointers.
+    ///
+    /// `size` comes from `poll_msgq`. Returns `EINVAL` if `size` is 0, exceeds
+    /// `buffer`, or is not 4-byte aligned.
+    #[expect(dead_code)]
+    pub(crate) fn recv_msg(&mut self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result {
+        if size == 0 || size > buffer.len() {
+            return Err(EINVAL);
+        }
+
+        // Read response from EMEM at offset 0 (validates 4-byte alignment)
+        self.read_emem(bar, 0, &mut buffer[..size])?;
+
+        // Reset message queue pointers after reading
+        bar.write_reg(regs::NV_PFSP_MSGQ_TAIL::zeroed().with_address(0));
+        bar.write_reg(regs::NV_PFSP_MSGQ_HEAD::zeroed().with_address(0));
+
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index da7a10c0346a..8c51609d0281 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -576,6 +576,27 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
+// FSP (Foundation Security Processor) queue registers for Hopper/Blackwell Chain of Trust.
+// These registers manage falcon EMEM communication queues.
+
+register! {
+    pub(crate) NV_PFSP_QUEUE_HEAD(u32) @ 0x008f2c00 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_QUEUE_TAIL(u32) @ 0x008f2c04 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_MSGQ_HEAD(u32) @ 0x008f2c80 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_MSGQ_TAIL(u32) @ 0x008f2c84 {
+        31:0    address => u32;
+    }
+}
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.54.0

