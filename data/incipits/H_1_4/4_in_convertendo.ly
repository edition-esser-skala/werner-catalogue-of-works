\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*4
    r2 r r4 h''
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.*4
    r2 r r4 d'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.
    fis4^\solo h h h8 h h[ e] d![ c]
    h4 g g fis g h
    a8[ h] cis4 d e8[ fis] g4 g,
    g a \grace g fis2\trill g4 d'^\tutti
  }
}

SopranoLyrics = \lyricmode {
  Tunc re -- ple -- tum est gau -- di -- %2
  o os no -- _ strum, et
  lin -- gua no -- stra ex -- ul --
  ta -- ti -- o -- ne. "Con -"
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 h'^\solo a g8[ fis] e4 fis8[ g]
    \grace e dis4. dis8 e4 fis g fis8[ e]
    d4 e c2\trill h4 r
    d \tuplet 3/2 4 { e8[ fis g] } fis4 e d c
    h \tuplet 3/2 4 { a8[ h c] } a2 g
  }
}

AltoLyrics = \lyricmode {
  In con -- ver -- ten -- do
  Do -- mi -- nus ca -- pti -- vi --
  ta -- tem Si -- on,
  fa -- cti __ su -- mus si -- cut
  con -- so -- la -- ti.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.*4
    r2 r r4 h^\tutti
  }
}

TenoreLyrics = \lyricmode {
  "Ma -"
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.
    r2 r4 dis^\solo e fis
    g c a d, g g
    fis8 fis e e d4 c!8 c h4 e
    d c d2 g,4 g'^\tutti
  }
}

BassoLyrics = \lyricmode {
  Tunc di -- cent
  in -- ter gen -- _ tes: Ma --
  gni -- fi -- ca -- vit Do -- mi -- nus fa -- ce --
  re cum e -- is. "Ma -"
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    e4-\solo g a h c a
    h a g dis e fis
    g c a d, g, g'
    fis e d c! h e
    d c d d, g g'-\tutti
  }
}

BassFigures = \figuremode {
  r1.
  <_+>2 <6>4 r2 <6>4
  r2 <7>4 <_+>2.
  r4 <6\\>2. r4 <6>
  <6 4> <6 5> <4> <3>2.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
