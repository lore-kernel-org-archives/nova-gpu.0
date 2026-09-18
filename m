Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81193A450A
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693717; cv=fail; b=AtQYEr5QbG0z4SxFy08dYDsy1PJdZuNtn8gTak5Z3XWP165A08uMZHotbPO1KHJgygcRv48fpgkRUEbDapTy7dXvDvabcmq8P1YYnNBu4M5NyCQ5L6lhR8NID7HBw4d0/uxzSPdYbTqvaGh5HCNeGUmiRkDu9pQ8KL0xv5NouxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693717; c=relaxed/simple;
	bh=Oy4Ov/QHfe6vTP1jT5QPoqkGNJLDABFmFhnqdWmk9B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JXrzJvy0QYvByNtRpd/DD+FrKUlJDWSF3SCbJvnAPAdQyOT0+QfoIH5zdK3Nz9XEiCJyZXxXlsMNCDr4tNk6huy3DlAv7M/377ounOBwll4cfz3AByMAmO8upPt4asgNtwkdPs6Ig8Tazr6jKN7cF86k/CqPa2S36vdFn3RJMsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CkyTxbs3; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CkyTxbs3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibCO5hNTB5naZimBoQMKTQeq/zMTbns4zINTR/fvoUZMf4f9tWMyrJ3vEM+TdtyV0dOONUaZMzCnUViQK04ODPJcbGSfanYrDIYNtJndEefoISj+LqURVf5vdYSp3i0D8MFpU7jIXkF/RlNkhoBZMa45UY0QWt3QhKw5wfKIkZdH4HncmTTYufr2aPuX08YAwK9Szm2ZBEEWC8lyhYcNaDMFdKEGVKyY5E5z5dNYWTrOX+v6TLjhaCbFt1QSDAKFtSTNpnCu2ZnxVzZ5ndMaVCaY7lafOeb6hgru1PjMeWtxXpMnB1YFspWgZKqoaojCwuKno6OhtU0ndZyCSPFoig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzPmIx2EdkgBQVsLXX2NokcliH/QSr/JFD966FoTrwk=;
 b=yrgKlzxXgVtmwPuVUVsWb4m+t5SNnaOvBL6IemVHInUq2G8htuxvOWtSy0/VYf95kQXsqZ0SdHyT2aAYoSZlJDMX1P4lnx+jOblGZNB0r7SC9sROyvUPsA/UBwFQi/BceFfZyROJyQYNKaEsATsLugq55RqpvqLRUiSrjOf0fqudqeV0NXwZ2c6EuZyxGkgT9kVofYqAq68GC2gMIx3X7oW16BN5WGx3dtxvlfP4ri/1FOiUBY7o/d3Lcv570A9uVWGpjwA7ZpgvjQHdJqlQvYfuM8phLNbkR92h5Hr9NWuH47sosAoO++OF3LCQRz36QGREbdL2BdJXb2rc9YWptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzPmIx2EdkgBQVsLXX2NokcliH/QSr/JFD966FoTrwk=;
 b=CkyTxbs3yGkUlPKT5xP8VCiGJ0N/Zoumjqxi950lu+AZmxD0QGZsV+VQ6Nxh14nMiEO4S5qHoNlGahoF79/YP5oIG82FuqSag4ydo/G/IwXzokzqx37zHyseNWWkzkmzm02U1YSn0hFiz1OIOZ8uJdvePZROW8WuV4I1TLUfjFj3zL7TT5fj1R4K8MTbXCbGa5pKLL+Jh4dxOCrwVRcPe8ojlZMTp8fBbc62ePefN4ueBXN6CiP+ZtmYDMWxvp8H8oO8WTny4mi8VToJKt3MYteIDkyPdZjp77fdte0CNUPyH+d44XZujR0Tkma1y5kDKf4ijtjKxbE/sq/QkfOk3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:08:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:08:15 +0000
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
Subject: [PATCH v3 22/33] gpu: nova-core: gsp: send GSP_INIT and decode its reply
Date: Thu, 17 Sep 2026 18:07:08 -0700
Message-ID: <20260918010719.1176945-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb22bc4-27c4-44e5-e8af-08df1521437d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	HxDGUVL470S+jsphnrgJIdIpdS2sVTUCz9DeNelirYxv4frGpU4JDqAMb8pIyCbQpxolFaXfq9wN6EK/W/EYCGq0Ou0Jg1XD+gZN4F8S0hxTbipHAxthB6mKsJMPU6DooLJA5feCTcEr7JHh5uu2JX3442/3Tbjz6sgPEyXhCIqq80WXFLAHFIC6LlTbBr3g5UrqWGaIyNP27zTK/QC0RBZqey88u+tqO/R1AmlrVdOneEAmTVvJrJTZWp/ot9oTyqGaEUcNEY/vSVOsxfSSy/hUrp3/5ECUSG0R2QoZbhoEkOtkhkk0qRrJWiRsfzuWS9qtLMjX1wnVMet/fBwIKKpXTqwRgZGV0xSRq3JLDcHboEE2y1xnf9Ssj+7ZW4DuRDEryzD8gMxvHZs8s3xFJTTt1/TBi5HTl7d90IM3qEfm6SByBV2vFRvVfzAedbf8zPuvljl05yH8PltGSZXKTa8QKvDQwl6TDYFuQr9Ly6vu6DvW2bgQjL2zQ1+/ugj+pODypI+RoZJ3QI5qSDJqLVwQ02tfgDbFVrM17u9vi6MQ6zyqUhzL7F286IZcpBKpe+BBW9gt4SyIEqxmbtvfO3oUe3488vczvqidZvcLn7uscvG5VjgyhsjUZSFn8P/ccL81RF/GUVjsN1/Sui/FvU1lA8+6Qy1uEs3pL1VMK18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xw0S7zYaklmZi264/jgU+KKUdEfQxsnWtZT2eU8iTu0M4zwM4YRSP4WCDdZh?=
 =?us-ascii?Q?thJ4y0f9dGmjuHQzbjlbTIhaoakLvpiZkDOZWzXRqO8tTM5bXlGsJpFrRiOm?=
 =?us-ascii?Q?tBn+Xtn7wXggheVWpDTAquwGarC1RazFrVmwKnokTKqJNahVQGDHCz1lbxt6?=
 =?us-ascii?Q?V8LPUr6+AESKu9gCBIEuxpDvOizLkAhGkl3jATpmNgUWQuU5w37vwuwlW5yo?=
 =?us-ascii?Q?jghwQyU81OP9/VGnT8EnJJ/tlQiGmym7DPxKIV2mLCsaRffW9X3ysyjjsXta?=
 =?us-ascii?Q?HIW70G5XBvI64SM3v1gfLFO8P2uhfvXG4ffT6q74XP+7UYx0QOnpQ90PPAiu?=
 =?us-ascii?Q?3xNcWws4dC1biMEKLIONivH6ibP1UK8v13nwX4bPfxZvP8pX+wNz8TBZwKNt?=
 =?us-ascii?Q?NmDRSWp372bjzywHGsfoou0G5uv3HzxCHFSyvTvsYthRk51l8qsvtYY/FxkZ?=
 =?us-ascii?Q?D6xwFHt6nDnDxCGTC1+lB60+mBr7l0hL80TkePjU9LMVS65T6G8HsgAPBpOn?=
 =?us-ascii?Q?WwLxTPbUKxlrbu/QxxDryOdm7Tst2lRhIytiml8WtjJ/OEQNp0NVwLSm6Q4m?=
 =?us-ascii?Q?8xaPdpaR05nAQ9w2yEFMQ9eIAiGcrjqkUMtsKqJmtt2XbsqdzKwwKzTtvOCj?=
 =?us-ascii?Q?7HfpqZ8FwFs7rUIyrTjmcBjhiH9o4JOqJ9yyj0ORBA/Exi79R9LtHoDKakQe?=
 =?us-ascii?Q?AUaxzv/7Uxo+co8F7YOCal5l5aPkETg8I3lujsTXRc2F3UlhX97+/kZTr900?=
 =?us-ascii?Q?9jQjYPy+squ/L5AFLkj7gVyX2oqg3YgsNZtGChgM8E1+00X6DQbxjaup5RuF?=
 =?us-ascii?Q?fxI5sqiSAphuraQRBO3rY5q2vehKH4cKrZJExi3OHJUOS/dYOa+m17ze/6hk?=
 =?us-ascii?Q?zgv3DxR3dTI7/cbJ+v6RHpv1kc7cAbzydm6B/i7R9ogvdzMZ49nEveYgdUrQ?=
 =?us-ascii?Q?am2mpSSwqQ7kUmty9ye5PpAytGuzFtXR+SWPddoA/5hIS3ac4dlh57VKS8YI?=
 =?us-ascii?Q?fdPrEhUr4eU9c5Z1oZPrXEl88P4d2LSz4Y7RmIBB+8H4Y9mHuLgGlNaecH0l?=
 =?us-ascii?Q?5dweizSe1qXvgxfwzWmWAOVlmCtDyIbbnhm8LJamnOLgtkoU7ETYc4FglhMe?=
 =?us-ascii?Q?cT3iHR2oSjUD6BUFWxT0fKrbkoFCOD+5WgKksthA7zYulpqs9fPy8w1h8hJ/?=
 =?us-ascii?Q?g/Wbs4pCQ/1VUzGo0WkNXGhMqHjqhxlzc+EViwbMoo00ntZ9iobaynybD6i/?=
 =?us-ascii?Q?P8xAC3SfEuRmFxs0jBSk4x/p1y1on26kMOWkgLWD56ztYMOZ9nn1O0oluhfo?=
 =?us-ascii?Q?5Wr/OfsUT+z9HszhGVzwHnL0fZkPGxiH4QKLSFz4yZeV4syHLtAYXrNRpr2i?=
 =?us-ascii?Q?OLWu7DPzONQpxtt97EbKFrWjye/pFr54Wsy/QXjTsrw8sfkZSbcV0PgTsZMN?=
 =?us-ascii?Q?AD0U6zkwGcoxY36/2HZgbyKc26ghixVAb9hLJht7v3+spujrf+1vnXfAEQ1W?=
 =?us-ascii?Q?gtgJ1zJjJqVLKoqqh1g9LYdoEk99UEtIc+BDl7rT5LOB12vr1ld37NgC9/p6?=
 =?us-ascii?Q?98a+1JrE41M5wK2q9FWPeqSoC3yKtZ9BGsZNftRQ5/tz0QlfwnbKs+yodqL6?=
 =?us-ascii?Q?RwAcdq/AMgKTHYDkNj3J0Y8F5OZ0ivHXWmM4MYCZ3uJeanXq9v0CQ04TAlao?=
 =?us-ascii?Q?7DI8x5OUKsyfDHZ9dBasCM4HwGv69hJJLrOUc0A4wdvEokWItXXDzhWz6dFL?=
 =?us-ascii?Q?aeJUYlxMMw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb22bc4-27c4-44e5-e8af-08df1521437d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:52.1917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Bd2AxS3NcUN1sSljR3Vvz/lrt+HPTtSnVrKlIyE4MNkVaNGbubkJb5A8Cgsytw8BWEkOfao64pS+Jlmt5vlJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

GSP-RM answers GSP_INIT only once it has finished starting. To finish
starting, GSP-RM first raises the load-and-execute events and waits for
the driver to service them. So the code that waits for the reply has to
service those events while waiting.

Add the GSP_INIT sender and the wait for its reply. The wait passes each
event that arrives before the reply to a handler that the caller
supplies, and it keeps one deadline from the send however many events
arrive, as the RPC reply wait does. Decode the reply into the static
configuration type that the boot sequence already returns, so that the
rest of the driver reads the same configuration whichever firmware
produced it.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs        | 108 +++++++++++++++++++----
 drivers/gpu/nova-core/gsp/commands.rs    |  99 ++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs          |   7 +-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  55 ++++++++++--
 4 files changed, 241 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index b202bd8185ba..f64a97736ed7 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -625,19 +625,38 @@ pub(crate) fn send_command_no_wait<M>(&self, command: M) -> Result
         self.inner.lock().send_command(command)
     }
 
-    /// Receives one GMC event and passes its command id and payload slices to `handler`.
+    /// Waits for the response to the GMC request with command id `command_id`, and passes every
+    /// other GMC element that arrives first to `on_other`.
     ///
-    /// This method may sleep while waiting. The queue mutex stays locked across the wait and the
-    /// `handler` call, so `handler` must not call back into this [`Cmdq`].
+    /// This method may sleep while waiting. The queue mutex stays locked across the whole wait and
+    /// across the `on_other` and `decode` calls, so neither may call back into this [`Cmdq`].
     ///
-    /// See [`CmdqInner::receive_gmc_and_dispatch`] for the return value and the errors.
-    #[expect(dead_code)]
-    pub(crate) fn receive_gmc_and_dispatch<R>(
+    /// See [`CmdqInner::await_gmc_response`] for the return value and the errors.
+    pub(crate) fn await_gmc_response<R>(
         &self,
-        timeout: Delta,
-        handler: impl FnOnce(u32, &[u8], &[u8]) -> Result<Option<R>>,
-    ) -> Result<Option<R>> {
-        self.inner.lock().receive_gmc_and_dispatch(timeout, handler)
+        command_id: u32,
+        on_other: impl FnMut(&GspGmcMsgElement, &[u8], &[u8]) -> Result,
+        decode: impl FnMut(&[u8], &[u8]) -> Result<R>,
+    ) -> Result<R> {
+        self.inner
+            .lock()
+            .await_gmc_response(command_id, on_other, decode)
+    }
+
+    /// Sends a GMC API request to the GSP without waiting for the response.
+    ///
+    /// # Errors
+    ///
+    /// Errors from [`DmaGspMem::allocate_command`] are propagated as-is.
+    pub(crate) fn send_gmc_no_wait(
+        &self,
+        command_id: u32,
+        payload: &[u8],
+        max_response_size: u32,
+    ) -> Result {
+        self.inner
+            .lock()
+            .send_gmc(command_id, payload, max_response_size)
     }
 
     /// Waits for an unsolicited GSP event of type `M`. Events that arrive before it are logged and
@@ -812,7 +831,6 @@ fn poison(&self, reason: fmt::Arguments<'_>) -> Error {
     /// # Errors
     ///
     /// Errors from [`DmaGspMem::allocate_command`] are propagated as-is.
-    #[expect(dead_code)]
     fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response_size: u32) -> Result {
         let seq = self.seq;
         self.seq = self.seq.wrapping_add(1);
@@ -1204,8 +1222,9 @@ fn consume_element<R>(
 
     /// Receives the next queue element and, if it is a GMC element, passes it to `handler`.
     ///
-    /// `handler` receives the command id and the payload that follows the GMC API header, as two
-    /// slices because the ring may wrap, and returns `None` for an element that it declines.
+    /// `handler` receives the headers that open the element and the payload that follows the GMC
+    /// API header, as two slices because the ring may wrap, and returns `None` for an element that
+    /// it declines.
     ///
     /// Returns `Ok(None)` when `handler` declines the element or when the element is not a GMC
     /// element.
@@ -1220,7 +1239,7 @@ fn consume_element<R>(
     fn receive_gmc_and_dispatch<R>(
         &mut self,
         timeout: Delta,
-        handler: impl FnOnce(u32, &[u8], &[u8]) -> Result<Option<R>>,
+        handler: impl FnOnce(&GspGmcMsgElement, &[u8], &[u8]) -> Result<Option<R>>,
     ) -> Result<Option<R>> {
         self.consume_element(timeout, |this, element| match element {
             QueueElement::Other(_) => {
@@ -1230,18 +1249,73 @@ fn receive_gmc_and_dispatch<R>(
             }
             QueueElement::Gmc(message) => {
                 let header = message.header;
-                let command_id = header.gmc.command_id();
 
                 dev_dbg!(
                     &this.dev,
                     "GSP GMC: event: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
                     header.gmc.sequence,
-                    command_id,
+                    header.gmc.command_id(),
                     header.length(),
                 );
 
-                handler(command_id, message.contents.0, message.contents.1)
+                handler(header, message.contents.0, message.contents.1)
             }
         })
     }
+
+    /// Waits for the response to the GMC request with command id `command_id`, up to
+    /// [`Cmdq::RECEIVE_TIMEOUT`] from the call.
+    ///
+    /// The response's payload is passed to `decode`, as two slices because the ring may wrap.
+    /// Every other GMC element that arrives first is passed to `on_other` with the headers that
+    /// open it and its payload slices, and any other element is logged. Neither kind of element
+    /// extends the deadline.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the response does not arrive before the deadline, however many other
+    ///   elements arrive while waiting.
+    /// - `EIO` if the queue is poisoned or an element fails framing validation (see
+    ///   [`Self::wait_for_element`]), or if the response carries a failure status.
+    ///
+    /// Errors from `on_other` and `decode` are propagated as-is.
+    fn await_gmc_response<R>(
+        &mut self,
+        command_id: u32,
+        mut on_other: impl FnMut(&GspGmcMsgElement, &[u8], &[u8]) -> Result,
+        mut decode: impl FnMut(&[u8], &[u8]) -> Result<R>,
+    ) -> Result<R> {
+        let dev = self.dev;
+        let deadline = Instant::<Monotonic>::now() + Cmdq::RECEIVE_TIMEOUT;
+        loop {
+            let remaining = deadline - Instant::<Monotonic>::now();
+            if remaining.is_negative() {
+                break Err(ETIMEDOUT);
+            }
+
+            let response =
+                self.receive_gmc_and_dispatch(remaining, |header, payload_0, payload_1| {
+                    if header.gmc.command_id() != command_id {
+                        return on_other(header, payload_0, payload_1).map(|()| None);
+                    }
+
+                    let status = header.gmc.status();
+                    if status != 0 {
+                        dev_err!(
+                            dev,
+                            "GSP GMC: command 0x{:x} failed, status={:#x}\n",
+                            command_id,
+                            status
+                        );
+                        return Err(EIO);
+                    }
+
+                    decode(payload_0, payload_1).map(Some)
+                })?;
+
+            if let Some(response) = response {
+                break Ok(response);
+            }
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 2c7965174445..74ae92428cad 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -30,13 +30,21 @@
         },
         fw::{
             self,
-            commands::GspInitRequest,
-            MsgFunction, //
+            commands::{
+                GspInitRequest,
+                GspInitResponse,
+                GspInitResponseSchema, //
+            },
+            GspGmcMsgElement,
+            MsgFunction,
+            GMCAPI_CMD_GSP_INIT, //
         },
         nvkv::{
+            Decoder,
             Encodable,
             EncodedStream,
-            Encoder, //
+            Encoder,
+            UnknownKeyPolicy, //
         },
     },
     sbuffer::SBufferIter,
@@ -287,6 +295,91 @@ pub(crate) fn build_gsp_init_payload(
     Ok(encoder.finish())
 }
 
+/// Largest `GSP_INIT` response that the driver accepts.
+const GSP_INIT_MAX_RESPONSE_SIZE: u32 = 48 * 1024;
+
+/// Sends `GSP_INIT` and returns the static GPU configuration that its reply carries.
+///
+/// Every GMC (GPU Management Controller) element that arrives before the reply is passed to
+/// `on_unsolicited_element` with the headers that open it and its payload, as two slices because
+/// the ring may wrap. The load-and-execute events that GSP-RM raises while it starts arrive this
+/// way.
+///
+/// `payload` is the stream from [`build_gsp_init_payload`].
+///
+/// # Errors
+///
+/// - `EIO` if GSP-RM reports a failure status.
+/// - `ETIMEDOUT` if the reply does not arrive within [`Cmdq::RECEIVE_TIMEOUT`] of the send,
+///   however many events arrive while waiting.
+///
+/// Errors from `on_unsolicited_element` and from decoding the reply are propagated as-is.
+#[expect(dead_code)]
+pub(crate) fn gsp_init(
+    cmdq: &Cmdq<'_>,
+    payload: &[u64],
+    on_unsolicited_element: impl FnMut(&GspGmcMsgElement, &[u8], &[u8]) -> Result,
+) -> Result<GspStaticInfo> {
+    // Qualified because `zerocopy::IntoBytes` also gives `[T]` an `as_bytes`.
+    let payload = AsBytes::as_bytes(payload);
+
+    cmdq.send_gmc_no_wait(GMCAPI_CMD_GSP_INIT, payload, GSP_INIT_MAX_RESPONSE_SIZE)?;
+
+    cmdq.await_gmc_response(
+        GMCAPI_CMD_GSP_INIT,
+        on_unsolicited_element,
+        decode_gsp_init_reply,
+    )
+}
+
+/// Decodes the `GSP_INIT` reply from its payload, which the ring may have split in two, into the
+/// static configuration type that the boot sequence returns.
+///
+/// # Errors
+///
+/// - `EINVAL` if the payload is not a whole number of NVKV words, if the stream is malformed or
+///   omits a required key, or if GSP-RM reported no framebuffer region.
+/// - `ENOMEM` if the words or the decoded regions cannot be allocated.
+fn decode_gsp_init_reply(payload_0: &[u8], payload_1: &[u8]) -> Result<GspStaticInfo> {
+    const WORD_SIZE: usize = size_of::<u64>();
+
+    let len = payload_0.len() + payload_1.len();
+    if len % WORD_SIZE != 0 {
+        return Err(EINVAL);
+    }
+
+    let mut words = KVVec::with_capacity(len / WORD_SIZE, GFP_KERNEL)?;
+    let mut bytes = SBufferIter::new_reader([payload_0, payload_1]);
+    for _ in 0..len / WORD_SIZE {
+        let mut word = [0u8; WORD_SIZE];
+        bytes.read_exact(&mut word)?;
+        words.push(u64::from_le_bytes(word), GFP_KERNEL)?;
+    }
+
+    let decoder = Decoder::new(&words, UnknownKeyPolicy::Ignore);
+    let mut schema = GspInitResponseSchema::default();
+    let decoded = KBox::try_init(decoder.decode(&mut schema)?, GFP_KERNEL)?;
+
+    let mut gpu_name = [0u8; GspInitResponse::MAX_GPU_NAME_LEN];
+    let name = decoded.gpu_name();
+    gpu_name
+        .get_mut(..name.len())
+        .ok_or(EINVAL)?
+        .copy_from_slice(name);
+
+    let mut usable_fb_regions = KVec::new();
+    for region in decoded.usable_fb_regions() {
+        usable_fb_regions.push(region, GFP_KERNEL)?;
+    }
+
+    Ok(GspStaticInfo {
+        gpu_name,
+        bar1_pde_base: decoded.bar1_pde_base(),
+        usable_fb_regions,
+        total_fb_end: decoded.total_fb_end().ok_or(EINVAL)?,
+    })
+}
+
 pub(crate) use fw::commands::PowerStateLevel;
 
 /// The `UnloadingGuestDriver` command, used to shut down the GSP.
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index e86283f67358..cc0bc8f8ae87 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1048,13 +1048,17 @@ pub(crate) struct GmcApiHeader {
     /// Sequence number that GSP-RM copies from a request into its response.
     pub(crate) sequence: u64,
     /// In a request, the largest response that the sender accepts. In a response, the `NV_STATUS`.
-    pub(crate) max_resp_or_status: u32,
+    max_resp_or_status: u32,
     reserved: [u32; 5],
 }
 
 /// Bits of [`GmcApiHeader::command`] that hold the command id. The high byte holds flags.
 const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
 
+/// GMC request that carries the system information and registry keys to GSP-RM. GSP-RM answers
+/// it with the static GPU configuration once it has finished starting.
+pub(crate) const GMCAPI_CMD_GSP_INIT: u32 = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT;
+
 /// GMC event that requests the driver to run the generic falcon bootloader on the descriptor that
 /// the event carries.
 pub(crate) const GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: u32 =
@@ -1097,7 +1101,6 @@ pub(crate) fn command_id(&self) -> u32 {
     ///
     /// The value is meaningful only on a response, which GSP-RM marks with a flag in the command
     /// word. In a request, the same word holds the largest response that the sender accepts.
-    #[expect(dead_code)]
     pub(crate) fn status(&self) -> u32 {
         self.max_resp_or_status
     }
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 4fdd6ff23dc1..748639942fe1 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -455,10 +455,7 @@ pub(crate) fn new(
 // Should decode with UnknownKeyPolicy::Ignore.
 nvkv_decode! {
     /// Schema for the `GSP_INIT` response.
-    // TODO: expect() doesn't work here due to Self:: reference, fixed in 1.97.0
-    // https://github.com/rust-lang/rust/pull/154377
-    #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))]
-    struct GspInitResponseSchema => GspInitResponse {
+    pub(crate) struct GspInitResponseSchema => GspInitResponse {
         gpu_name:
             Array<u8, { GspInitResponse::MAX_GPU_NAME_LEN }, { Self::GPU_NAME_STRING_KEY }>,
         fb_regions: Accumulated<FbRegionSchema>,
@@ -475,15 +472,61 @@ impl GspInitResponseSchema {
 }
 
 /// Payload of the `GSP_INIT` response.
-struct GspInitResponse {
+pub(crate) struct GspInitResponse {
     gpu_name: ArrayVec<u8, { Self::MAX_GPU_NAME_LEN }>,
     fb_regions: KVVec<FbRegion>,
     bar1_pde_base: u64,
+    #[cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
     vmmu_segment_size: u64,
 }
 
 impl GspInitResponse {
-    const MAX_GPU_NAME_LEN: usize = 64;
+    pub(crate) const MAX_GPU_NAME_LEN: usize = 64;
+
+    /// Tag of a general-purpose region. Any other tag marks a region that GSP-RM reserves for the
+    /// use that the tag names.
+    const FB_REGION_TAG_NONE: u32 = 0;
+
+    /// Returns the GPU name, which GSP-RM sends with its NUL terminator.
+    pub(crate) fn gpu_name(&self) -> &[u8] {
+        self.gpu_name.as_slice()
+    }
+
+    /// Returns an iterator over the FB regions from which the driver may allocate: the
+    /// general-purpose regions that are not protected and that support both compression and
+    /// isochronous access.
+    pub(crate) fn usable_fb_regions(&self) -> impl Iterator<Item = Range<u64>> + '_ {
+        self.fb_regions.iter().filter_map(|region| {
+            if region.limit >= region.base
+                && region.tag == Self::FB_REGION_TAG_NONE
+                && !region.flags.protected()
+                && region.flags.support_compressed()
+                && region.flags.support_iso()
+            {
+                region.limit.checked_add(1).map(|end| region.base..end)
+            } else {
+                None
+            }
+        })
+    }
+
+    /// Returns the exclusive end of the FB physical address space, which spans every region
+    /// including the ones that [`Self::usable_fb_regions`] leaves out.
+    ///
+    /// Returns `None` if no region that GSP-RM reported has a limit at or above its base.
+    pub(crate) fn total_fb_end(&self) -> Option<u64> {
+        self.fb_regions
+            .iter()
+            .filter(|region| region.limit >= region.base)
+            .map(|region| region.limit)
+            .max()?
+            .checked_add(1)
+    }
+
+    /// Returns the BAR1 page directory entry base address.
+    pub(crate) fn bar1_pde_base(&self) -> u64 {
+        self.bar1_pde_base
+    }
 }
 
 nvkv_decode! {
-- 
2.55.0

