Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B22239A05C
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693785; cv=fail; b=g9hTpez9ClxmitQAUR9K6DlP9R7DYvoOSTHgjrprbw2buSrvjvKuOJFFWZoamV/s+gV8QzKZKMaZSmLuR/Yknl76L9GhtTsuMMQl/knEowcpFaUS1alkLVPjxHW0iDFbcKojLWtNDd40nF+XSVvorYYG3IwjcKbwx9rP9Kn80XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693785; c=relaxed/simple;
	bh=McQhjEV28WU3w9+dLWN4ZMtRIGB2qDS7NdcKfhTciJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TTjtGJN3RUBVQnDCGbvre4sVJk5yLYS9x+LbHDs4KrO5C48QtIBglON3Jn7M5J5hKB8Cf7mXPjNtJ0KwHQbxv+AL7L435af9Mkjev9oS48h9mYAyccAGOlw1Ma2w3S4MxMtJ1XaGcjg1uMX0MdHq6Gnt7uDRi5bACw0JN5U17VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i7VoGn9y; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i7VoGn9y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dizuVWFVA6kcInaWwtW1Ff7A6R29hPc+YIk7MVyDVLO9ee73TEul0DW5BfRAFe8noifLxAumcyx3RqcmRG0gjN9gP1NGO9aID8385liPvM43l5I7A4zVna0xiyG4GPxS4SRroQEQo9G3u5xeCFkRpG51BUdPQpr1Ja9/0R/xy0tLloBCm8cfOEIkQTvVo8r+/WUsbfS57D/B0VWGOAe5U5QzsM/6XK4GIAfLqu62diXORBkf68lYHXvL7YFlwQyeQow1wjopttL2yAyqM1M8OAuJ641ZltcyRy8eWGEVTf+oDiJlLuI9h0+b2nzZWqk+xx0D9N9bW4yRwgVhYlbdgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ndo5ME8cPB0QKE260PeGiIIG6LLjBCoDqc9UeXIwP1Y=;
 b=mL6YN7SqV+ESX6F/2jJNEGSGRbN1M6Fqmrmpm4n/3MQE08F0AzksGOPWqzLxSWDfZQX2e+HxtVg04BUSsLoomqbvsnyAgGvu5hejjSKgPttQvlBvNZ9EVbjy5Zv/UEx8RvUZp8yvCY32p7bJjk99a7ZA0TmWvl9Y9LUeqJ4FpCVSWhA+5q5cTPk0i1RpAmDh2BbSUW1cpRVawarpNQhljQguDJoyNYMhWCkQT1ZjxKvsXv6i570CH91FvJF9dlMhjSDKFNoU6hJHC5ORE+x2WubzXHQ9B6GftcJav8vngAGrqYNzfIM/EG7oqYt2QL2b2hiB9qqP6sPkksV81YC+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ndo5ME8cPB0QKE260PeGiIIG6LLjBCoDqc9UeXIwP1Y=;
 b=i7VoGn9yxMxiXnz8sqAxr0jM1sWwA3o4x5D29X8EeA2ZICFDujwv5PERbWKwhKqzoApyUIuoi5RDtS1myT4pWXC7CvE+m+nsyizHOAyBB7Ivk/hTRQZrNIZp7tcnhzufX0MqNrrW51v2E2joa1gXVCL8SFIivtIhlxEziuL27TpxkdW/PdSYnIkur6ER3bshOr606hsgfVq9NFEibsW6K9M1fHAHDl0JNz0kGAo7o1XTNv1Ebv5AS4qHC1VWoCnZyr5Xl7LsTsxSuKLrC0VZIVZSgQRJFuNlgBlYiuUmlJQBSDT+AkVvbXg3t4Kc9mdivJtsrj2Yr9hMqQBjfqrQPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:09:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:09:12 +0000
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
Subject: [PATCH v3 33/33] gpu: nova-core: gsp: match a GMC response by flag, id and sequence
Date: Thu, 17 Sep 2026 18:07:19 -0700
Message-ID: <20260918010719.1176945-34-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 729341ec-e6db-4721-e3fa-08df15214b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	TwVfEGjh9zmAv9OYGft39FslIH2wy7uZqC1HZHQ7jzIhMbHGRdpXteChg1U4g/S95fg7lffrXLJOlwTRuVwB7BprKzX4CuxJq0KcAZPrWK7r/eZbAhw+BdJzRptT4nGkgMRX12B4Xdru8cYtZKdrUYa0GcwcK57F0OrzowU1hA+sU+2K3wr0BoHfTIlcHM77riuKU3Bus1dn7cXJsh6TRIuCuAgOFQDPavlpPxVjRBa1lnqiGVSHAABT2mM5WNJ17ouNTSe1XXe3C6Wt/CKrQ6yf1KnrKtGzQrsRdSs+A6v+5Eh2eHReqioWfxENIluK7M3C4YAW4OFs3VM/oTIE5etHsySJKy46L8oHNVlClDKKB0UxrJ3V2SQjCrWxlk5Z5ljshYhbqPFW/oU3Ocvnvw7MxghK/vbAT2YooVl3aq+kAK1Yj0odYw4gDG2WmT94XnGkT7uRP/xGULdF2NEt4oatKF1dYOy0XsMFXK8zb69uqXUMlbkTTJaRFQBNSgFQpznMqZKQcliEKsKNn5HijrM/odUytxA1iFt7B/hU7ayuC7ahyJ5yuTAJbEcjKZ1gUA1Mjt/MqV3r6Vm0cDwFDBM6fTVM1cXJyC/p/bT+nax0garTD3J7SIxWV6VRx8sZSpkElNSef7y9ht9FXXok7F3Sf68s6tP+2V3Bn+TGNKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?02ChyHfEkKWoMObQrm0yYuPg36ZWqL1vKdZ4JosDIMgE/VU+vWPDL26VVcos?=
 =?us-ascii?Q?bA+iTunIbYHDSCaeZFH2smqlSlHoJJ91DdsifnL175pTLJs5KAfYy6MQiWBG?=
 =?us-ascii?Q?gHKHBtiyX4F3dGwW4zt9rqqp+Vd8SiZxu3yPYhgQD+8TFIP7UfphtfgoGWwm?=
 =?us-ascii?Q?EYbyBOHzn+PT4Xt4z9rSqR/ewqPs59JQuxl+0Q5RINnbj17bJKu58ugx33JE?=
 =?us-ascii?Q?jIyXTRjDjRRbng6r1p6jPGX9nTLqQQKkRKIR2B+HDlau4xVfDn0OIMgyTMuG?=
 =?us-ascii?Q?DrYZTJHuctbqmn8iUmsHk9n5vHEPnA0asKWcMzpipGSF2TVzlZiiID9MjTXv?=
 =?us-ascii?Q?w2AGGCtKTmD5IAkCnpj9FmWfVVSv4K2WUZinXWt83t2XiCjQX7HUiDWLM1+x?=
 =?us-ascii?Q?q0IiQa7h1fOncK1v6cQejsuGmFqdoRJ+WIuwPqaMihNMCFKhWo1P7WPChBSs?=
 =?us-ascii?Q?ZyEcrwjftJCDuTKgyxbBBJk60SldCaO8YBLlHNwoMJVb+MbLY5VaD5Eun2qT?=
 =?us-ascii?Q?hZMl6kZZZ4mU1sKEOWxK9BOL1NPZt0Ap08jRe8b8UzGaY1bnpFvbMngd65Hz?=
 =?us-ascii?Q?U6VBk4TZq81RCIgZ5eu/5GPWn7O6NgcVGUsKv3Snna5CXUtu9vkypX61hiSs?=
 =?us-ascii?Q?tUCUBrL5Ao7iLiDXzcx83uuB5l7eYRkctSEwxgSzLvYXLcja39lhrhfGdyr7?=
 =?us-ascii?Q?Dr2gvkxYkR4Yh4am+nXFI4cjl/DvfPAmUdDyCh2dZH1xteC9TuAs/vbmwKGK?=
 =?us-ascii?Q?btCMhPSSVRMDtYpe4Yv443QXEbPnbx6j6kzJ8AnImQYBTeIQGqfLFDMmbhte?=
 =?us-ascii?Q?ovOA0spQGuIqDdMSzAhBtUCccQnNnbm6UQyX0wbCTDcHYiYxB9abw420NJTg?=
 =?us-ascii?Q?kwzzX722P8LdwjBXEfddkCgtJu8FdQsOJIYuzLc2HEJwvwuGaP/WYoKeLH7K?=
 =?us-ascii?Q?v5zubilGBE7ejjQoc4CDoONK5kk+zH/kpjqEogvcTYMS56f9P+nnLr6oqO94?=
 =?us-ascii?Q?ICZhyK7nHD44qQBblqnw9V75OC5/b5IY4ataTImfxTqhEUR1FvhwWcbhmJfL?=
 =?us-ascii?Q?tU8vGughQ7cunZVYBzu1BLggkzihOVne7f2YJMj2cL7Wg2cKeDMvqbnGkiYm?=
 =?us-ascii?Q?Eh2vQPZbl+CxlqXBAQfUCTYc5c3Phq8LvvF6ar9IIdRI5kjf5uF48/qkoZ67?=
 =?us-ascii?Q?bwpcvl4lvRqoDdwDpf9l8irwQ8h7LG7Gega5KTHFEmxdy7pz56dKu1CjFs31?=
 =?us-ascii?Q?IojSknoqwn+Z7EJEzU6vnYdP3aWSEMgZX/yOEZWZKF9HPOuNqlCA4jJTfAYQ?=
 =?us-ascii?Q?HB094lmDrIvzn0XtUQeBVFy5VE9RGYr0QHnWXaUmhnqTdiFV4Hrd9dCyED4W?=
 =?us-ascii?Q?UBE1ADG2tfL39rU7W4318VV1amj3BmbX/Gm2FyvRUxZup7qp91Fx1/8PQYjk?=
 =?us-ascii?Q?qpizQp9gDRzEB722kzp9HXDBVIIDwM7PExMwrYvmqxg1ZpcmwX4Jo4o1rIuQ?=
 =?us-ascii?Q?O9EvnwcOButqUVDPWfdw8UHWiRWKK47c5xec8qZhROiYj0lzN4HU8M/ZPXCa?=
 =?us-ascii?Q?cpcbJ+NkQfQDyldASP4n7YIXScQc8eyLZeromualH/Fasc5vS7rqzN1XRJSo?=
 =?us-ascii?Q?qEsGuR6kcO0j6QYmn66ulfuCxt9R0o7gzPWeUuYSzA55vgq+KYNmi1dJcWv+?=
 =?us-ascii?Q?pjfU/N4dYqLgi+sjx3iCAWl1fAOCEpJrIHVO3pkCi8tOHPbJ8iSdfHNCjKcS?=
 =?us-ascii?Q?+pKMLJxZNA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729341ec-e6db-4721-e3fa-08df15214b71
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:08:05.5988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9B0JZfL65U9272zgFzBuY1ZPhDSfogV1a4TPVKQxgYR7dJ8mg9M92uKbfSa0xF7NIaMqPXusgYensBpmhD+Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

From: Zhi Wang <zhiw@nvidia.com>

GSP-RM marks a response with a flag bit in the GMC command word, and it
echoes back the RPC sequence number that the request carried. An event
carries neither, and an event can name any command id. The r000 GSP-RM
raises no event that names the GSP_INIT id.

Nova-core matched the GSP_INIT reply on the command id alone. The
receive path would have decoded an event that named the same id as the
reply, and dropped the real reply, so only the absence of such an event
kept the boot working.

Return the sequence number that a GMC send used, and require the
response flag, the command id and that sequence to match before
decoding a reply. A command that GSP-RM does not answer goes through
its own send path, which has no sequence to return.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
Assisted-by: LLM
Co-developed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     | 44 ++++++++++++++++++---------
 drivers/gpu/nova-core/gsp/commands.rs |  8 +++--
 drivers/gpu/nova-core/gsp/fw.rs       | 26 +++++++++++++---
 3 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 2664ace70ef8..dd0b3dfc6f37 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -642,8 +642,8 @@ pub(crate) fn send_command_no_wait<M>(&self, command: M) -> Result
         self.inner.lock().send_command(command).map(|_| ())
     }
 
-    /// Waits for the response to the GMC request with command id `command_id`, and passes every
-    /// other GMC element that arrives first to `on_other`.
+    /// Waits for the response to the GMC request with command id `command_id` and RPC sequence
+    /// number `sequence`, and passes every other GMC element that arrives first to `on_other`.
     ///
     /// This method may sleep while waiting. The queue mutex stays locked across the whole wait and
     /// across the `on_other` and `decode` calls, so neither may call back into this [`Cmdq`].
@@ -652,16 +652,19 @@ pub(crate) fn send_command_no_wait<M>(&self, command: M) -> Result
     pub(crate) fn await_gmc_response<R>(
         &self,
         command_id: u32,
+        sequence: u32,
         on_other: impl FnMut(&GspGmcMsgElement, &[u8], &[u8]) -> Result,
         decode: impl FnMut(&[u8], &[u8]) -> Result<R>,
     ) -> Result<R> {
         self.inner
             .lock()
-            .await_gmc_response(command_id, on_other, decode)
+            .await_gmc_response(command_id, sequence, on_other, decode)
     }
 
     /// Sends a GMC API request to the GSP without waiting for the response.
     ///
+    /// Returns the RPC sequence number that the request carries.
+    ///
     /// # Errors
     ///
     /// Errors from [`DmaGspMem::allocate_command`] are propagated as-is.
@@ -670,12 +673,24 @@ pub(crate) fn send_gmc_no_wait(
         command_id: u32,
         payload: &[u8],
         max_response_size: u32,
-    ) -> Result {
+    ) -> Result<u32> {
         self.inner
             .lock()
             .send_gmc(command_id, payload, max_response_size)
     }
 
+    /// Sends a GMC API request that GSP-RM does not answer.
+    ///
+    /// # Errors
+    ///
+    /// Errors from [`DmaGspMem::allocate_command`] are propagated as-is.
+    pub(crate) fn send_gmc_no_reply(&self, command_id: u32, payload: &[u8]) -> Result {
+        self.inner
+            .lock()
+            .send_gmc(command_id, payload, 0)
+            .map(|_| ())
+    }
+
     /// Waits for an unsolicited GSP event of type `M`. Events that arrive before it are logged and
     /// consumed.
     ///
@@ -844,10 +859,12 @@ fn poison(&self, reason: fmt::Arguments<'_>) -> Error {
     /// response that the caller accepts. The request carries the next RPC sequence number, which
     /// GSP-RM copies into its response. The number is consumed even if the send fails.
     ///
+    /// Returns the RPC sequence number that the request carries.
+    ///
     /// # Errors
     ///
     /// Errors from [`DmaGspMem::allocate_command`] are propagated as-is.
-    fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response_size: u32) -> Result {
+    fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response_size: u32) -> Result<u32> {
         let rpc_seq = self.rpc_seq;
         self.rpc_seq = self.rpc_seq.wrapping_add(1);
 
@@ -855,12 +872,8 @@ fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response_size: u32)
             .gsp_mem
             .allocate_command::<GspGmcMsgElement>(payload.len(), Self::ALLOCATE_TIMEOUT)?;
 
-        let msg_element = GspGmcMsgElement::init(
-            command_id,
-            u64::from(rpc_seq),
-            payload.len(),
-            max_response_size,
-        );
+        let msg_element =
+            GspGmcMsgElement::init(command_id, rpc_seq, payload.len(), max_response_size);
         // SAFETY: `dst.header` is a valid reference, and not written if the initializer fails.
         unsafe {
             pin_init::raw_try_init(core::ptr::from_mut(dst.header), msg_element)?;
@@ -880,7 +893,7 @@ fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response_size: u32)
         let elem_count = dst.header.element_count();
         self.gsp_mem.advance_cpu_write_ptr(elem_count);
 
-        Ok(())
+        Ok(rpc_seq)
     }
 
     /// Receives an element from the GSP.
@@ -1302,8 +1315,8 @@ fn receive_gmc_and_dispatch<R>(
         })
     }
 
-    /// Waits for the response to the GMC request with command id `command_id`, up to
-    /// [`Cmdq::RECEIVE_TIMEOUT`] from the call.
+    /// Waits for the response to the GMC request with command id `command_id` and RPC sequence
+    /// number `sequence`, up to [`Cmdq::RECEIVE_TIMEOUT`] from the call.
     ///
     /// The response's payload is passed to `decode`, as two slices because the ring may wrap.
     /// Every other GMC element that arrives first is passed to `on_other` with the headers that
@@ -1321,6 +1334,7 @@ fn receive_gmc_and_dispatch<R>(
     fn await_gmc_response<R>(
         &mut self,
         command_id: u32,
+        sequence: u32,
         mut on_other: impl FnMut(&GspGmcMsgElement, &[u8], &[u8]) -> Result,
         mut decode: impl FnMut(&[u8], &[u8]) -> Result<R>,
     ) -> Result<R> {
@@ -1334,7 +1348,7 @@ fn await_gmc_response<R>(
 
             let response =
                 self.receive_gmc_and_dispatch(remaining, |header, payload_0, payload_1| {
-                    if header.gmc.command_id() != command_id {
+                    if !header.gmc.is_response_to(command_id, sequence) {
                         return on_other(header, payload_0, payload_1).map(|()| None);
                     }
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 128d6f8dcb43..f1a3c0613e70 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -79,10 +79,12 @@ pub(crate) fn gsp_init(
     // Qualified because `zerocopy::IntoBytes` also gives `[T]` an `as_bytes`.
     let payload = AsBytes::as_bytes(payload);
 
-    cmdq.send_gmc_no_wait(GMCAPI_CMD_GSP_INIT, payload, GSP_INIT_MAX_RESPONSE_SIZE)?;
+    let sequence =
+        cmdq.send_gmc_no_wait(GMCAPI_CMD_GSP_INIT, payload, GSP_INIT_MAX_RESPONSE_SIZE)?;
 
     cmdq.await_gmc_response(
         GMCAPI_CMD_GSP_INIT,
+        sequence,
         on_unsolicited_element,
         decode_gsp_init_reply,
     )
@@ -124,9 +126,9 @@ fn decode_gsp_init_reply(payload_0: &[u8], payload_1: &[u8]) -> Result<GspStatic
 ///
 /// # Errors
 ///
-/// Errors from [`Cmdq::send_gmc_no_wait`] are propagated as-is.
+/// Errors from [`Cmdq::send_gmc_no_reply`] are propagated as-is.
 pub(crate) fn gsp_suspend(cmdq: &Cmdq<'_>, level: PowerStateLevel) -> Result {
     let params = fw::commands::GspSuspend::new(level);
 
-    cmdq.send_gmc_no_wait(GMCAPI_CMD_GSP_SUSPEND, AsBytes::as_bytes(&params), 0)
+    cmdq.send_gmc_no_reply(GMCAPI_CMD_GSP_SUSPEND, AsBytes::as_bytes(&params))
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f3dff49af2bf..f7e83e75e53e 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -725,6 +725,9 @@ pub(crate) struct GmcApiHeader {
 /// Bits of [`GmcApiHeader::command`] that hold the command id. The high byte holds flags.
 const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
 
+/// Flag bit of [`GmcApiHeader::command`] that GSP-RM sets on a response.
+const GMCAPI_COMMAND_FLAGS_RESPONSE: u32 = 0x0100_0000;
+
 /// GMC request that carries the system information and registry keys to GSP-RM. GSP-RM answers
 /// it with the static GPU configuration once it has finished starting.
 pub(crate) const GMCAPI_CMD_GSP_INIT: u32 = bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT;
@@ -771,13 +774,26 @@ pub(crate) fn command_id(&self) -> u32 {
         self.command & GMCAPI_COMMAND_ID_MASK
     }
 
+    /// Returns `true` if GSP-RM sent this header as a response rather than an event.
+    fn is_response(&self) -> bool {
+        self.command & GMCAPI_COMMAND_FLAGS_RESPONSE != 0
+    }
+
     /// Returns the `NV_STATUS` that a response carries.
     ///
-    /// The value is meaningful only on a response, which GSP-RM marks with a flag in the command
-    /// word. In a request, the same word holds the largest response that the sender accepts.
+    /// The value is meaningful only when [`Self::is_response`] is `true`. In a request, the same
+    /// word holds the largest response that the sender accepts.
     pub(crate) fn status(&self) -> u32 {
         self.max_resp_or_status
     }
+
+    /// Returns `true` if this header answers the request with command id `command_id` and RPC
+    /// sequence number `sequence`.
+    pub(crate) fn is_response_to(&self, command_id: u32, sequence: u32) -> bool {
+        self.is_response()
+            && self.command_id() == command_id
+            && self.sequence == u64::from(sequence)
+    }
 }
 
 // SAFETY: All fields are integer types with no uninitialized padding bytes.
@@ -801,7 +817,7 @@ pub(crate) struct GspGmcMsgElement {
 
 impl GspGmcMsgElement {
     /// Creates the queue element header and the GMC API header of a request that carries
-    /// `payload_size` bytes of payload.
+    /// `payload_size` bytes of payload under the RPC sequence number `sequence`.
     ///
     /// `max_response_size` is the largest response that the sender accepts, and zero for a request
     /// that GSP-RM does not answer.
@@ -811,7 +827,7 @@ impl GspGmcMsgElement {
     /// - `EOVERFLOW` if a length does not fit its 32-bit field.
     pub(crate) fn init(
         command_id: u32,
-        sequence: u64,
+        sequence: u32,
         payload_size: usize,
         max_response_size: u32,
     ) -> impl Init<Self, Error> {
@@ -825,7 +841,7 @@ pub(crate) fn init(
             gmc: GmcApiHeader {
                 command: command_id,
                 size: payload_size.try_into().map_err(|_| EOVERFLOW)?,
-                sequence,
+                sequence: u64::from(sequence),
                 max_resp_or_status: max_response_size,
                 reserved: [0; 5],
             },
-- 
2.55.0

