\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    r2 r8 g'' g g
    e4 r r8 e e16( d) e8
    f4 r8 d16 e fis4~ fis16 g a8~
    a g16 fis g4~ g8 f16 e f4
    e a2 fis4
    gis8 e( dis) fis( e) c( h) a(
    gis) c( h) a \hA h4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    r2 r8 b'4 d8
    cis4 r r8 cis cis16( h?) \hA cis8
    d a f' d4 c c8
    b4. a16 g a8 a d4
    c4. a8 f' d c c
    h gis( fis) a( \hA gis) a( \hA gis) c(
    h) a( gis) fis \hA gis4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    d4.^\tutti d8 b'4 r
    r8 g g16[ f g8] e'4 r
    r8 a, f' d4 c! c8
    b4. a16[ g] a8 a d4
    c4. a8 f' d c c
    h e dis8[ fis] e[ c h a]
    gis[ c h a] \hA h e,4 e8
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e
  e -- lei -- son,
  e -- lei -- _ son, e --
  lei -- _ son, e -- lei --
  son, e -- lei -- son, Ky -- ri --
  e e -- lei -- _
  _ son, Ky -- "ri -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    r2 r8 g'4^\tutti g8
    e4 r r8 e e16[ d e8]
    f4 r8 d16[ e] fis4~ fis16[ g a8]~
    a[ g16 fis] g4. f16[ e] f4
    e a2 fis4
    gis8 gis fis[ a] \hA gis[ a \hA gis c]
    h[ a gis fis] \hA gis4 r
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  son, e -- lei --
  _ _ _
  son, Ky -- ri --
  e e -- lei -- _
  _ son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    r2 r8 b4^\tutti d8
    cis4 r r8 cis cis16[ h \hA cis8]
    d4 r r8 a4 fis8
    d4 d' d4. h8
    gis e r a d4 a
    r8 h h e, r2
    R1
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  son, e -- lei --
  son, e -- lei -- _
  _ son, e -- lei -- son,
  e -- lei -- son,
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    r2 r8 d4^\tutti d8
    d4 r r8 d d4
    d r r8 d d4
    d4. d8 d2
    e4 f d dis
    e2 r
    R1
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri --
  e e -- lei --
  son, e -- lei --
  son, e -- lei --
  son, e -- lei -- _
  son,
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Largo"
    d4-\tutti r r8 d d d
    d4 r r8 d d d
    d4 r r8 d d d
    d2~ d
    e4 f d dis
    e1~-\markup \remark "con pedale"
    e2. r4
  }
}

BassFigures = \figuremode {
  r2 r8 <6- 4>4.
  <7\\ 4 2>2 r8 <\t \t \t>4.
  <8 5 3>2 r8 <7 _+>4.
  <6- 5>8 \bassFigureExtendersOn <6- 4>16 <6- _+> <6- 4>4 \bassFigureExtendersOff <5 \t> <\t 3>8 <6! \t>
  <6 _+>4 <5>2 <7 5>4
  <_+>1
  r
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
