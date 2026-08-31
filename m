Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73521345CAA
	for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 01:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138621; cv=fail; b=ArYZ77u+fMdUACw7hV8KNbk9JxV/q9o+OzzwZAcPNJ7zgIf/QMGqpAPjqj2XcJRK4sFCVcA2yX3xEMhxR0OdqN7XkK4tLx9a7Uy0FS2f6PJCr4R5h4jqEjkaTwWNkRhzxRDm2Sfb1F1JNrf95HIVcuF31J39I7pbHTUqpNAHvbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138621; c=relaxed/simple;
	bh=CMai7uF6VKUMiD8a3u0jNj85mgMcJowdCmyEHP1G4Ow=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NXAV4mBtfg2bwe7AC+kiuYDPpcvTXZkXjnG9qmrxUhmCCpFV3q2iLx69fKA5xf5s3WuInx9d69nBDxTPIEL/ayfpFkYwW3v1m6YTULf9ZYZJE22pK3dQao6YL7tLxLN1Ah2oSkI8Ubddioq9+mwGArUp2BwZxLV7GH3bAV/wfLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YTVoeQ+H; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YTVoeQ+H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sm/MGUfic9KBUqH7gxTR2RlHWSH3pftX1j8pvrC1Wz+41hq5oq/gNsXTAatOvNkSJzqaHlG1YbszMOLgsabMYng2mtUOr3xKpg+JqU5cW95MciFLLp6KOuRN0u2gnkvp3edwv8lBZqWhpyb5PONclYLajZgcUKkYugx8Ge5FPqIzsqkwTt0t8r5nBRnSbfnBldWmeJqXV6yd3jjkfHFBqSQqMh1eoybsaIp/Qp9xmPh/d7gMqB95/Jdg1LM7Sjbhbn+EXfXpX6PHFeyWo/lc3EAjkpQVklnLViAXIlR5NAjmBPvZl2ZARbWjoJtMxtrbwCFSB7g4W5fOUjxUXdpajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMai7uF6VKUMiD8a3u0jNj85mgMcJowdCmyEHP1G4Ow=;
 b=I2lsmKhQyrLgOXGW+URj+Q8Uu8AIV1hLBjzsiKAufw1VOqAl9Y1h664lxT9bgIJhosKH5Jw7x6tl5AgF50Ln6VS5gqaPcOaWfDqHpRcgNIqYCK0pl4NVO74pKC8ht4bwFuxHTLY8rGQasOheZoD6v5HCqu2pqj6yKkKG/YkBiFMzh7h5XCbV2NnQWMpt8uIgDjYYm4NF/mbRQngDN8xcXSyLWJFyMgngxgDbzPub4szmCxjNAxuE7gthQPvdTOrXzgWslfNMl/vC4WYHw9deVuj7OKMrkC+zn3PBIVQts5dqWH3uP/NIED+qeuCzOL6NiJVZ8T5Kr+DqVYIuG9EBBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMai7uF6VKUMiD8a3u0jNj85mgMcJowdCmyEHP1G4Ow=;
 b=YTVoeQ+HCDusdJXSrdfGfno4lLlcb3Ypbs5uqKBHpfGJmw3w/mKds1CXHSAmINzFiI7miUURUM+GtvqH3sbBd1/ouh4IkDE/NWNHSF3ni4UhxqWObbZPHtRgeQiZbEih9tJBVoY3Qq0RJwc0dtLSPA9rpAVm0jXZw8sf5oRGW/qJjmuSmtgQJqkrsluggH7IWLi5RDdAwoxZd++CCQZrTdORj2BZNGRdDm3hn3d7lVwfcsf7aMcnvBi9lOZaIolDjBaulNVK6LKb5lIKhMKOpDxm0mJ6x41R7Im67pg1fjOqlMimkRDiuLnx7OQ44ieoaTy35uSoBAbnKfoUoQwV5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 31 Aug
 2026 01:10:16 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 01:10:16 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 10:10:08 +0900
Message-Id: <DL2Q8GEJC0Q1.1BGW83JEMED5G@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH v2 02/15] rust: sync: completion: add
 wait_for_completion_timeout()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829012243.496697-3-jhubbard@nvidia.com>
In-Reply-To: <20260829012243.496697-3-jhubbard@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0136.jpnprd01.prod.outlook.com
 (2603:1096:604:25c::11) To PH7PR12MB6858.namprd12.prod.outlook.com
 (2603:10b6:510:1b4::20)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 3528af29-e566-4495-8d3b-08df06fc9b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|23010399003|11063799006|22082099003|18002099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	dzsoxYX9RVlD0W9W33x43Zn0UxzhU9OrnyXcdiko1bnu3LUy0J4DB5dvvIzTjcLyZVg5HL2iK5RFCzEj8xHQoNbWVos7YIT/dlqxQqfeOYiry+Ls6YcoL7bw1YarhNtpeOz1DK0Y31LUpM16n7A4rnNB7L5Gdytz1j9BSQsjesTH6KapYXdTgTQI+fY5MGXQpPKP5qlZCEa/O4yuiYTTYvdThjhDBwBQXsGD3pkxpoj9uxHVxdcyPORxDnBSTW8i5m+E1vlxeCaJ4rM6rOfI/Ts3JN91kww3YiYvAHOPnVZ3EHl6LqwVV+ZXvc2wJXUYhbE6gkYlg/5N7HpoEFSb1NXbmL/ThAK5dSUD+aHWe2mEFz3UCT9BZ00KWve+VNx2W5PgiKCp+j2L1f/SS9Qv4hinro73OXmsPXlGVltCxCAbx11JI70+P1PRJECc3kB1G/SztfjdW9ZjmfMQ4I3jPRhj6clPwA6XY8oKEbuJ2v48DR/SES3GK6d6Tl5lo0LGhtHWNucmT3fGm/98mUFyhxcNA7yhHlFpgufTLTeOU46gzch/YRoZCPke0TmCFa7s2qopAXzPqsnJWxyorcHHyqFq6rXBTYn7aJcav9btwGDLX10QyoPaJ/p/bYzbde5HiYsM/01FHh8hgpoSIE7O/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(23010399003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEMvZzdmMjZ5MFlMejN3bHUvZjQzbGpYNVc4ZS85ejhFdjRUV2t2YWRqOUsv?=
 =?utf-8?B?MUhZeWdCWkJSQlNqZnZhSUc5SXl6bWZYc2JmSjYxdG8wTTlXbFBhckozakNr?=
 =?utf-8?B?TnpOVTdEK01OMHpmbEQvbk1JQkpuMDRzYVF3VVlrRWxRcFVxSVYrYmZJaXNs?=
 =?utf-8?B?QVBLQVFqeUtPWi9kWTJTRlN1V3FYTmlHOWZFVlk1Qzc5NExBamNzeEZzT3FW?=
 =?utf-8?B?TlZQR2liamFNQ2E0T0VTZHJ4QUkrR2puUk9QQlU2UWNZck9sUjUxOFp1OXQ5?=
 =?utf-8?B?ekN1bzdYb3k1Q0xRQ0M5UTdJanB1VUNZdGNKZ1gwN0x4bzcwcklmL2NxRUF6?=
 =?utf-8?B?SFJxMVA4UUtTN1VFRDkvMmtIR0E2bHZXeitYV2Y0cGlveVAwVVFJdmpVczBY?=
 =?utf-8?B?WjcxZnpJaDNPS1poaEhPM3ZkdHZBTjVYU1ZBOXhHQ0FwSU5rSkhHWThzMkho?=
 =?utf-8?B?bkIwRVR4MnhkZk9qdWRvUE1iaUlyQ3hwOURDMnpVSkFyOVlTR0k3YUZsY1JT?=
 =?utf-8?B?N3NyRGl5Y1hwbVE1Ujg0YTFRY0cyVGxHVDc4dityc3NkbWNwUlBoSVQ3eTAz?=
 =?utf-8?B?TmhuMExYZHA1YllEbWFyYS9vWjluTnppZmNWbFJkQjBiOXVjbG5weEx0Sk9U?=
 =?utf-8?B?cHBSVXFJbDRKTmtZOUlEQVJBQmhjcjFJeUJVYS9PL1hNM3pPUDM3Nkk1Z0JV?=
 =?utf-8?B?VmFkOUdVQzlLTENocmNlZ3l1SEtaMUZiSHdta2VwUUFPb3ZSV2cvZ0ZXVnhm?=
 =?utf-8?B?bGZsYkhsNkl1QmkrSUNOMHBxTm5KN09LT0VON1NDR1J2UU9ZQVhZRk52bFdt?=
 =?utf-8?B?cFNHNWpTdmRNcElyWFN0WjIvODdQVDRYTnpidlRsM2FNZXp4QUd6VXRHbm95?=
 =?utf-8?B?YmJuMWNVN1B4bThHVVNnc3I2QmRiSTlyaFh5T3VSUzBjMzBoRWpIUEtwQ3kv?=
 =?utf-8?B?cjBoSStaSDdvOXdJUEtlb3VZT1NaRXRLVWthWjZVZTJPbmJrSW9XakQ2aWdF?=
 =?utf-8?B?d3ZJNllSMVNpdU55RXN4V2FiU2VNTWoxVTRuMVBsNW84WThVakVDUysvY3N4?=
 =?utf-8?B?Y0NsZ2dPVU1zQU1WSTF3SVVDdk5UTmFYM3NTMTExc3h1Y0ZOeDdhcE84bmhY?=
 =?utf-8?B?TmVmTnN0R0MxZFJySVZpKzhJcVlwcGtkd2Y2MGE1SU9qcEUrYTdRbFhZVnlz?=
 =?utf-8?B?Y083M3ExeExndW1qaUlqUGN3OHZjbmxSU2FQbElJTmR3ZHBsZW42S0d6aUNw?=
 =?utf-8?B?WmYyK1NNU09ndnVYNk5xQWZLYzFCUkNBdjN2THEvWVU5Q0xmWjhYVEVxbmdn?=
 =?utf-8?B?c2RBNkJzT2dZYUQyUUNaYWpNL09VWGlCZHJiamV3anp5MlUrbWladlVhZWVC?=
 =?utf-8?B?cDdkaVFwejI3bTVydHo2UWVLRnRkWEZocE1rNmEyQ0ZDaDQxWGdwUFo0d1FG?=
 =?utf-8?B?SGRLdXhqLzZIN29sSEN5UGU1cGM1Rno0M3JMRXNnWmdVK0M1OUFLQmNpdmRa?=
 =?utf-8?B?VFJRQU5oczNKYU1aVW9IN3ExblFnblB1VGVLbDJFOGROYjJvZ2xsTDJuOWtw?=
 =?utf-8?B?WjFvUkZmNVVjcVJnbktGYWhtTVc0OUZBL3gydDJzd2NaZG52aHNmbituM3ov?=
 =?utf-8?B?RjV6Rzl5VWEreHN2VVVuV3BrNmJuN0NGMVdPc2o2anhvc1BhZFNvRmhNdnRo?=
 =?utf-8?B?S0FIVzNCZjRvY1QwaDlRSUZRbUM5ZnhaNmszdGlyendvdkhXaGpZWVN0eG5I?=
 =?utf-8?B?VytkTzhoVDQ3WDc4V1cwOU9VbU1nRFdScEdTN2lORFpMRjhsTUNXR1ExYUFK?=
 =?utf-8?B?V1VMZ0lzajR6dGhVTnd5SGRvYWRVSW8ydm9jSi8zTEJxQkZERUhVZGFVM0RO?=
 =?utf-8?B?cXRwaEJyTDFGa2plRDI5alF4WUYrRkNHTjRmMFFneW9jdk1Sc2pQNVl4clBZ?=
 =?utf-8?B?UEFoQXB1YVNPWFM3RzNMcEpsMFJPTVBOUk8waWJIVnhISGl4VzN2SUNqQVAv?=
 =?utf-8?B?YjVsVjRmWnFMNXB0QXhJdFN3NnBUeW04allhMTBjc3lyZXFla3NLaFFLU05M?=
 =?utf-8?B?YktvM2tzbFk1dk0vTFRmOVBPL2JlM1dSNHd3MXFXQ1ZLV3diYTlHTW5wMnpC?=
 =?utf-8?B?QzlIbE84Y3EwTi80T1Bodk1NT1FoM09QUGI0ZmtjZnVhWTEyTlBiQTVyeDlJ?=
 =?utf-8?B?dldvOVV0bGpHWCtxRlhkY3FVWFp6dkRJNmNUQlFwcFlucGtlTm5telhwZmhD?=
 =?utf-8?B?anlWa09BM3FtenJ3RnUrTUxXZFhSRGVJcjFmdlJHT2NKWDVNczBsTkIxclZ1?=
 =?utf-8?B?L3Q1TElZaTN6RE5vcTZCUDRoR1JwY3lvZ1hyVEpkUG5MYjQ1QUtObzBvc3RH?=
 =?utf-8?Q?bjYCqqTf2gvuVApgPSLjEIVvHkQRys1uxqWaojnGr5Ayk?=
X-MS-Exchange-AntiSpam-MessageData-1: YR2Tq1TcPTvhkQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3528af29-e566-4495-8d3b-08df06fc9b4b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6858.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 01:10:16.3848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yxdgy65zUXr2M7fKTCmR4tX5Pli1TidM0tHDE3XQb7xMW0c8kXhEvrJMEbFx6wriDIL3QSWBKYxqK5ijtm3QFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119

On Sat Aug 29, 2026 at 10:22 AM JST, John Hubbard wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> A driver that runs an interrupt self-test during probe waits for the
> handler to fire. wait_for_completion() has no timeout, so a broken
> interrupt path stalls probe indefinitely. Add a timeout variant of
> wait_for_completion().
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> [jhubbard: return the remaining jiffies]
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Wish I took a look earlier; this patch could have been merged through
the rust tree before the merge window opened. Now I guess we will need
to take it into `drm-rust-next` as part of this series. Not a big deal
though, unless other potential users appear this cycle.
