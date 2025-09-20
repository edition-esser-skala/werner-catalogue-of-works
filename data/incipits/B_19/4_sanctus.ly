\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    R1*3
    r2 a'4 f'~
    f8 e gis, d'~ d c16 h c4\trill
    h cis\trill d8 b4 g8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    R1*2
    r2 d4 b'~
    b8 a cis, g'~ g f16 e d e f g
    a8 gis16 fis e8 fis gis4 a16 e a8~
    a g4 f16 e f8 d r4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    R1*3
    r2 a'4^\tutti f'~
    f8[ e gis, d']~ d[ c16 h] c4
    h cis d8 b4 g8
  }
}

SopranoLyrics = \lyricmode {
  San -- _
  _
  _ _ _ _ ctus,
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    R1*2
    r2 d4^\tutti b'~
    b8[ a cis, g']~ g[ f16 e] d[ e f g]
    a8[ gis16 fis?] e8[ fis] gis4 a16[ e a8]~
    a g4 f16[ e] f8 d r4
  }
}

AltoLyrics = \lyricmode {
  San -- _
  _
  _ _ _ _
  _ _ _ ctus,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    R1
    a4^\tutti f'4. e8[ gis, d']~
    d[ c16 b!] a[ b c a] b8.[\trill a32 g] f!8[ g]~
    g[ f g e'] a,4 r
    R1
    r2 r4 g
  }
}

TenoreLyrics = \lyricmode {
  San -- _ _
  _ _ _
  ctus,

  "san -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
    d4^\tutti b'4. a8[ cis, g']~
    g[ f16 e] d8[ a16 h] c8.[ d16] e[ fis gis e]
    a8.[ g16] fis[ g e \hA fis] g8 g d[ e]
    f4 e d r
    R1
    r2 d4 b'!
  }
}

BassoLyrics = \lyricmode {
  San -- _ _
  _ _ _
  _ _ _ ctus, san --
  _ _ ctus,

  san \hy
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Larghetto"
    << {
      s1
      a'4 f'4. e8 gis, d'~
      d c16 b! a b c a
    } \\ {
      \oneVoice d,4-!-\tutti b'4.-! a8-! cis,-! g'~-!
      \voiceTwo g f16 e d8 a16 h c8. d16 e fis gis e
      a8. g16 fis g e \hA fis
    } >> g8 g d e
    f4 e d \clef soprano << {
      f''~
      f8 e gis, d'~ d c16 h c4
      h cis
    } \\ {
      d,16 e f g
      a8 gis16 fis? e8 fis gis4 a16 e a8~
      a g~ g f16 e
    } >> \clef bass d,4 b'~
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <5 3>4 <6->8 <\t>
  <4 2> <3 1> <6\\> <3> <5 4> <\t 3>4.
  r1
  r2 <5>8 <6-> <6>4
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
        \set Staff.instrumentName = "b"
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
