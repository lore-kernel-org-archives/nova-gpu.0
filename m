Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793870642;
	b=Nr5fsp/ebqpsMxphMv81H7GARO+UUGQPhxLEN+CilBsEt5m38rhmddDGnKl0qMZW96xG
	 7C837Tq+EMUv6Qf675oeLPVuva7p6nW4jmVLVSUcBEThKr0b/WDp7YJPvbQsoW60PiOXH
	 18TrHvYwBIDlw4dbBVB0av7oBM/iXaiMvIkVw2Cr+NBQnER46RqPX6PUaUaiZTXXAdB1t
	 In0wC9vtaGViPHp7LFx5OuMB1Q9/eg+eHBwMLMSz0fD97jg5XVq86VsKj3mxzKgV4vEwD
	 u+9yk9gKyG1YdyDbPG3ISN31fjyptuvHqrxTQHLYiFWwWurBfAbFuQghYOrwL2wrqsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870642;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jMw4laW0/tb3po2Tw7BZiAqUqOvL63RNxv5LXWtC8LA=;
	b=xqyaVM82/Z/If8mfriaaMIlqz9fkOHJdlR4BhffEdNvWpF09sTxKtmQjkLn5Bk6Ueorc
	 exEqlLRqYuNupxP2VWCfVVVh62JGG3RaaYed9ZXLxE+38itkKXJU7YPuSe2qXXBnFgF75
	 /c/fJdnZkRRiq3oynyDzJnwDVKja3SJdzyXbJUPrPzPN398KJeQMsQnEvIjfYAOvCPbEI
	 PQOPUNlES2FjJQejYQqRDkntfrCmKfevhPxlfijR2kNQP8nQA7yhF28sQtse4m8EAeW1T
	 NlMn22/gEyhzlQBA/qc8aKWqaUulbqiPXLkLzvrz2JM86I3HOWvou3BgybHtlDR9xKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GpRILNOR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.40
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011040.outbound.protection.outlook.com [40.93.194.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0D4606A32E
	for <nova-gpu@lists.linux.dev>; Thu,  5 Nov 2026 09:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0D4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GpRILNOR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBUjjDU+CgZQC/OWoZ+oUbyBbtb2KUHvdorOW6JlTtSUJoXnEc8Uyht8xNULZ3hpdFHMLkUbmfYJpQThk72fg9pQBddhNiCWwiw0zuft4oAOofllbeCnpRGewNrRgt/Hv54NqsOTFv713U2EjkLY03+pGODiOnuUb4FgWG1ll+NfAKb5HIhiuGQD4vhxt8n8mRY/Ql8cPm21vutWk0vx7vmn4lTjt2Ic2HgOVL2miNQcrDCrgNtyxLhHXjKqXRA/7/WtnlZ3qUIXhnI1p4ET+bugonFX9szvvxThl4lqIx+xAuy76b6YoJoMlYlo+V5aP30mlwcVBrCpmMm/P9Nb6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMw4laW0/tb3po2Tw7BZiAqUqOvL63RNxv5LXWtC8LA=;
 b=oIShCZnuB69/vheeKsaS2ef4ddddppCgjD82M0wFU7z9VukQNWMqqd9O0SQ40Zs63THOSFxxsmMUCi9LNfbMT52vt5VwHFtLOAFeAYS3RBiaUUcvNX5lG/dq7PerjbNdj0zpeWurzdPkO+1QNw4zQ29ecZGU/M6mzCc3w1Pflchmcnb0+/3MjimfhBmVYAxvfc1DA/6u+XiLvCuekAGYDo+9Bn5BKeymyIgGtwA7HjFale26cmSnFJH56CHBsfaVK37l5fmBdF2f/1X78QM1rqo44k79sfw3Gn9x1fpw/TMDp/Z7Ck8VNiUAfki6YEE0CGQrqqMMmtauLmS3stpIMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMw4laW0/tb3po2Tw7BZiAqUqOvL63RNxv5LXWtC8LA=;
 b=GpRILNORDf5d/qDynIWUkjynArshltyjBhaqZxOZssapvP5D51/Qg+KnV2UTCNWz34QPGr7jSBJ/K0ZI4osYN4491+eIb6Ye3H8TLn0FDpWbnL65BJfbdscg1wKH2snd75RMQHSn5CsYfU4IXn05M9q/gWTRwONAUN0vgbShRqbV5lbtL1tgpLtWYhklv78Iz8h7GZ0ARuG3W3GaVuWQ0uOnGpSgf4khPuL7oRuGf3F411aVnbEvKmHB+YxopJlCn0Q7Tbdgi6d9TV7nVh0ys+jTZD1HG76qFgPqG4UwkiYAXYx2yKS/RBcHY4HFZxZqHADlU2/jAxgoPb7EkW7lVA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SJ2PR12MB9085.namprd12.prod.outlook.com (2603:10b6:a03:564::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 09:23:56 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 09:23:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 18:23:52 +0900
Message-Id: <DMN62G2CDG3N.ETT4GRFXWKKU@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 4/4] gpu: nova-core: gsp: cmdq: add the GMC receive path
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
 <20261103-r000_rebase_on_cmdq-rpc-v1-4-189f9ff3bfd2@nvidia.com>
In-Reply-To: <20261103-r000_rebase_on_cmdq-rpc-v1-4-189f9ff3bfd2@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0080.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::15) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SJ2PR12MB9085:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b177b25-8e70-4b5c-86c6-08df3b1e841b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|1800799024|261102123227099003|260925021311599003|260925021911599003|260925022911599003|261022075727099003|5023799004|11063799006|4143699003|261009223027099003|56012099006|261021135927099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261021123027099003|22082099003|18002099003|10067099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qdsLB8f/9N8dzBt0AHvPntnimggEb9BYvnLwieU296Hr54RiGlAc/2N2mLTYi0kq/L4M5KWCqxD23dRYlJtKcqt1Zy/q3tr8IK720Lho5wMJOB3/GvHeOrvQVg0bq+V0C/NKo9WVNb/pu8l0TutSIXLoAIghibDEBlVbVc72EEfkk0ZOpf+hgVKZU5hxf6Q4qQg7G2hmGa0l0YOSlNtZaQlS79EocMLWMYILOpl4GvBbNfZa5vYNqhj1Z20eX5yfO9y96YYQC0Qzftfn4qZqy86y3CdS4iFrlJDOiGFhP2av73+nl8q5v5wA7RAfLsP0LuEx8PtHbqOwOaOSF8nsL6rgiMe4yG6w3xzTAVtLnKMQWmO+rmoTIWLL4UjYtFqDdz31lZJ6hRvv3MqAEpNV7yaks3mIryXzxHGB9bGj494KVcIxFreq0gtKuFLRES5Mq9CUUZEj9L2cjqg9khXuZK6jfIb1CZj+ZLTAmseDlyfhjGmxlM4qtsNrfq+JyBA0fc40DszZmE2KL/V13UoVRZzYnm54vnXyqKIl50/uPBax3Pl2L8PxATMpZQ1RPIFRbM2Qms929D4/MMXr0va1uoYtDFzGXypv6IGxBeeftgdyuXOdsG/ZpSZf+H2AcUUZ56xdgbGzYPvCDsXsLwv6uBamyTPl5yMSgDn19A3OWNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(1800799024)(261102123227099003)(260925021311599003)(260925021911599003)(260925022911599003)(261022075727099003)(5023799004)(11063799006)(4143699003)(261009223027099003)(56012099006)(261021135927099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(22082099003)(18002099003)(10067099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0V2aTduNEZNM0wrL0ZnUUh2VTR0SXgzMElKQzBNNkxMWERTS2RhZENnUExM?=
 =?utf-8?B?eFlMZXVpVjR4UDVzZnBMMkNjbHNwT0VUNWpla2RteGY0NlVadmhaSE9GVTZX?=
 =?utf-8?B?YlNaclNTYzQ5Z2RCbnE4RFUxVlpoZ0lUNEkraStzUVR4V09rYUhFSmdNSk43?=
 =?utf-8?B?NnVlU0dibXFlQU96MGZucnBBUVJXRld1L2ZmTlN5T1Y1V1VHSGlwVXQrRXRE?=
 =?utf-8?B?eXAwcmd5NGJxUW00SVhLMWUydWNpL2RkRzZQcHRnYklFVjF1SE52RE1ENk5k?=
 =?utf-8?B?S2J6T1ZnZk9vdEE1dVI1eVdZa2sxcXdueGdrVWlBeWl4OFZWcStUb252TCt5?=
 =?utf-8?B?Qm9pYm9veFVtR09OMjhpUHV1Nmh5NWlzc3k5VEVwWnJtclo4TFNIZVg3ZG8v?=
 =?utf-8?B?TWlmbkJMZzc3Rkc3U0luMStMNmxJQnlSQXpnemRValljWDB4SlVhaStxNXlo?=
 =?utf-8?B?bkNMQlVSMnErZ1NmbDVhL0o1ZUVtc0crVFVPYkdQTHRsaE5XMk1TWWt0dllP?=
 =?utf-8?B?Q3YrODZiZ1llYW1oNjkvOVJBektwam45ODVxemptOU9yU1FhRTBpZzNJSHIx?=
 =?utf-8?B?MUxhRTQxSExMN05RRDFjNGdmelEvNDhaSEJOdjdrTUdENForSGo1bnloamdo?=
 =?utf-8?B?SG1aaXdSTjFCK3I4VnhVMGxJR09CTENkTjN1d1NaUVNEWmVXMUtEd2pPaTBT?=
 =?utf-8?B?bkFma0ZCNlZyc24vdjRzV3lSNWY4a1ZNOUpabzNjZWc1c3kvOUV0eGtKcTNR?=
 =?utf-8?B?eCtHc0doRUJJOHgxY2p2K3h6L1JyRFZlQkhnN3I1RjB2Z0ZDalJaMFliNERH?=
 =?utf-8?B?Y0RSNFBFMHNmMTFNTUY2N010L25KL3pvS1VLM0YvMWpKN2lUMXEycTFGRExh?=
 =?utf-8?B?b2hhM0FISXljWThsaEpXVmU5b3hySmNNYVNaVUM5aHFKemNKdzgybWtFYnh5?=
 =?utf-8?B?aTdMTklqMUE2NmhvMzlOdnQ1TXJvTVl4MjRSZzlHZVFnRXYySHRhV01vZGtW?=
 =?utf-8?B?eU14bHprNmpScDFERC9abnRlVWJNU25YclFMRWJQUnYwQlg0YXMrUkg3czYw?=
 =?utf-8?B?Z1hvWmtocDVIOUZnOXlneS9VZFNtczBTaERJMXV1cUd5a1ozVU1KeFE3ekQw?=
 =?utf-8?B?Q1AyVjRNWlN5UFhrbitoT012L3g5ZmJZV2RNQkUzZzRiZkcvczZJUVdBMTNO?=
 =?utf-8?B?TGpER0FLdk02OHVlaVo5SHVmTVFLUUFOTDh2YzVxTUYzMFh0K2owT21lazM4?=
 =?utf-8?B?YzU3MDZNZFNZdzVKZkNqU3p1ay90eFdvMTdNK2tzQldycGFWcWI1MEwvRVJv?=
 =?utf-8?B?elBlRHphMnJWK2g4aG80Yzd1THdTeHIrenhtdHdPY3hhZWtyNlhEOVlVN0xo?=
 =?utf-8?B?eitBMEp1N0F5ZXZiUmhvQ0dJZlU2bk8wMlFsd3lMTHVWbGhhd01NVlZaeDVw?=
 =?utf-8?B?N3BCaS9VSEhaTGR5Nk5lcUpyTDNLbWR0U3FiRUtxbEpCdk5sc1BabHNaSmli?=
 =?utf-8?B?ZlVXVkxoR2xoTFIzZktOWC8wckN3MUxFcFFVcisybjcrOEl2QzdLa1FtOHZU?=
 =?utf-8?B?a2xoaU1waGM3a0JsQ2pDT1YzTWlxNDYyR0M3QUhjbmloUFRXbnB5ZUx6MDYr?=
 =?utf-8?B?amtiL0J5Y1hGVll6eEoyK2pMcHlFS2NIODNrb1J4QXp1Y2FYVFdOM25IN1Zn?=
 =?utf-8?B?TUJxS0k0NnNOWVgzeGtFUWk2YlYzb3VoMG9yOUlWUllSQ3Fva1Y2UG5VdHEz?=
 =?utf-8?B?RXljbEdKODZMdnVzUXIrUUlPTjg5ZlRFVGVsTWVCVHU2KzMvNGZUTkc5blA4?=
 =?utf-8?B?VjhyQ051aERja1VsY3JCMmM2RE5NczlDWlBqdFJ2MG9taHNldEJDQU5sTng2?=
 =?utf-8?B?b0IxTStSWjlvLzhJNUt5ZHJ5NHpkQ3Q3UEtFeXlwOGthTWRuZGRCWHB2QW9q?=
 =?utf-8?B?c3RSTUNtcGRObnlVanNueWZPVWllYkV2UHpOMnlXUGd0K0FPMEx5SmUzeWxp?=
 =?utf-8?B?VG9aRm1qOXU1RU1ZSlliMTNqdVJqWURsUStWN1pmV3NvbFdIREpGWVVQTjZZ?=
 =?utf-8?B?WWs0Z25KcE9taFlqQUdVUWhpYWNuekVaK1dFaXI0Y29WL1hiWitDeXFiTDVK?=
 =?utf-8?B?dU13ckxZQ0EzTDQxckpGQmxmZjNPeUpkOGU2ZllERGdISzBTWkc5MVhVcEp4?=
 =?utf-8?B?RjBVamtIc1EwR1hXb3BpVG5rK0JFak1VQVNjcWRwVjlWQzFxNERZWWl5SWlq?=
 =?utf-8?B?WDBMenF0SEtObktlNW9XaTJHSFcxRlJjNHA3ZjZ4VTBkc21DRXkwcWtEbGRW?=
 =?utf-8?B?UXJzbHNvRlFYSC81aVQ5WUVGNlJUVXE4d2FnU1d5NEw5UDkvMnpVSlg2dTBL?=
 =?utf-8?Q?+vj6Q6NhJoPqdYrVY/eZgRgBSJgjP9evU7Mmwzd2y5D56?=
X-MS-Exchange-AntiSpam-MessageData-1: s3xB7voF98zZjg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b177b25-8e70-4b5c-86c6-08df3b1e841b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 09:23:56.2866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geq7vn83IgN81R7YX4ft+g4FALtmV3Am36WvEzNPl+Vuz9//7oZ9ZiXNrjJtGwjDVTrxjhn9IDVpZDNc8yfOeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9085

On Tue Nov 3, 2026 at 9:02 AM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> GSP-RM answers a GMC request with a GMC message whose command word
> carries the response flag and the id of the request, and whose sequence
> number is that of the request. It also raises GMC events, named by a
> command id. During boot, the load-and-execute events arrive while the
> driver is waiting for the GSP_INIT reply, and GSP-RM only answers once
> they have been handled.
>
> Add the receive side of the gmc sub-module, mirroring the
> already-existing rpc sub-module.
>
> The transport cannot produce GMC messages yet: the r570 queue element
> header does not carry the type of the message it transports, so the Gmc
> variant of GspParsedMessage is only constructed once the switch to r000
> makes the transport dispatch on the NVDM type. The RPC receive path and
> drain() account for it by logging unclaimed GMC messages.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs     |   7 ++
>  drivers/gpu/nova-core/gsp/cmdq/gmc.rs | 230 ++++++++++++++++++++++++++++=
+++++-
>  drivers/gpu/nova-core/gsp/cmdq/rpc.rs |   8 +-
>  drivers/gpu/nova-core/gsp/fw.rs       |   1 -
>  4 files changed, 243 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 629ab8d35f87..a1fa7a3b4079 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -420,6 +420,12 @@ struct GspMessage<'a> {
>  enum GspParsedMessage<'a> {
>      /// A [RPC message](rpc::RpcMessage).
>      Rpc(rpc::RpcMessage<'a>),
> +    /// A [GMC message](gmc::GmcMessage).
> +    //
> +    // The transport header of the r570 firmware carries no message type=
, so this variant cannot
> +    // be constructed before the switch to r000.
> +    #[expect(dead_code)]
> +    Gmc(gmc::GmcMessage<'a>),
>  }
> =20
>  impl GspParsedMessage<'_> {
> @@ -427,6 +433,7 @@ impl GspParsedMessage<'_> {
>      fn log(&self, dev: &device::Device) {
>          match self {
>              GspParsedMessage::Rpc(rpc) =3D> rpc.log(dev),
> +            GspParsedMessage::Gmc(gmc) =3D> gmc.log(dev),
>          }
>      }
>  }
> diff --git a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs b/drivers/gpu/nova-cor=
e/gsp/cmdq/gmc.rs
> index b035f30479a8..9adba5cbcd5c 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
> @@ -29,7 +29,9 @@
>  use super::{
>      Cmdq,
>      CmdqInner,
> -    CommandElement, //
> +    CommandElement,
> +    GspMessage,
> +    GspParsedMessage, //
>  };
> =20
>  /// Trait implemented by types representing a GMC command to send to the=
 GSP.
> @@ -150,7 +152,167 @@ fn write(&self, dev: &device::Device, seq: u32, dst=
: &mut GspCommand<'_>) -> Res
>      }
>  }
> =20
> +/// Trait representing GMC messages received from the GSP.
> +///
> +/// These can be either replies to sent commands that expect a reply, or=
 an event not bound to any
> +/// command.
> +pub(crate) trait MessageFromGsp: Sized {
> +    /// Id of the command this is the reply to.
> +    const COMMAND: GmcCommandId;

What about removing "COMMAND" here, and have `await_gmc_reply` take the
CommandToGsp type, returning C::Reply (where C::Reply: MessageFromGsp)?
That removes needing to define a bidirectional mapping which could
become out of sync. Also, if this is going to be used for "an event not
bound to any command" then it's better not to specify `COMMAND` imo.

> +
> +    /// Error type returned by [`MessageFromGsp::read`].
> +    type InitError;
> +
> +    /// Method reading the reply from the payload of the message and ret=
urning it.
> +    fn read(
> +        payload: &mut SBufferIter<core::array::IntoIter<&[u8], 2>>,
> +    ) -> Result<Self, Self::InitError>;
> +}
> +
> +/// A GMC message ready to be processed from the message queue.
> +pub(crate) struct GmcMessage<'a> {
> +    // Reference to the GMC API header of the message.
> +    header: &'a GmcApiHeader,
> +    // Slices to the payload of the message. The second slice is empty u=
nless the message loops
> +    // over the message queue.
> +    contents: (&'a [u8], &'a [u8]),
> +}
> +
> +impl<'a> GmcMessage<'a> {
> +    /// Validate the GMC layer of `element` and returns its GMC API head=
er and its contents trimmed
> +    /// down to the GMC payload.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EIO` if the element is shorter than the GMC API header, or th=
an the payload length
> +    ///   advertised by the GMC API header.
> +    pub(super) fn parse(dev: &device::Device, element: GspMessage<'a>) -=
> Result<GmcMessage<'a>> {
> +        let GspMessage {
> +            contents: (slice_1, slice_2),
> +            ..
> +        } =3D element;
> +
> +        // The GSP message header and the GMC API header together are gu=
aranteed to fit entirely
> +        // into a single page, so it's ok to only look at `slice_1` here=
.
> +        let (gmc_header, slice_1) =3D GmcApiHeader::from_bytes_prefix(sl=
ice_1).ok_or(EIO)?;
> +        let payload_size =3D gmc_header.payload_size();
> +
> +        dev_dbg!(
> +            dev,
> +            "GSP GMC: receive: seq# {}, command=3D{:?}, length=3D0x{:x}\=
n",
> +            gmc_header.sequence(),
> +            gmc_header.command(),
> +            payload_size,
> +        );
> +
> +        // Check that the driver read area is large enough for the messa=
ge.
> +        if slice_1.len() + slice_2.len() < payload_size {
> +            return Err(EIO);
> +        }
> +
> +        // Cut the message slices down to the actual length of the messa=
ge.
> +        let (slice_1, slice_2) =3D if slice_1.len() > payload_size {
> +            // PANIC: we checked above that `slice_1` is at least as lon=
g as `payload_size`.
> +            (slice_1.split_at(payload_size).0, &slice_2[0..0])
> +        } else {
> +            (
> +                slice_1,
> +                // PANIC: we checked above that `slice_1.len() + slice_2=
.len()` is at least as
> +                // large as `payload_size`.
> +                slice_2.split_at(payload_size - slice_1.len()).0,
> +            )
> +        };

Consider sharing a helper for this (with the RPC code which does the same t=
hing).
The split_at_checked also IMO simplifies the code.

```
fn message_prefix<'a>(
    (s1, s2): (&'a [u8], &'a [u8]),
    len: usize,
) -> Option<(&'a [u8], &'a [u8])> {
    match s1.split_at_checked(len) {
        Some((p, _)) =3D> Some((p, &[])),
        None =3D> s2.get(..len - s1.len()).map(|rest| (s1, rest)),
    }
}
```

> +
> +        Ok(GmcMessage {
> +            header: gmc_header,
> +            contents: (slice_1, slice_2),
> +        })
> +    }
> +
> +    /// Returns the GMC API header of the message.
> +    pub(crate) fn header(&self) -> &'a GmcApiHeader {
> +        self.header
> +    }
> +
> +    /// Returns the payload of the message.
> +    ///
> +    /// The second slice is empty unless the message loops over the mess=
age queue.
> +    pub(crate) fn payload(&self) -> (&'a [u8], &'a [u8]) {
> +        self.contents
> +    }
> +
> +    /// Returns the status code of this message if it is the reply to `c=
ommand` sent with sequence
> +    /// number `seq`, `None` otherwise.
> +    fn is_reply_to(&self, command: GmcCommandId, seq: u32) -> Option<u32=
> {
> +        if matches!(self.header.command().id(), Ok(id) if id =3D=3D comm=
and)
> +            && self.header.sequence() =3D=3D u64::from(seq)
> +        {
> +            self.header.status()
> +        } else {
> +            None
> +        }
> +    }

What about calling this "reply_status" since it returns an optional
reply status?

> +
> +    /// Logs an event, meaning a message that no caller was waiting for.
> +    ///
> +    /// A reply that nobody claimed (e.g. one that arrived after its req=
uest timed out) and an
> +    /// unknown command id are logged at warning level. Other events are=
 not logged.
> +    pub(super) fn log(&self, dev: &device::Device) {
> +        let command =3D self.header.command();
> +        let seq =3D self.header.sequence();
> +
> +        match command.id() {
> +            Ok(id) if command.is_response() =3D> {
> +                dev_warn!(dev, "unclaimed GSP GMC reply to {:?} (seq {})=
\n", id, seq);
> +            }
> +            // Nothing to do for the remaining known command ids.
> +            Ok(_) =3D> {}
> +            Err(_) =3D> {
> +                dev_warn!(dev, "unknown GSP GMC command {:?} (seq {})\n"=
, command, seq);
> +            }
> +        }
> +    }
> +}
> +
>  impl Cmdq<'_> {
> +    /// Sends `command` to the GSP and waits for the reply.
> +    ///
> +    /// GMC events that arrive before the reply are passed to `on_event`=
, and RPC messages are
> +    /// logged and consumed. The boot sequence relies on this to handle =
the load-and-execute
> +    /// events that GSP-RM raises before it answers `GSP_INIT`.
> +    ///
> +    /// The queue is locked for the entire send+receive cycle, including=
 the calls to `on_event`,
> +    /// to ensure that no other command can be interleaved. `on_event` m=
ust thus not use the queue.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EMSGSIZE` if the command does not fit in a single command que=
ue element.
> +    /// - `ETIMEDOUT` if space does not become available to send the com=
mand, or if the reply does
> +    ///   not arrive within [`Self::RECEIVE_TIMEOUT`] of the send, howev=
er many events arrive
> +    ///   while waiting.
> +    /// - `EIO` if the variable payload requested by the command has not=
 been entirely
> +    ///   written to by its [`GmcCommand::init_variable_payload`] method=
, or if the reply carries

[`GmcCommand::init_variable_payload`] =3D>
[`CommandToGsp::init_variable_payload`]? Can you check the doclinks?

> +    ///   a status other than `NV_OK`.
> +    ///
> +    /// Error codes returned by the command and reply initializers, and =
by `on_event`, are
> +    /// propagated as-is.
> +    pub(crate) fn send_gmc_command<C>(
> +        &self,
> +        command: C,
> +        on_event: impl Fn(&GmcMessage<'_>) -> Result,
> +    ) -> Result<C::Reply>
> +    where
> +        C: CommandToGsp,
> +        C::Reply: MessageFromGsp,
> +        Error: From<C::InitError>,
> +        Error: From<<C::Reply as MessageFromGsp>::InitError>,
> +    {
> +        let mut inner =3D self.inner.lock();
> +        let seq =3D inner.send_gmc_command(command)?;
> +
> +        inner.await_gmc_reply(seq, on_event)
> +    }
> +
>      /// Sends `command` to the GSP without waiting for a reply.
>      ///
>      /// # Errors
> @@ -191,4 +353,70 @@ fn send_gmc_command<C>(&mut self, command: C) -> Res=
ult<u32>
>      {
>          self.send_command_element(GmcCommandElement(command))
>      }
> +
> +    /// Receives the reply of type `R` to the command sent with sequence=
 number `seq`, waiting up
> +    /// to [`Cmdq::RECEIVE_TIMEOUT`] from the call.
> +    ///
> +    /// Any GMC event that arrives first is passed to `on_event`, and an=
y RPC message is logged.
> +    /// Neither extends the deadline.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if the reply does not arrive before the deadline, =
however many other messages
> +    ///   arrive while waiting.
> +    /// - `EIO` if a message fails framing or checksum validation, or if=
 the reply carries a status
> +    ///   other than `NV_OK`.
> +    ///
> +    /// Error codes returned by [`MessageFromGsp::read`] and by `on_even=
t` are propagated as-is.
> +    fn await_gmc_reply<R: MessageFromGsp>(
> +        &mut self,
> +        seq: u32,
> +        on_event: impl Fn(&GmcMessage<'_>) -> Result,
> +    ) -> Result<R>
> +    where
> +        // This allows all error types, including `Infallible`, to be us=
ed for `R::InitError`.
> +        Error: From<R::InitError>,

Currently, we have this flow:
await_gmc_reply -> await_msg_with -> consume_element -> closure

`consume_element` returns Result<R>. The outer Result is a transport
level result. The inner R is a gmc/rpc level object, and it has the
contract that ENOMSG means drain this element. In `await_gmc_reply` we
provide the closure which is doing this gmc/rpc level job, and also
asking the `MessageFromGsp` to decode itself plus getting the nvstatus.=20

I think that `await_gmc_reply` should return Result<Result<R>> (and
Result<Result<R, NvStatus>> in the future, or even Result<Result<R,
NvStatus>, CmdqError>). For example, if we add an NvStatus enum and have
it convertible to ernno, then later someone adds a conversion to ENOMSG,
it could trigger this. And semantically, there is a difference between a
successfully received reply that had a failed status vs a failed/borked
reply. The RPC code also has this issue where it doesn't distinguish
between a successfully received reply which conveys a failed status vs
borked reply (actually, we don't even check the status for RPC, which
isn't good).

It's also worth considering adding a custom error type enum that has
Drain or something instead of using ENOMSG - then we can encode drain in
the type system and make it impossible for decoder/encoder
implementations to affect cmdq control flow.

Another reason to do this is that the later vGPU code [1]  (see
`CeUtilsAllocError`) needs to distinguish this case - explicitly failed
command vs transport failure.

[1]: https://lore.kernel.org/all/6fbf38e3622a135c662443155513976898b1ab68.1=
790580105.git.zhiw@nvidia.com/


> +    {
> +        let dev =3D self.dev;
> +
> +        self.await_msg_with(|message| {
> +            let gmc_message =3D match message {
> +                GspParsedMessage::Gmc(gmc_message) =3D> gmc_message,
> +                _ =3D> {
> +                    message.log(dev);
> +                    return Err(ENOMSG);
> +                }
> +            };
> +
> +            match gmc_message.is_reply_to(R::COMMAND, seq) {

It's possible if we hit a timeout earlier, to get an old reply here
(`is_response` is true but one or both of the sequence number or command
id doesn't match). In that case IMO we should log and return Err(ENOMSG)
rather than calling `on_event`, because it feels odd for `on_event` to
receive things with `is_response` true.

> +                // Message is not the reply to our command, log it.

Comment says it'll log, but it only calls "on_event".

> +                None =3D> {
> +                    on_event(&gmc_message)?;

It's probably worth a note that if `on_event` returns Err(ENOMSG) then
it'll skip (drain) that event. So Ok(()) and Err(ENOMSG) are equivalent
here, which is a bit odd.

> +                    return Err(ENOMSG);
> +                }
> +                // Reply has an error status.
> +                Some(status @ 1..) =3D> {

Ok for now, but maybe a TODO to add the NvStatus enum? I sent a patch
adding it before [2]. It will probably be more important to delineate
the transport vs message vs content layer errors if we do this.

[2]: https://lore.kernel.org/all/20260418-rmcontrol-v4-2-fda8c76dbb95@nvidi=
a.com/
